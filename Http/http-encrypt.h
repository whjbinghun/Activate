#ifndef HTTPENCRYPT_H
#define HTTPENCRYPT_H

#include "http-req-res.h"

class HttpEncrypt : public HttpReqRes
{
    Q_OBJECT
public:
    /**
     * @brief HttpEncrypt
     * @param str_passwd 密码
     */
    explicit HttpEncrypt( QString str_passwd );
protected:
    void process_response(QString str_result);
    void process_error( int n_err );

private:
    QString ms_passwd;
};

#endif // HTTPENCRYPT_H
