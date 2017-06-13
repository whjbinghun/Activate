#include "login.h"
#include "single-verification.h"
#include "single-config.h"
#include "http-signal.h"
#include <QtNetwork>
#include "common.h"

Login::Login(QObject *parent)
    : QObject(parent)
    , mb_remember_account( false )
    , mb_ver_success( false )
    , ms_account( "" )
    , ms_passwd( "" )
    , ms_username( "" )
{
    //init_ctrl();
    init_connect();
}

Login::~Login()
{
    qDebug()<<"Login::~Login()";
}

void Login::send_account( QString str_account, QString str_passwd )
{
    ms_account = str_account;
    ms_passwd = str_passwd;
    SingleVerification::instance()->send_passwd_encrypt( str_passwd );
}

//向服务器端发送激活信息
void Login::send_active_info( QString str_active_info )
{

}

bool Login::get_remember_account()
{
    return mb_remember_account;
}

void Login::set_remember_account(bool b_remember_account)
{
    mb_remember_account = b_remember_account;

    //把修改写入配置文件中
    ConfigInfo st_config_info = SingleConfig::instance()->get_config_info();
    st_config_info.b_remember_account = mb_remember_account;
    SingleConfig::instance()->set_config_info( st_config_info );
}

void Login::clear_user_info()
{
    ms_account = "";
    ms_passwd = "";
}

QString Login::get_login_account()
{
    return ms_account;
}

void Login::set_login_account(QString str_account)
{
    ms_account = str_account;
}

QString Login::get_login_passwd()
{
    return ms_passwd;
}

void Login::set_login_passwd(QString str_passwd)
{
    ms_passwd = str_passwd;
}

QString Login::get_username()
{
    return ms_username;
}

void Login::set_username(QString str_username)
{
    ms_username = str_username;
}

void Login::show_login( bool b_show )
{
    emit sig_show_login( b_show );
}

void Login::init_ctrl()
{
    SingleConfig::instance()->load_config_info();
    ConfigInfo st_config_info = SingleConfig::instance()->get_config_info();

    if( st_config_info.b_remember_account ) {
        ms_account = st_config_info.str_account;
    }
    emit sig_remember_account( st_config_info.b_remember_account );

    if( !st_config_info.str_uuid.isEmpty() && !st_config_info.str_account.isEmpty()
            && !st_config_info.str_passwd.isEmpty() && !st_config_info.str_seqno.isEmpty() ) {

        ms_account = st_config_info.str_account;
        ms_passwd = st_config_info.str_passwd;
        ms_username = st_config_info.str_display_name;
        SingleVerification::instance()->auto_login( st_config_info.str_uuid, st_config_info.str_seqno, ms_account, st_config_info.str_passwd );
    }
}

void Login::init_connect()
{
    connect( HttpSignal::instance(), SIGNAL(sig_passwd_encrypt(int,QString,QString,QString)), this, SLOT( slot_passwd_encrypt( int, QString, QString, QString ) ) );
    qRegisterMetaType< UserInfo > ( "UserInfo" );
    connect( HttpSignal::instance(), SIGNAL(sig_login(int,QString,UserInfo&)), this, SLOT( slot_login( int , QString, UserInfo& ) ) );
    connect( HttpSignal::instance(), SIGNAL(sig_auto_login(int,QString,UserInfo&,bool)), this, SLOT( slot_login( int , QString, UserInfo&, bool ) ) );
}

void Login::slot_passwd_encrypt( int n_status, QString str_msg, QString str_encrypted_passwd, QString str_salt )
{
    Q_UNUSED( str_msg )
    switch ( n_status ) {
    case QNetworkReply::NoError:
    {
        ms_passwd = str_encrypted_passwd;
        SingleVerification::instance()->send_account( ms_account, str_encrypted_passwd, str_salt );
    }
        break;
    case QNetworkReply::UnknownServerError:
        emit sig_warning( tr("连接认证服务器失败，请联系服务器人员") );
    default:
        emit sig_warning( tr("验证错误，请重新点击登陆按钮") );//显示到登陆界面中
        break;
    }
}

void Login::slot_login( int n_status, QString str_msg, UserInfo &st_user_info, bool b_auto_login )
{
    Q_UNUSED( str_msg )

    switch ( n_status ) {
    case QNetworkReply::NoError://认证成功，登录
    {
        if( !b_auto_login ) {
            //保存到配置文件中
            ConfigInfo st_config_info = SingleConfig::instance()->get_config_info();

            st_config_info.str_account = st_user_info.str_account;
            st_config_info.str_passwd = ms_passwd;
            st_config_info.str_seqno = st_user_info.str_seqno;
            st_config_info.str_uuid = st_user_info.str_uuid;
            st_config_info.str_display_name = st_user_info.str_display_name;
            if( st_config_info.str_server_ip.isEmpty() ) {
                st_config_info.str_server_ip = gs_server_ip;
            }

            SingleConfig::instance()->set_config_info( st_config_info );

            ms_account = st_config_info.str_account;
            ms_passwd = st_config_info.str_passwd;
            ms_username = st_config_info.str_display_name;
        }

        mb_ver_success = true;
        emit sig_ver_success( mb_ver_success );
    }
        break;
    case QNetworkReply::AuthenticationRequiredError:
    {
        emit sig_warning( "账号认证失败!" );
        mb_ver_success = false;
        emit sig_ver_success( mb_ver_success );
    }
        break;
    default:
        break;
    }
}
