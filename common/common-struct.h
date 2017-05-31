#ifndef COMMONSTRUCT_H
#define COMMONSTRUCT_H

#include <QString>

typedef struct _tagConfigInfo {
    QString str_server_ip;
    QString str_account;//用户账号
    QString str_passwd;
    QString str_uuid;
    QString str_seqno;//序列号
    QString str_display_name;//用户名
    bool    b_remember_account;//记住账号

    _tagConfigInfo()
        : str_server_ip( "" )
        , str_account( "" )
        , str_passwd( "" )
        , str_uuid( "" )
        , str_seqno( "" )
        , str_display_name( "" )
        , b_remember_account( false ){}

}ConfigInfo;

#endif // COMMONSTRUCT_H
