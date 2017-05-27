#ifndef HTTPLOGIN_H
#define HTTPLOGIN_H

#include "http-req-res.h"
#include "http-struct.h"

class HttpLogin : public HttpReqRes
{
    Q_OBJECT
public:
    /**
     * @brief HttpLogin
     * @param str_account 账号
     * @param str_passwd 密码
     * @parm str_salt    秘钥
     */
    explicit HttpLogin(QString str_account, QString str_passwd, QString str_salt );

protected:
    void process_response(QString str_result);
    void process_error( int n_err );

private:
    QString ms_account;
    QString ms_passwd;
    QString ms_salt;

    UserInfo m_st_userInfo;
};

#endif // HTTPLOGIN_H
