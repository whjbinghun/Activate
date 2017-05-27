#include "http-encrypt.h"
#include "mission_log.h"
#include <QScriptEngine>
#include <QScriptValueIterator>
#include "http-signal.h"
#include "http-api.h"

HttpEncrypt::HttpEncrypt(QString str_passwd)
    : ms_passwd( str_passwd )
{
    QString str_param = QString( "password=%1" ).arg( str_passwd );
    QString str_system_param = gs_passwd_encrypt + "?";

    set_header( str_system_param );
    QByteArray array;
    array.append( str_param );
    set_req_params(array);
}

void HttpEncrypt::process_response( QString str_result )
{
    MissonLog::instance()->write_test_log( this->get_test_url() );
    MissonLog::instance()->write_test_log( str_result );

    QScriptEngine engine;
    QScriptValue sc = engine.evaluate("value=" + str_result);
    QString str_encrypted_password = sc.property("encrypted_password").toString();
    QString str_salt = sc.property("salt").toString();

    HttpSignal::instance()->sig_passwd_encrypt( 0, "获取信息成功", str_encrypted_password, str_salt );
    this->deleteLater();
}

void HttpEncrypt::process_error( int n_err )
{
    HttpSignal::instance()->sig_passwd_encrypt( n_err, "网络连接错误", "", "" );
    this->deleteLater();
}
