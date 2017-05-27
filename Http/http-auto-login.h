#ifndef HTTPAUTOLOGIN_H
#define HTTPAUTOLOGIN_H

#include "http-req-res.h"

/**
 * @brief The HttpAutoLogin class  自动登陆
 */

class HttpAutoLogin : public HttpReqRes
{
    Q_OBJECT
public:
    explicit HttpAutoLogin( QString str_uuid, QString str_seqno, QString str_account, QString str_passwd );

protected:
    void process_response(QString str_result);
    void process_error( int n_err );

private:
    QString ms_uuid;
    QString ms_seqno;
    QString ms_account;
    QString ms_passwd;
};

#endif // HTTPAUTOLOGIN_H
