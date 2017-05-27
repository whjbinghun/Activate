#include "single-verification.h"
#include "http-client.h"

SingleVerification *SingleVerification::mp_verif = NULL;

SingleVerification * SingleVerification::instance()
{
    if( !mp_verif ) {
        mp_verif = new SingleVerification();
    }
    return mp_verif;
}

void SingleVerification::release()
{
    if( mp_verif ) {
        delete mp_verif;
        mp_verif = NULL;
    }
}

void SingleVerification::send_passwd_encrypt( QString str_passwd )
{
    HttpClient::instance()->send_passwd_encrypt( str_passwd );
}

void SingleVerification::send_account(QString str_account, QString str_passwd, QString str_salt )
{
    HttpClient::instance()->send_account( str_account, str_passwd, str_salt );
}

void SingleVerification::auto_login( QString str_uuid, QString str_seqno, QString str_account, QString str_passwd)
{
    HttpClient::instance()->auto_login( str_uuid, str_seqno, str_account, str_passwd );
}

SingleVerification::SingleVerification()
{

}
