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
#include <QScreen>
#include <QSize>
#include <QDebug>

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
//    translator.load(/*QString(argv[1])*/":qml_base_en.qm");
//    app.installTranslator(&translator);

    QQmlApplicationEngine engine;

    single_manager_instance();

    Login *p_login = new Login;
    engine.rootContext()->setContextProperty( "login", p_login );
    engine.rootContext()->setContextProperty( "audit_data", new AuditData );
    JQQRCODEREADERFORQML_REGISTERTYPE( engine );

#ifdef ANDROID
    //获取屏幕分辨率
    QScreen *p_screen = qApp->primaryScreen();
    QSize size_screen = p_screen->availableSize();//允许的size
    p_login->set_screen_size( size_screen );
    qDebug()<<"main"<<size_screen.width()<<size_screen.height();
#endif

    engine.load( QUrl(QStringLiteral("qrc:/LoginPage.qml") ) );

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    app.exec();

    single_manager_release();

    return 0;
}

