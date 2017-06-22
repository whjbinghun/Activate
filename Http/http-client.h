#ifndef HTTPCLIENT_H
#define HTTPCLIENT_H

#include <QObject>
#include <QNetworkAccessManager>
#include "common_enum.h"

class HttpClient : public QObject
{
    Q_OBJECT
public:
    static HttpClient* instance();
    void setToken(QString sToken);

    void send_passwd_encrypt( QString str_passwd );
    void send_account( QString str_account, QString str_passwd, QString str_salt );
    void auto_login(QString str_uuid, QString str_seqno, QString str_account, QString str_passwd);
    void passwd_modify( QString str_uuid, QString str_seqno, QString str_old_passwd, QString str_new_passwd );
private:
    explicit HttpClient(QObject *parent=NULL);

private:
    static HttpClient* m_pInstance;
    QString m_strTokenInfo;
    QNetworkAccessManager* m_pManager;
    QString m_sToken;

    //QList<HttpReqRes> m_list_req; //所有的请求列表
};

#endif // HTTPCLIENT_H
