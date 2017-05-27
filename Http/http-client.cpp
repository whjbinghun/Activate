#include "http-client.h"
#include "common-fun.h"
#include "mission_log.h"
#include "http-encrypt.h"
#include "http-login.h"
#include "http-auto-login.h"


HttpClient* HttpClient::m_pInstance = NULL;

HttpClient::HttpClient(QObject *parent)
    : QObject(parent)
    , m_pManager(NULL)
{
    m_pManager = new QNetworkAccessManager();
}

HttpClient *HttpClient::instance()
{
    if (m_pInstance == NULL)
    {
        m_pInstance = new HttpClient;
    }
    return m_pInstance;
}

void HttpClient::send_passwd_encrypt( QString str_passwd )
{
    HttpEncrypt *p_post = new HttpEncrypt( str_passwd );
    p_post->set_net_manager(m_pManager);
    p_post->post_request();
}

void HttpClient::send_account( QString str_account, QString str_passwd, QString str_salt )
{
    HttpLogin *p_post = new HttpLogin( str_account, str_passwd, str_salt );
    p_post->set_net_manager(m_pManager);
    p_post->post_request();
}

void HttpClient::auto_login( QString str_uuid, QString str_seqno, QString str_account, QString str_passwd)
{
    HttpAutoLogin *p_post = new HttpAutoLogin( str_uuid, str_seqno, str_account, str_passwd );
    p_post->set_net_manager(m_pManager);
    p_post->post_request();
}
