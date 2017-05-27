#ifndef MissonLog_H
#define MissonLog_H

#include <QMutex>

class MissonLog
{
public:
    ~MissonLog();
    static MissonLog* instance();
    void write_debug_log(QString sDebugLog);
    void write_error_log(QString sErrorLog);
    void write_warning_log( QString str_warning_log );
    void write_test_log(QString sTestLog);

private:
    MissonLog();
    void write_message(QString sContent, QString sFileName);

private:
    static MissonLog* m_pInstance;
    QMutex* m_pDebugMutex;
    QMutex* m_pErrorMutex;
    QMutex* mp_warning_mutex;
    QMutex* m_pTestMutex;
};

#endif // MissonLog_H
