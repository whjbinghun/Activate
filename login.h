#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>
#include "http-struct.h"

class Login : public QObject
{
    Q_OBJECT

    Q_PROPERTY( bool b_remember_account READ get_remember_account WRITE set_remember_account )
    Q_PROPERTY( QString str_account READ get_login_account WRITE set_login_account )
    Q_PROPERTY( QString str_passwd READ get_login_passwd WRITE set_login_passwd )
    Q_PROPERTY( QString str_username READ get_username WRITE set_username )
public:
    explicit Login(QObject *parent = 0);
    ~Login();
public:
    Q_INVOKABLE void init_ctrl();
    Q_INVOKABLE void send_account( QString str_account, QString str_passwd );
    bool get_remember_account();
    void set_remember_account( bool b_remember_account );
    Q_INVOKABLE void clear_user_info();
    QString get_login_account();
    void set_login_account( QString str_account );
    QString get_login_passwd();
    void set_login_passwd( QString str_passwd );
    QString get_username();
    void set_username( QString str_username );
signals:
    void sig_warning( QString str_warning );
    void sig_remember_account( bool b_remember_account );
    void sig_ver_success( bool b_ver_success );
private:
    void init_connect();
private slots:
    void slot_passwd_encrypt( int n_status, QString str_msg, QString str_encrypted_passwd, QString str_salt );
    void slot_login(int n_status, QString str_msg, UserInfo &st_user_info, bool b_auto_login = false);

private:
    bool mb_remember_account;
    bool mb_ver_success;//登陆验证成功

    QString ms_account;//账号
    QString ms_passwd;
    QString ms_username;//用户名
};

#endif // LOGIN_H
