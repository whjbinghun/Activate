﻿#ifndef COMMONSTRUCT_H
#define COMMONSTRUCT_H

#include <QString>

typedef struct _tagConfigInfo {
    QString str_server_ip;
    QString str_account;
    QString str_passwd;
    QString str_uuid;
    QString str_seqno;//序列号

    _tagConfigInfo()
        : str_server_ip( "" )
        , str_account( "" )
        , str_passwd( "" )
        , str_uuid( "" )
        , str_seqno( "" ){}

}ConfigInfo;

#endif // COMMONSTRUCT_H
