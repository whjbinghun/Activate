import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import JQQRCodeReader 1.0

/**
  * 扫二维码
  */

Rectangle {
    id: rct_scan_code
    anchors.fill: parent

    signal sig_qrCode_return()

    property string qr_text: qsTr("")   //二维码内容

    onVisibleChanged: {
        qr_code_reader.active = visible
    }

    Column {
        anchors.fill: parent
        Rectangle {
            width: n_width
            height: 40

            border.width: 1
            gradient: Gradient {    //颜色渐变
                GradientStop {position: 0.0; color: "lightsteelblue" }
                GradientStop {position: 1.0; color: "blue" }
            }

            Row {
                anchors.fill: parent
                spacing: 10
                Button {
                    id: btn_return
                    text: qsTr("返回")
                    style: ButtonStyle {
                        background: Rectangle {
                            //implicitWidth: 100
                            implicitHeight: 40
                            border.width: 0
                            gradient: Gradient {    //颜色渐变
                                GradientStop {position: 0.0; color: "lightsteelblue" }
                                GradientStop {position: 1.0; color: "blue" }
                            }
                        }
                    }

                    onClicked: {
                        qr_text = "现场设备录入系统（yfplatform-single-pro-basic-data):2.1.5.8:14324324:sdfjsd:张三:第三方库就是开发:章三"
                        emit: sig_qrCode_return()
                    }
                }

                Text {
//                        anchors.left: parent.left
//                        anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("软件激活平台")
                }
            }
        }

        JQQRCodeReader {
            id: qr_code_reader
            height: parent.height - 40

            onTagFound: {
                qr_text = tag;
                if( qr_text.length == 0 ) {
                    //给一个提示信息
                } else {
                    emit: sig_qrCode_return()
                }
            }
        }
    }
}
