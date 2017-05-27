#ifndef HTTPSTRUCT_H
#define HTTPSTRUCT_H

#include <QString>

typedef struct _tagUserInfo {
    QString str_uuid;
    QString str_account;
    QString str_display_name;//公司名
    QString str_avatar_url;//公司网页
    QString str_seqno;//手机序列号

    _tagUserInfo()
        : str_uuid( "" )
        , str_account( "" )
        , str_display_name( "杭州美盛" )
        , str_avatar_url( "http://errorpage.b0.upaiyun.com/greatms-passport-404" )
        , str_seqno( "" ) {}
}UserInfo;

#endif // HTTPSTRUCT_H
