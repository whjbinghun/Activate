#ifndef HTTPSIGNAL_H
#define HTTPSIGNAL_H


#include <QObject>
#include "http-struct.h"

class HttpSignal : public QObject
{
    Q_OBJECT
public:
    static HttpSignal* instance() {
        if( mp_instance == NULL ) {
            mp_instance = new HttpSignal;
        }
        return mp_instance;
    }
    static void release() {
        if( mp_instance ) {
            delete mp_instance;
            mp_instance = NULL;
        }
    }


private:
    explicit HttpSignal( QObject *parent = 0 );

signals:
    /**
     * @brief sig_passwd_encrypt
     * @param n_status  状态值
     * @param str_msg   提示信息
     * @param str_encrypted_passwd  加密后的密码
     * @param str_salt  加密的秘钥
     *
     */
    void sig_passwd_encrypt( int n_status, QString str_msg, QString str_encrypted_passwd, QString str_salt );
    void sig_login( int n_status, QString str_msg, UserInfo &st_user_info );
    void sig_auto_login( int n_status, QString str_msg, UserInfo &st_user_info, bool b_auto_login = true );
    void sig_passwd_modify( int n_status, QString str_msg, QString str_new_passwd );
private:
    static HttpSignal* mp_instance;
};

#endif // HTTPSIGNAL_H


