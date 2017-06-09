import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import JQQRCodeReader 1.0

Rectangle {
    id: rct_customer
    anchors.fill: parent

    property alias user_info_text: txt_user_info.text
    signal sig_clicked_user()
    signal sig_return_login()
    signal sig_quit()

    Rectangle {
        id: rct_content
        anchors.fill: parent
        Column {
            Rectangle {
                width: n_width
                height: 40
                border.width: 1
                gradient: Gradient {    //颜色渐变
                    GradientStop {position: 0.0; color: "lightsteelblue" }
                    GradientStop {position: 1.0; color: "blue" }
                }

                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("软件激活平台")
                }
            }

            Rectangle {
                width: n_width
                height: 150

                Column {
                    anchors.fill: parent
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 60
                        height: 60
                        source: "images/user.png"
                        sourceSize.width: 60
                        sourceSize.height: 60

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                emit: sig_clicked_user()
                            }
                        }
                    }
                    Text {
                        id: txt_user_info
                        width: parent.width
                        horizontalAlignment: Text.AlignHCenter
                        text: qsTr("")
                    }
                }
            }

            Column {
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                spacing: 20
                Button {
                    id: scan_qr
                    height: 40
                    //iconSource: "images/qr.jpg"
                    text: qsTr("扫描二维码")

                    onClicked: {
                        rct_content.visible = false
                        scan_code.visible = true;
                    }

                }
                Button {
                    id: approve_info
                    height: 40
                    text: qsTr("审批信息")
                    //iconSource: "images/dep_info.png"
                    onClicked: {
                        rct_content.visible = false
                        approval_info.visible = true
                    }
                }
                Button {
                    id: active_list
                    height: 40
                    text: qsTr("激活列表")
                    //iconSource: "images/active.png"
                    onClicked: {
                        rct_content.visible = false
                        active_info_list.visible = true
                    }
                }
            }
        }
    }

    ScanCode {
        id: scan_code
        anchors.fill: parent
        visible: false
    }

    ApprovalInfo {//审批信息
        id: approval_info
        anchors.fill: parent
        visible: false
    }

    AcitveInfoList {//激活信息列表
        id: active_info_list
        anchors.fill: parent
        visible: false
    }

    Connections {
        target: customer_details
        onSig_return_login: {
            emit: sig_return_login()
        }

        onSig_quit: {
            emit: sig_quit()
        }
    }

    Connections {
        target: scan_code
        onSig_qrCode_return: {
            var qr_text = scan_code.qr_text
            scan_code.visible = false
            rct_content.visible = true
        }
    }

    Connections {
        target: approval_info
        onSig_return_customer: {

            approval_info.visible = false
            rct_content.visible = true
        }
    }

    Connections {
        target: active_info_list
        onSig_return_customer: {
            active_info_list.visible = false
            rct_content.visible = true
        }
    }
}
