TEMPLATE = app

QT += qml quick network script core concurrent multimedia
CONFIG += c++11
CONFIG += warn_on    #告诉编译器显示尽可能详尽的警告信息

TRANSLATIONS += en.ts zh_CN.ts zh_TW.ts    #国际化

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
include( $$PWD/QZXing/sharedlibrary/JQQRCodeReader/JQQRCodeReader.pri )

INCLUDEPATH += Http/
INCLUDEPATH += common/

HEADERS += \
    common/common_enum.h \
    login.h \
    common/single-verification.h \
    Http/http-login.h \
    common/common-fun.h \
    Http/http-req-res.h \
    Http/http-client.h \
    common/mission_log.h \
    common/single-config.h \
    common/common.h \
    common/common-api.h \
    common/common-struct.h \
    Http/http-encrypt.h \
    Http/http-signal.h \
    Http/http-struct.h \
    Http/http-auto-login.h \
    Http/http-api.h \
    audit-data.h \
    Http/http-passwd-modify.h

SOURCES += main.cpp \
    login.cpp \
    common/single-verification.cpp \
    Http/http-login.cpp \
    Http/http-req-res.cpp \
    Http/http-client.cpp \
    common/mission_log.cpp \
    common/single-config.cpp \
    common/common-fun.cpp \
    Http/http-encrypt.cpp \
    Http/http-signal.cpp \
    Http/http-auto-login.cpp \
    audit-data.cpp \
    Http/http-passwd-modify.cpp

RESOURCES += qml.qrc \
    i18n/i18n.qrc \
    images/images.qrc

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    #android/src/an/qt/MissionActivate/QtFullscreenActivity.java

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
