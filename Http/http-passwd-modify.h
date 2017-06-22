#ifndef HTTPPASSWDMODIFY_H
#define HTTPPASSWDMODIFY_H

#include "http-req-res.h"

/**
 * @brief The HttpPasswdModify class 登陆密码修改
 */

class HttpPasswdModify : public HttpReqRes
{
    Q_OBJECT
public:
    explicit HttpPasswdModify(QString str_uuid, QString str_seqno, QString str_old_passwd, QString str_new_passwd );
protected:
    void process_response(QString str_result);
    void process_error( int n_err );
private:
    QString ms_uuid;
    QString ms_seqno;
    QString ms_old_passwd;
    QString ms_new_passwd;
};

#endif // HTTPPASSWDMODIFY_H
