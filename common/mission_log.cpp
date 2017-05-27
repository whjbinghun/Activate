#include "mission_log.h"
#include <QDir>
#include <QDateTime>
#include <QTextStream>
#include <QIODevice>

MissonLog* MissonLog::m_pInstance = NULL;

MissonLog::MissonLog()
{
    m_pErrorMutex = new QMutex;
    m_pDebugMutex = new QMutex;
    m_pTestMutex = new QMutex;
}

MissonLog::~MissonLog()
{
    if (m_pErrorMutex != NULL)
    {
        delete m_pErrorMutex;
        m_pErrorMutex = NULL;
    }
    if (m_pDebugMutex != NULL)
    {
        delete m_pDebugMutex;
        m_pDebugMutex = NULL;
    }
    if (m_pTestMutex != NULL)
    {
        delete m_pTestMutex;
        m_pTestMutex = NULL;
    }
}

MissonLog *MissonLog::instance()
{
    if (m_pInstance == NULL)
    {
        m_pInstance = new MissonLog;
    }
    return m_pInstance;
}

void MissonLog::write_debug_log(QString sDebugLog)
{
    m_pDebugMutex->lock();
    write_message(sDebugLog, "debug.txt");
    m_pDebugMutex->unlock();
}

void MissonLog::write_error_log(QString sErrorLog)
{
    m_pErrorMutex->lock();
    write_message(sErrorLog, "error.txt");
    m_pErrorMutex->unlock();
}

void MissonLog::write_warning_log( QString str_warning_log )
{
    mp_warning_mutex->lock();
    write_message( str_warning_log, "warning.txt" );
    mp_warning_mutex->unlock();
}

void MissonLog::write_test_log(QString sTestLog)
{
    m_pTestMutex->lock();
    write_message(sTestLog, "test.txt");
    m_pTestMutex->unlock();
}

void MissonLog::write_message(QString sContent, QString sFileName)
{
    QString logPath = "./log";
    //查看是否包含该目录
    QDir logDir;
    if (!logDir.exists(logPath))
    {
        logDir.mkpath(logPath);
    }
    //拼字符串
    QFile file(logPath + "//" + sFileName);
    QString current_date_time = QDateTime::currentDateTime().toString("yyyy-MM-dd hh:mm:ss ddd");
    QString message = QString("%1 %2").arg(current_date_time).arg(sContent);

    //打开文件写入
    if (file.open(QIODevice::WriteOnly | QIODevice::Append))
    {
        QTextStream text_stream(&file);
        text_stream << message << "\r\n\r\n";
        file.flush();
    }
    file.close();

    if (file.size() > 100*1024*1024)
    {
        file.remove();
    }
}
