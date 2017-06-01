﻿import QtQuick 2.7
import QtMultimedia 5.4
import JQQRCodeReader 1.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

Loader {
    id: jqQRCodeReader
    width: parent.width
    height: parent.height
    asynchronous: false
    active: false

    property int decodeQrCodeType: 4096 // 二维码
//    property int decodeQrCodeType: 32 // 一维码

    signal tagFound( string tag )

    onVisibleChanged: {
        if ( !visible )
        {
            jqQRCodeReader.active = false;
        }
    }

    sourceComponent: Component {
        Rectangle {
            id: rectangleForView
            width: jqQRCodeReader.width
            height: jqQRCodeReader.height
            visible: true
            color: "#000000"

            signal tagFind(string tag)

            JQQRCodeReaderForQmlManage {//JQQRCodeReader类
                id: jqQRCodeReaderForQmlManage
                decodeQrCodeType: jqQRCodeReader.decodeQrCodeType

                onTagFound: {
                    rectangleForView.visible = false;
                    animationForLightNeedle.running = false;
                    timer.running = false;
                    timerForClose.running = true;

                    camera.stop();

                    jqQRCodeReader.tagFound( tag );
                }
            }

//            MouseArea {   //双击空白处退出扫描模式
//                anchors.fill: parent

//                onDoubleClicked: {
//                    jqQRCodeReader.active = false;
//                }
//            }

            Timer {    //定时解析图片
                id: timer
                interval: 200
                repeat: true
                running: true

                onTriggered: {
                    jqQRCodeReaderForQmlManage.analysisItem( output )
                }
            }

            Camera {
                id: camera

                focus {
                    focusMode: Camera.FocusContinuous
                }
            }

            VideoOutput {
                id: output
                anchors.fill: parent
                source: camera
                focus : visible
                autoOrientation: true
                fillMode: VideoOutput.PreserveAspectCrop
            }

            Rectangle {//top
                width: parent.width
                height: centralRectangle.y
                color: "#55000000"
            }

            Rectangle {//bottom
                id: rectangle3
                y: centralRectangle.y + centralRectangle.height
                width: parent.width
                height: (parent.height-centralRectangle.height)/2
                color: "#55000000"
            }

            Rectangle {//left
                y: centralRectangle.y
                width: centralRectangle.x
                height: centralRectangle.height
                color: "#55000000"
            }

            Rectangle {//right
                x: centralRectangle.x+centralRectangle.width
                y: centralRectangle.y
                width: parent.width - centralRectangle.x-centralRectangle.width
                height: centralRectangle.height
                color: "#55000000"
            }

            Rectangle {
                id: centralRectangle
                x: parent.width/4//53
                y: (parent.height-height)/2//87
                width: (parent.width/2)//200
                height: (parent.width/2)//200
                color: "#00000000"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                border.color: "#ffffff"

                Image {
                    width: 20
                    height: 20
                    anchors.rightMargin: -5
                    anchors.bottom: centralRectangle.top
                    anchors.bottomMargin: -15
                    anchors.right: centralRectangle.right
                    source: "qrc:/JQQRCodeReader/JQQRCodeReader/Frame.png"
                }

                Image {
                    width: 20
                    height: 20
                    rotation: 90
                    anchors.bottom: centralRectangle.bottom
                    anchors.bottomMargin: -5
                    anchors.right: centralRectangle.right
                    anchors.rightMargin: -5
                    source: "qrc:/JQQRCodeReader/JQQRCodeReader/Frame.png"
                }

                Image {
                    width: 20
                    height: 20
                    rotation: 180
                    anchors.bottom: centralRectangle.bottom
                    anchors.bottomMargin: -5
                    anchors.right: centralRectangle.left
                    anchors.rightMargin: -15
                    source: "qrc:/JQQRCodeReader/JQQRCodeReader/Frame.png"
                }

                Image {
                    width: 20
                    height: 20
                    rotation: 270
                    anchors.bottom: centralRectangle.top
                    anchors.bottomMargin: -15
                    anchors.right: centralRectangle.left
                    anchors.rightMargin: -15
                    source: "qrc:/JQQRCodeReader/JQQRCodeReader/Frame.png"
                }

                Image {
                    id: imageLightNeedle
                    width: centralRectangle.width
                    height: 24
                    source: "qrc:/JQQRCodeReader/JQQRCodeReader/LightNeedle.png"

                    PropertyAnimation {  //属性动画
                        id: animationForLightNeedle
                        target: imageLightNeedle
                        property: "y"
                        from: 0
                        to: centralRectangle.height-24//176
                        duration: 4000
                        loops: -1
                        running: true
                        easing.type: Easing.InOutCubic
                    }
                }
            }

            Text {
                id: labelForPrompt
                x: 60
                width: 200
                height: 30
                color: "#ffffff"
                text: "将取景框对着二维码，即可自动扫描。"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.top: centralRectangle.bottom
                anchors.topMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 12
            }
        }
    }

    Timer {             //定时关闭扫码图元
        id: timerForClose
        interval: 200
        running: false
        repeat: false

        onTriggered: {
            jqQRCodeReader.active = false;
        }
    }
}