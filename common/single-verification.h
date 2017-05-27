#ifndef SINGLEVERIFICATION_H
#define SINGLEVERIFICATION_H

/**
 * @brief The SingleVerification class
 * @brief 验证单例
 */
#include <QString>

class SingleVerification
{
public:
    static SingleVerification *instance();
    static void release();

    void send_passwd_encrypt( QString str_passwd );
    void send_account( QString str_account, QString str_passwd, QString str_salt  );
    void auto_login( QString str_uuid, QString str_seqno, QString str_account, QString str_passwd );
private:
    SingleVerification();
public:
    static SingleVerification *mp_verif;
};

#endif // SINGLEVERIFICATION_H
