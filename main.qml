﻿import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1

Window {
    id: wnd_user_info
    visible: login.b_auto_login

    property int n_width: 320
    property int n_height: 580

    width: n_width
    height: n_height

    modality: Qt.ApplicationModal
    //flags: Qt.MSWindowsFixedSizeDialogHint | Qt.WindowCloseButtonHint

    /*
     *  客户显示界面
     */

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
                    height: parent.height - 30
                    source: "images/user.png"

                    MouseArea {
                        onPressed: {
                            //客户详细信息界面显示
                            customer_details.visible = true

                        }
                    }
                }
                Text {
                    id: txt_user_info
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "张三（销售部）"
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

    CustomerDetails {
        id: customer_details
        visible: false
    }

    //测试界面显示

    PasswdModify {
        id: passwd_modify
        visible: false
    }

    ActiveInfoDetails {
        id: active_info_details
        visible: false
    }

    ActiveInfoSuccess {
        id: active_info_success
        visible: false
    }

    SeeActiveInfo {
        id: see_active_info
        visible: false
    }

}
