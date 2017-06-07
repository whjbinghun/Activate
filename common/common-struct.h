#ifndef COMMONSTRUCT_H
#define COMMONSTRUCT_H

#include <QVariant>
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

//结构注册
Q_DECLARE_METATYPE(ConfigInfo)

typedef struct _tagAuditInfo {
    int n_id;//作为唯一标识
    int n_audit_status;//审核状态 1：待审核 2.等待锁定 3. 已审核 4. 拒绝
    QString str_date;//状态设置时间
    QString str_send_name;//发送人
    QString str_approver;//审批人
    int n_effective_days;//剩余有效天数
    QString str_department;//部门
    QString str_soft_name;//软件名
    QString str_serial_num;//机器序列号
    QString str_activation_code;//激活码

    _tagAuditInfo()
        : n_id( -1 )
        , n_audit_status( 1 )
        , str_date( "" )
        , str_send_name( "" )
        , str_approver( "" )
        , n_effective_days( 0 )
        , str_department( "" )
        , str_soft_name( "" )
        , str_serial_num( "" )
        , str_activation_code( "" ){}
}AuditInfo;
Q_DECLARE_METATYPE(AuditInfo)

#endif // COMMONSTRUCT_H
