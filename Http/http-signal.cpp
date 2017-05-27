#include "http-signal.h"

HttpSignal* HttpSignal::mp_instance = NULL;

HttpSignal::HttpSignal(QObject *parent)
    : QObject( parent )
{

}
