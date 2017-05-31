#include "http-auto-login.h"
#include "mission_log.h"
#include <QScriptEngine>
#include <QScriptValueIterator>
#include "http-signal.h"
#include "http-api.h"

HttpAutoLogin::HttpAutoLogin(QString str_uuid, QString str_seqno, QString str_account, QString str_passwd)
    : ms_uuid( str_uuid )
    , ms_seqno( str_seqno )
    , ms_account( str_account )
    , ms_passwd( str_passwd )
{
    QString str_param = QString( "username=%1&password=%2" ) \
            .arg( str_account ).arg( str_passwd );

    QString str_header = QString( "?uuid=%1&seqno=%2").arg( ms_uuid ).arg( ms_seqno );
    QString str_system_param = gs_login_api +str_header;

    set_header( str_system_param );
    QByteArray array;
    array.append( str_param );
    set_req_params(array);

    UserInfo st_userInfo;
    m_st_userInfo = st_userInfo;
}

void HttpAutoLogin::process_response(QString str_result)
{
    MissonLog::instance()->write_test_log( this->get_test_url() );
    MissonLog::instance()->write_test_log( str_result );

    QScriptEngine engine;
    QScriptValue sc = engine.evaluate("value=" + str_result);

    m_st_userInfo.str_uuid = sc.property("uuid").toString();
    m_st_userInfo.str_account = sc.property("username").toString();
    m_st_userInfo.str_display_name = sc.property("display_name").toString();
    m_st_userInfo.str_avatar_url = sc.property("avatar_url").toString();
    m_st_userInfo.str_seqno = sc.property("seqno").toString();

    HttpSignal::instance()->sig_auto_login( 0, "自动登陆验证成功", m_st_userInfo );
    this->deleteLater();
}

void HttpAutoLogin::process_error(int n_err)
{
    HttpSignal::instance()->sig_auto_login( n_err, "自动登陆验证失败", m_st_userInfo );
    this->deleteLater();
}
