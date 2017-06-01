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

    property string qr_text: ""   //二维码内容

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
                    text: "返回"
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
                        emit: sig_qrCode_return()
                    }
                }

                Text {
//                        anchors.left: parent.left
//                        anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: "软件激活平台"
                }
            }
        }

        JQQRCodeReader {
            id: qr_code_reader
            height: parent.height - 40

            onTagFound: {
                qr_text = tag;
                qr_code_reader.active = false
            }
        }
    }
}
