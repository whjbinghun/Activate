#include "single-config.h"
#include "common.h"
#include <QFile>
#include <QJsonDocument>
#include <QJsonArray>
#include "mission_log.h"

SingleConfig *SingleConfig::mp_config = NULL;

SingleConfig *SingleConfig::instance()
{
    if( !mp_config ) {
        mp_config = new SingleConfig;
    }
    return mp_config;
}

void SingleConfig::release()
{
    if( mp_config ) {
        delete mp_config;
        mp_config = NULL;
    }
}

void SingleConfig::set_config_info( const ConfigInfo & st_config_info )
{
    m_st_config_info = st_config_info;
    save_config_info();
}

ConfigInfo &SingleConfig::get_config_info()
{
    return m_st_config_info;
}

bool SingleConfig::load_config_info()
{
    QFile load_file( gs_config_path );
    if( !load_file.open( QIODevice::ReadOnly ) ) {
        MissonLog::instance()->write_error_log( "load: Couldn't open config.conf." );
        return false;
    }

    QByteArray byte_load_data = load_file.readAll();
    QJsonDocument load_doc( QJsonDocument::fromJson( byte_load_data ) );
    read_config_info( load_doc.object() );
    return true;
}

bool SingleConfig::save_config_info() const
{
    QFile save_file( gs_config_path );
    if( !save_file.open( QIODevice::WriteOnly ) ) {
        MissonLog::instance()->write_error_log( "save: Couldn't open config.conf. ");
        return false;
    }

    QJsonObject jo_config_info;
    write_config_info( jo_config_info );
    QJsonDocument save_doc( jo_config_info );
    save_file.write( save_doc.toJson() );

    return true;
}

SingleConfig::SingleConfig()
{

}

void SingleConfig::read_config_info(const QJsonObject &json)
{
    QJsonArray ja_config = json["config_info"].toArray();

    QJsonObject jo_config = ja_config[0].toObject();
    m_st_config_info.str_server_ip = jo_config["server_ip"].toString();
    m_st_config_info.str_account = jo_config["username"].toString();
    m_st_config_info.str_passwd = jo_config["password"].toString();
    m_st_config_info.str_uuid = jo_config["uuid"].toString();
    m_st_config_info.str_seqno = jo_config["seqno"].toString();
    m_st_config_info.b_remember_account = jo_config["remember_account"].toBool();
}

void SingleConfig::write_config_info(QJsonObject &json) const
{
    QJsonArray ja_config;
    QJsonObject jo_config;
    jo_config["server_ip"] = m_st_config_info.str_server_ip;
    jo_config["username"] = m_st_config_info.str_account;
    jo_config["password"] = m_st_config_info.str_passwd;
    jo_config["uuid"] = m_st_config_info.str_uuid;
    jo_config["seqno"] = m_st_config_info.str_seqno;
    jo_config["remember_account"] = m_st_config_info.b_remember_account;
    ja_config.append( jo_config );

    json["config_info"] = ja_config;

}
