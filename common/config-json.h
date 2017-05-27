#ifndef CONFIGJSON_H
#define CONFIGJSON_H

#include <QString>

class ConfigJson
{
public:
    explicit ConfigJson();
    ~ConfigJson();
public:
    QString get_server_ip();

    bool save_file();
    void delete_file();
private:
    QString ms_file_path;//配置文件路径
};

#endif // CONFIGJSON_H
