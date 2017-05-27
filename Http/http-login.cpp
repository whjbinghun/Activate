#include "http-login.h"
#include "mission_log.h"
#include <QByteArray>
#include "http-signal.h"
#include <QScriptEngine>
#include <QScriptValueIterator>
#include "common-struct.h"
#include "http-api.h"

HttpLogin::HttpLogin(QString str_account, QString str_passwd , QString str_salt)
    : ms_account( str_account )
    , ms_passwd( str_passwd )
    , ms_salt( str_salt )
{
    QString str_param = QString( "username=%1&password=%2&salt=%3" ) \
            .arg( str_account ).arg( str_passwd ).arg( str_salt );
    QString str_system_param = gs_login_api + "?";

    set_header( str_system_param );
    QByteArray array;
    array.append( str_param );
    set_req_params(array);
}

void HttpLogin::process_response(QString str_result)
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

    HttpSignal::instance()->sig_login( 0, "获取信息成功", m_st_userInfo );
    this->deleteLater();
}

void HttpLogin::process_error( int n_err )
{
    emit HttpSignal::instance()->sig_login( n_err, "", m_st_userInfo );
    this->deleteLater();
}
