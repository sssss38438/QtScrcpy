#-------------------------------------------------
#
# Project created by QtCreator 2018-10-07T12:36:10
#
#-------------------------------------------------

QT += core gui
QT += network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = QtScrcpy
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
msvc{
    QMAKE_CFLAGS += -source-charset:utf-8
    QMAKE_CXXFLAGS += -source-charset:utf-8
}
# 源码
SOURCES += \
        main.cpp \
        dialog.cpp

HEADERS += \
        dialog.h

FORMS += \
        dialog.ui

# 子工程
include ($$PWD/common/common.pri)
include ($$PWD/adb/adb.pri)
include ($$PWD/uibase/uibase.pri)
include ($$PWD/fontawesome/fontawesome.pri)
include ($$PWD/util/util.pri)
include ($$PWD/device/device.pri)
include ($$PWD/devicemanage/devicemanage.pri)

# 附加包含路径
INCLUDEPATH += \
        $$PWD/common \        
        $$PWD/adb \        
        $$PWD/uibase \        
        $$PWD/util \
        $$PWD/device \
        $$PWD/devicemanage \
        $$PWD/fontawesome


# ***********************************************************
# Win平台下配置
# ***********************************************************
win32 {
    contains(QT_ARCH, x86_64) {
        message("x64")
        # 输出目录
        CONFIG(debug, debug|release) {
            DESTDIR = $$PWD/../output/win-x64/debug
        } else {
            DESTDIR = $$PWD/../output/win-x64/release
        }

        # 依赖模块
        LIBS += \
                -L$$PWD/../third_party/ffmpeg/win64/lib -lavformat \
                -L$$PWD/../third_party/ffmpeg/win64/lib -lavcodec \
                -L$$PWD/../third_party/ffmpeg/win64/lib -lavutil \
                -L$$PWD/../third_party/ffmpeg/win64/lib -lswscale
    } else {
        message("x86")
        # 输出目录
        CONFIG(debug, debug|release) {
            DESTDIR = $$PWD/../output/win/debug
        } else {
            DESTDIR = $$PWD/../output/win/release
        }

        # 依赖模块
        LIBS += \
                -L$$PWD/../third_party/ffmpeg/lib -lavformat \
                -L$$PWD/../third_party/ffmpeg/lib -lavcodec \
                -L$$PWD/../third_party/ffmpeg/lib -lavutil \
                -L$$PWD/../third_party/ffmpeg/lib -lswscale
    }
    # windows rc file
    RC_FILE = $$PWD/res/QtScrcpy.rc
}
# ***********************************************************
# Mac平台下配置
# ***********************************************************
macos {
    # 输出目录
    CONFIG(debug, debug|release) {
        DESTDIR = $$PWD/../output/mac/debug
    } else {
        DESTDIR = $$PWD/../output/mac/release
    }

    # 依赖模块
    LIBS += \
            -L$$PWD/../third_party/ffmpeg/lib -lavformat.58 \
            -L$$PWD/../third_party/ffmpeg/lib -lavcodec.58 \
            -L$$PWD/../third_party/ffmpeg/lib -lavutil.56 \
            -L$$PWD/../third_party/ffmpeg/lib -lswscale.5

    # mac bundle file
    APP_SCRCPY_SERVER.files = $$files($$PWD/../third_party/scrcpy-server.jar)
    APP_SCRCPY_SERVER.path = Contents/MacOS
    QMAKE_BUNDLE_DATA += APP_SCRCPY_SERVER

    APP_ADB.files = $$files($$PWD/../third_party/adb/mac/adb)
    APP_ADB.path = Contents/MacOS
    QMAKE_BUNDLE_DATA += APP_ADB

    APP_FFMPEG.files = $$files($$PWD/../third_party/ffmpeg/lib/*.dylib)
    APP_FFMPEG.path = Contents/MacOS
    QMAKE_BUNDLE_DATA += APP_FFMPEG

    # mac application icon
    ICON = $$PWD/res/QtScrcpy.icns
    QMAKE_INFO_PLIST = $$PWD/res/Info_mac.plist
}

# ***********************************************************
# Linux平台下配置
# ***********************************************************
linux {
    # 输出目录
    CONFIG(debug, debug|release) {
        DESTDIR = $$PWD/../output/linux/debug
    } else {
        DESTDIR = $$PWD/../output/linux/release
    }

    # 依赖模块
    LIBS += \
            -L$$PWD/../third_party/ffmpeg/lib -lavformat \
            -L$$PWD/../third_party/ffmpeg/lib -lavcodec \
            -L$$PWD/../third_party/ffmpeg/lib -lavutil \
            -L$$PWD/../third_party/ffmpeg/lib -lswscale

    # linux set app icon: https://blog.csdn.net/MrNoboday/article/details/82870853
}

# message("test")

RESOURCES += \
    res/res.qrc

