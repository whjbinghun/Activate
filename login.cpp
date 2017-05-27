#include "login.h"
#include "single-verification.h"
#include "single-config.h"
#include "http-signal.h"
#include <QtNetwork>
#include "common.h"

Login::Login(QObject *parent)
    : QObject(parent)
    , mb_auto_login( false )
    , ms_account( "" )
    , ms_passwd( "" )
{
    init_ctrl();
    init_connect();
}

Login::~Login()
{

}

void Login::send_account( QString str_account, QString str_passwd )
{
    ms_account = str_account;
    ms_passwd = str_passwd;
    SingleVerification::instance()->send_passwd_encrypt( str_passwd );
}

bool Login::get_auto_login()
{
    return mb_auto_login;
}

void Login::set_auto_login( bool b_auto_login )
{
    mb_auto_login = b_auto_login;
}

void Login::clear_user_info()
{
    mb_auto_login = false;
    ms_account = "";
    ms_passwd = "";
}

void Login::init_ctrl()
{
    SingleConfig::instance()->load_config_info();
    ConfigInfo st_config_info = SingleConfig::instance()->get_config_info();
    if( st_config_info.str_uuid.isEmpty() || st_config_info.str_account.isEmpty()
            || st_config_info.str_passwd.isEmpty() || st_config_info.str_seqno.isEmpty() ) {
        mb_auto_login = false;
    } else {
        ms_account = st_config_info.str_account;
        ms_passwd = st_config_info.str_passwd;
        SingleVerification::instance()->auto_login( st_config_info.str_uuid, st_config_info.str_seqno, ms_account, st_config_info.str_passwd );
    }
}

void Login::init_connect()
{
    connect( HttpSignal::instance(), SIGNAL(sig_passwd_encrypt(int,QString,QString,QString)), this, SLOT( slot_passwd_encrypt( int, QString, QString, QString ) ) );
    qRegisterMetaType< UserInfo > ( "UserInfo" );
    connect( HttpSignal::instance(), SIGNAL(sig_login(int,QString,UserInfo&)), this, SLOT( slot_login( int , QString, UserInfo& ) ) );
}

void Login::slot_passwd_encrypt( int n_status, QString str_msg, QString str_encrypted_passwd, QString str_salt )
{
    Q_UNUSED( str_msg )
    if( n_status != QNetworkReply::NoError ) {
        emit sig_warning( "验证错误，请重新点击登陆按钮" );//显示到登陆界面中
    } else {
        ms_passwd = str_encrypted_passwd;
        SingleVerification::instance()->send_account( ms_account, str_encrypted_passwd, str_salt );
    }
}

void Login::slot_login( int n_status, QString str_msg, UserInfo &st_user_info )
{
    switch ( n_status ) {
    case QNetworkReply::NoError://认证成功，登录
    {
        mb_auto_login = true;
        //保存到配置文件中
        ConfigInfo st_config_info = SingleConfig::instance()->get_config_info();

        st_config_info.str_account = st_user_info.str_account;
        st_config_info.str_passwd = ms_passwd;
        st_config_info.str_seqno = st_user_info.str_seqno;
        st_config_info.str_uuid = st_user_info.str_uuid;
        if( st_config_info.str_server_ip.isEmpty() ) {
            st_config_info.str_server_ip = gs_server_ip;
        }

        SingleConfig::instance()->set_config_info( st_config_info );
    }
        break;
    case QNetworkReply::AuthenticationRequiredError:
    {
        emit sig_warning( "账号认证失败!" );
        mb_auto_login = false;
    }
        break;
    default:
        break;
    }
}
