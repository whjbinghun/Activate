#include "common-fun.h"
#include <QByteArray>
#include <QCryptographicHash>

QString CommonFun::getStringMd5( QString str )
{
    QByteArray bb = QCryptographicHash::hash(str.toUtf8(), QCryptographicHash::Md5);
    return bb.toHex();
}
