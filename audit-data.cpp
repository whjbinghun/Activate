#include "audit-data.h"
#include "common_enum.h"

AuditData::AuditData(QObject *parent)
    : QObject(parent)
{
    init_test();
}

AuditData::~AuditData()
{

}

int AuditData::get_pending_audit_length()
{
    int n_length = m_map_pending_audit.size();
    return n_length;
}

int AuditData::get_audit_length()
{
    int n_length = m_map_audited.size();

    return n_length;
}

int AuditData::get_refuse_length()
{
    int n_length = m_map_refuse.size();
    return n_length;
}

QString AuditData::get_pending_audit_status(int index)
{
    if( index < 0 && index >= m_map_pending_audit.size() ) return "";

    AuditInfo st_audit = m_map_pending_audit.value( index );
    QString str_audit_status = audit_to_string( st_audit.n_audit_status );
    return str_audit_status;
}

QString AuditData::get_pending_date(int index)
{
    if( index < 0 && index >= m_map_pending_audit.size() ) return "";

    AuditInfo st_audit = m_map_pending_audit.value( index );
    return st_audit.str_date;
}

QString AuditData::get_pending_send_name(int index)
{
    if( index < 0 && index >= m_map_pending_audit.size() ) return "";

    AuditInfo st_audit = m_map_pending_audit.value( index );
    return st_audit.str_send_name;
}

QString AuditData::get_pending_department(int index)
{
    if( index < 0 && index >= m_map_pending_audit.size() ) return "";

    AuditInfo st_audit = m_map_pending_audit.value( index );
    return st_audit.str_department;
}

QString AuditData::get_pending_soft_name(int index)
{
    if( index < 0 && index >= m_map_pending_audit.size() ) return "";

    AuditInfo st_audit = m_map_pending_audit.value( index );
    return st_audit.str_soft_name;
}

QString AuditData::get_pending_serial_num(int index)
{
    if( index < 0 && index >= m_map_pending_audit.size() ) return "";

    AuditInfo st_audit = m_map_pending_audit.value( index );
    return st_audit.str_serial_num;
}

QString AuditData::get_audit_status(int index)
{
    if( index < 0 && index >= m_map_audited.size() ) return "";

    AuditInfo st_audit = m_map_audited.value( index );
    QString str_audit_status = audit_to_string( st_audit.n_audit_status );
    return str_audit_status;
}

QString AuditData::get_audit_date(int index)
{
    if( index < 0 && index >= m_map_audited.size() ) return "";

    AuditInfo st_audit = m_map_audited.value( index );
    return st_audit.str_date;
}

QString AuditData::get_send_name(int index)
{
    if( index < 0 && index >= m_map_audited.size() ) return "";

    AuditInfo st_audit = m_map_audited.value( index );
    return st_audit.str_send_name;
}

QString AuditData::get_department(int index)
{
    if( index < 0 && index >= m_map_audited.size() ) return "";

    AuditInfo st_audit = m_map_audited.value( index );
    return st_audit.str_department;
}

QString AuditData::get_soft_name(int index)
{
    if( index < 0 && index >= m_map_audited.size() ) return "";

    AuditInfo st_audit = m_map_audited.value( index );
    return st_audit.str_soft_name;
}

QString AuditData::get_serial_num(int index)
{
    if( index < 0 && index >= m_map_audited.size() ) return "";

    AuditInfo st_audit = m_map_audited.value( index );
    return st_audit.str_serial_num;
}

QString AuditData::get_refuse_status(int index)
{
    if( index < 0 && index >= m_map_refuse.size() ) return "";

    AuditInfo st_audit = m_map_refuse.value( index );
    QString str_audit_status = audit_to_string( st_audit.n_audit_status );
    return str_audit_status;
}

QString AuditData::get_refuse_date(int index)
{
    if( index < 0 && index >= m_map_refuse.size() ) return "";

    AuditInfo st_audit = m_map_refuse.value( index );
    return st_audit.str_date;
}

QString AuditData::get_refuse_send_name(int index)
{
    if( index < 0 && index >= m_map_refuse.size() ) return "";

    AuditInfo st_audit = m_map_refuse.value( index );
    return st_audit.str_send_name;
}

QString AuditData::get_refuse_department(int index)
{
    if( index < 0 && index >= m_map_refuse.size() ) return "";

    AuditInfo st_audit = m_map_refuse.value( index );
    return st_audit.str_department;
}

QString AuditData::get_refuse_soft_name(int index)
{
    if( index < 0 && index >= m_map_refuse.size() ) return "";

    AuditInfo st_audit = m_map_refuse.value( index );
    return st_audit.str_soft_name;
}

QString AuditData::get_refuse_serial_num(int index)
{
    if( index < 0 && index >= m_map_refuse.size() ) return "";

    AuditInfo st_audit = m_map_refuse.value( index );
    return st_audit.str_serial_num ;
}

QString AuditData::audit_to_string( int n_audit_status )
{
    QString str_audit_status = "";
    switch ( n_audit_status ) {
    case e_pending_active:
        str_audit_status = "等待激活!";
        break;
    case e_pending_lock:
        str_audit_status = "等待锁定!";
        break;
    case e_active_suc:
        str_audit_status = "激活成功!";
        break;
    case e_lock_suc:
        str_audit_status = "锁定成功!";
        break;
    case e_refuse_active:
        str_audit_status = "拒绝激活!";
        break;
    case e_refuse_lock:
        str_audit_status = "拒绝锁定!";
        break;
    default:
        str_audit_status = "未知状态!";
        break;
    }

    return str_audit_status;
}

void AuditData::init_test()
{
    AuditInfo st_auditInfo;
    st_auditInfo.n_id = 0;
    st_auditInfo.n_audit_status = 1;
    st_auditInfo.str_date = "2017-06-07";
    st_auditInfo.str_send_name = "张三";
    st_auditInfo.str_department = "销售部";
    st_auditInfo.str_soft_name = "yf_play";
    st_auditInfo.str_serial_num = "1112321sdfksjdlfk";

    m_map_pending_audit.insert( st_auditInfo.n_id, st_auditInfo );

    st_auditInfo.n_id = 1;
    st_auditInfo.n_audit_status = 2;
    st_auditInfo.str_date = "2017-06-07";
    st_auditInfo.str_send_name = "张三1";
    st_auditInfo.str_department = "销售部";
    st_auditInfo.str_soft_name = "yf_play";
    st_auditInfo.str_serial_num = "1112321sdfksjdlfk";
    m_map_pending_audit.insert( st_auditInfo.n_id, st_auditInfo );

    st_auditInfo.n_id = 2;
    st_auditInfo.n_audit_status = 1;
    st_auditInfo.str_date = "2017-06-07";
    st_auditInfo.str_send_name = "张三2";
    st_auditInfo.str_department = "销售部";
    st_auditInfo.str_soft_name = "yf_play";
    st_auditInfo.str_serial_num = "1112321sdfksjdlfk";
    m_map_pending_audit.insert( st_auditInfo.n_id, st_auditInfo );

    st_auditInfo.n_id = 3;
    st_auditInfo.n_audit_status = 1;
    st_auditInfo.str_date = "2017-06-07";
    st_auditInfo.str_send_name = "张三3";
    st_auditInfo.str_department = "销售部";
    st_auditInfo.str_soft_name = "yf_play";
    st_auditInfo.str_serial_num = "1112321sdfksjdlfk";
    m_map_pending_audit.insert( st_auditInfo.n_id, st_auditInfo );
}

