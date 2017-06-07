#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "login.h"
#include "single-verification.h"
#include "single-config.h"
#include "http-signal.h"
#include "JQQRCodeReaderForQml.h"
#include <QTranslator>
#include "audit-data.h"

void single_manager_instance()
{
    HttpSignal::instance();
    SingleConfig::instance();
    SingleVerification::instance();
}

void single_manager_release()
{
    SingleVerification::release();
    SingleConfig::release();
    HttpSignal::release();
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //支持国际化
//    QTranslator translator;
//    translator.load(/*QString(argv[1])*/":i18n/qml_base_en.qm");
//    app.installTranslator(&translator);


    QQmlApplicationEngine engine;

    single_manager_instance();

    Login *p_login = new Login;
    engine.rootContext()->setContextProperty( "login", p_login );
    engine.rootContext()->setContextProperty( "audit_data", new AuditData );
    JQQRCODEREADERFORQML_REGISTERTYPE( engine );

    engine.load( QUrl(QStringLiteral("qrc:/LoginPage.qml") ) );

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    app.exec();

    single_manager_release();

    return 0;
}

