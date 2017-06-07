#ifndef AUDITDATA_H
#define AUDITDATA_H

#include <QObject>
#include "common-struct.h"

/**
 * @brief The AuditData class
 * @brief 审核信息类
 */
class AuditData : public QObject
{
    Q_OBJECT
public:
    explicit AuditData(QObject *parent = nullptr);
    ~AuditData();
public:
    //待审核信息长度
    Q_INVOKABLE int get_pending_audit_length();
    Q_INVOKABLE int get_audit_length();
    Q_INVOKABLE int get_refuse_length();

    //待审核
    Q_INVOKABLE QString get_pending_audit_status( int index );
    Q_INVOKABLE QString get_pending_date( int index );
    Q_INVOKABLE QString get_pending_send_name( int index );
    Q_INVOKABLE QString get_pending_department( int index );
    Q_INVOKABLE QString get_pending_soft_name( int index );
    Q_INVOKABLE QString get_pending_serial_num( int index );
    //已审核
    Q_INVOKABLE QString get_audit_status( int index );
    Q_INVOKABLE QString get_audit_date( int index );
    Q_INVOKABLE QString get_audit_send_name( int index );
    Q_INVOKABLE QString get_audit_approver( int index );
    Q_INVOKABLE QString get_audit_department( int index );
    Q_INVOKABLE QString get_audit_soft_name( int index );
    Q_INVOKABLE QString get_audit_serial_num( int index );
    Q_INVOKABLE QString get_audit_activation_code( int index );
    //拒绝
    Q_INVOKABLE QString get_refuse_status( int index );
    Q_INVOKABLE QString get_refuse_date( int index );
    Q_INVOKABLE QString get_refuse_send_name( int index );
    Q_INVOKABLE QString get_refuse_approver( int index );
    Q_INVOKABLE QString get_refuse_department( int index );
    Q_INVOKABLE QString get_refuse_soft_name( int index );
    Q_INVOKABLE QString get_refuse_serial_num( int index );
private:
    QString audit_to_string( int n_audit_status );

    void init_test();

private:
    QMap< int, AuditInfo > m_map_pending_audit;//待审核
    QMap< int, AuditInfo > m_map_audited;//已审核
    QMap< int, AuditInfo > m_map_refuse;//拒绝
};

#endif // AUDITDATA_H
