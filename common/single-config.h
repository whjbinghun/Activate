#ifndef SINGLECONFIG_H
#define SINGLECONFIG_H

#include <QString>
#include <QJsonObject>
#include <QMap>
#include "common-struct.h"

class SingleConfig
{
public:
    static SingleConfig *instance();
    static void release();


    void set_config_info( const ConfigInfo & st_config_info );
    ConfigInfo &get_config_info();

    bool load_config_info();
    bool save_config_info() const;

private:
    SingleConfig();

    void read_config_info( const QJsonObject &json );
    void write_config_info( QJsonObject &json ) const;
private:
    static SingleConfig *mp_config;

    ConfigInfo m_st_config_info;
};

#endif // SINGLECONFIG_H
