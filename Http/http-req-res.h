#ifndef HttpReqRes_H
#define HttpReqRes_H

#include <QObject>
#include <QtNetwork>
#include <QTimer>

class HttpReqRes : public QObject
{
    Q_OBJECT

public:
    HttpReqRes(QObject *parent = 0);
    ~HttpReqRes();
    void set_net_manager(QNetworkAccessManager* pManager);
    void set_header( QString str_header );//设置包头
    void set_req_params(QByteArray byArr);
    void get_request();
    void post_request();
    QString get_test_url(); // 测试用
    void set_over_time_lengh(int n_over_time_lengh); // 设置超时时长
    bool is_over_time(); // 请求是否超时

protected:
    virtual void process_response(QString str_result) = 0;
    virtual void process_error( int n_err ) = 0;
    virtual void set_req_url_address(QString urlAddress = "");

private slots:
    void slot_ReplyFinished();
    void slot_overTimeout();

private:
    void init_connect();

protected:
    QNetworkAccessManager*  m_pManager;
    QNetworkRequest			m_request;
    QNetworkReply*          m_pReply;
    QByteArray				m_reqParams;
    int						m_nReconnectTimes;
    //QString					m_str_result;
    QString m_sUrlAddress;
    QString ms_url_header;//ip + 包头
    QString m_sTestUrl; // 测试用
    QTimer m_overTimer; // 超时定时器
    int mn_over_time_len; // 超时时长
    bool m_bOverTime; // 是否超时
};

#endif // HttpReqRes_H
