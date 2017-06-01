#include "http-req-res.h"
#include "mission_log.h"
#include "single-config.h"
#include <QDebug>
#include "common.h"

HttpReqRes::HttpReqRes(QObject *parent)
    : QObject(parent)
    , m_pManager( NULL )
    , m_pReply( NULL )
    , m_nReconnectTimes(0)
    , m_sUrlAddress( "" )
    , ms_url_header( "" )
    , m_sTestUrl( "" )
    , mn_over_time_len(10)
    , m_bOverTime(false)
{
    QString str_server_ip = SingleConfig::instance()->get_config_info().str_server_ip;
    if( str_server_ip.isEmpty() ) {
        m_sUrlAddress = gs_server_ip;
    } else {
        m_sUrlAddress = str_server_ip;
    }

    init_connect();
}

HttpReqRes::~HttpReqRes()
{

}

void HttpReqRes::set_net_manager(QNetworkAccessManager* pManager)
{
    pManager->setNetworkAccessible(QNetworkAccessManager::Accessible);
    m_pManager = pManager;
}

void HttpReqRes::set_header( QString str_header )
{
    ms_url_header = m_sUrlAddress + str_header;
}

void HttpReqRes::set_req_params(QByteArray byArr)
{
    m_reqParams = byArr;
}

void HttpReqRes::post_request()
{
    QNetworkRequest request;
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
    QByteArray n_post_data_size = QByteArray::number( m_reqParams.size() );
    request.setRawHeader( "Content-Length", n_post_data_size );
    request.setUrl(QUrl(ms_url_header));

    m_pReply = m_pManager->post(request, m_reqParams);
    connect(m_pReply, SIGNAL(finished()), this, SLOT(slot_ReplyFinished()));
    m_sTestUrl = request.url().toString().append(m_reqParams); // 测试用
    if (!m_sTestUrl.contains( gs_server_ip ) )
    {
        qDebug()<<m_sTestUrl;
        MissonLog::instance()->write_debug_log(m_sTestUrl);
    }

    m_bOverTime = false;
    if (!m_overTimer.isActive())
    {
        m_overTimer.start(mn_over_time_len*1000);
    }
}

QString HttpReqRes::get_test_url()
{
    return m_sTestUrl;
}

void HttpReqRes::set_over_time_lengh(int n_over_time_lengh)
{
    mn_over_time_len = n_over_time_lengh;
}

bool HttpReqRes::is_over_time()
{
    return m_bOverTime;
}

void HttpReqRes::set_req_url_address(QString urlAddress)
{
    m_sUrlAddress = urlAddress;
}

void HttpReqRes::slot_ReplyFinished()
{
    m_bOverTime = false;
    m_overTimer.stop();

    QTextCodec *codec = QTextCodec::codecForName("utf8");

    QNetworkReply::NetworkError err = m_pReply->error();

    if (err != QNetworkReply::NoError)
    {
        MissonLog::instance()->write_error_log(QString(QStringLiteral("网络异常: %1; errorCod:%2; errorMsg:%3")).arg(m_sTestUrl).arg(err).arg(m_pReply->errorString()));
        process_error( err );
    }
    else
    {      
        m_nReconnectTimes = 0;
        QString str_result = codec->toUnicode(m_pReply->readAll());
        m_pReply->deleteLater();
        m_pReply = NULL;
        process_response(str_result);
    }
}

void HttpReqRes::slot_overTimeout()
{
    m_bOverTime = true;
    MissonLog::instance()->write_error_log(QString(QStringLiteral("网络超时: %1;")).arg(m_sTestUrl));
    process_error( 504 );
}

void HttpReqRes::init_connect()
{
    connect(&m_overTimer, SIGNAL(timeout()), this, SLOT(slot_overTimeout()));
}


