import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

Rectangle {
    id: rct_customer
    anchors.fill: parent

    property alias user_info_text: txt_user_info.text
    signal sig_clicked_user()

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
                text: "软件激活平台"
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
                    text: ""
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
                text: "扫描二维码"

            }
            Button {
                id: approve_info
                height: 40
                text: "审批信息"
                //iconSource: "images/dep_info.png"

            }
            Button {
                id: active_list
                height: 40
                text: "激活列表"
                //iconSource: "images/active.png"
                onPressedChanged: {
                    //customer_details.visible = true
                    //passwd_modify.visible = true
                    see_active_info.visible = true
                }
            }
        }
    }
}
