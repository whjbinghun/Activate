#include "http-passwd-modify.h"
#include "mission_log.h"
#include <QScriptEngine>
#include <QScriptValueIterator>
#include "http-signal.h"
#include "http-api.h"

HttpPasswdModify::HttpPasswdModify( QString str_uuid, QString str_seqno, QString str_old_passwd, QString str_new_passwd )
    : ms_uuid( str_uuid )
    , ms_seqno( str_seqno )
    , ms_old_passwd( str_old_passwd )
    , ms_new_passwd( str_new_passwd )
{
    QString str_param = QString( "old_passwd=%1&new_passwd=%2" ) \
            .arg( str_old_passwd ).arg( str_new_passwd );

    QString str_header = QString( "?uuid=%1&seqno=%2").arg( ms_uuid ).arg( ms_seqno );
    QString str_system_param = gs_login_api +str_header;

    set_header( str_system_param );
    QByteArray array;
    array.append( str_param );
    set_req_params(array);
}

void HttpPasswdModify::process_response(QString str_result)
{
    MissonLog::instance()->write_test_log( this->get_test_url() );
    MissonLog::instance()->write_test_log( str_result );

    QScriptEngine engine;
    QScriptValue sc = engine.evaluate("value=" + str_result);

    QString str_uuid = sc.property("uuid").toString();
    QString str_seqno = sc.property("seqno").toString();
    if( str_uuid == ms_uuid && str_seqno == ms_seqno ) {
        QString str_new_passwd = sc.property("new_passwd").toString();

        HttpSignal::instance()->sig_passwd_modify( 0, "密码修改成功", str_new_passwd );
    } else {
        HttpSignal::instance()->sig_passwd_modify( -1, "密码修改失败", "" );
    }
    this->deleteLater();
}

void HttpPasswdModify::process_error(int n_err)
{
    HttpSignal::instance()->sig_passwd_modify( n_err, "密码修改失败", "" );
    this->deleteLater();
}
