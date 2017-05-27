#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>
#include "http-struct.h"

class Login : public QObject
{
    Q_OBJECT

    Q_PROPERTY( bool b_auto_login READ get_auto_login WRITE set_auto_login )
public:
    explicit Login(QObject *parent = 0);
    ~Login();
public:
    Q_INVOKABLE void send_account( QString str_account, QString str_passwd );
    Q_INVOKABLE bool get_auto_login();
    Q_INVOKABLE void set_auto_login( bool b_auto_login );
    Q_INVOKABLE void clear_user_info();
signals:
    void sig_warning( QString str_warning );
private:
    void init_ctrl();
    void init_connect();
private slots:
    void slot_passwd_encrypt( int n_status, QString str_msg, QString str_encrypted_passwd, QString str_salt );
    void slot_login(int n_status, QString str_msg, UserInfo &st_user_info);

private:
    bool mb_auto_login;

    QString ms_account;//账号
    QString ms_passwd;
};

#endif // LOGIN_H
