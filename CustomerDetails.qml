﻿import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
/**
  * 用户详情界面
  */
Rectangle {
    id: customer_details

    anchors.fill: parent

    property int gn_single_height: parent.height/12
    signal sig_return_customer()
    signal sig_return_login()
    signal sig_quit()

    MouseArea {
        //手往左边滑动，窗口移动向左边
    }

    Column {
        id: column_title
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: gn_single_height + image_title.height

        Rectangle {
            width: parent.width
            height: gn_single_height
            //border.width: 1
            gradient: Gradient {    //颜色渐变
                GradientStop {position: 0.0; color: "#0099FF" }
                GradientStop {position: 1.0; color: "#0099FF" }
            }

            Row {
                spacing: 10

                Button {
                    //iconSource:
                    height: gn_single_height
                    opacity: 0

                    onClicked: {
                        emit: sig_return_customer()
                    }
                }

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    color: "white"
                    font.pointSize: 14
                    text: qsTr("软件激活平台")
                }
            }
        }

        Image {
            id: image_title
            width: parent.width
            height: gn_single_height*3
            source: "title.png"
        }
    }

    Column {
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: column_title.bottom
        anchors.topMargin: 20
        spacing: gn_single_height/2

        Row {
            Label {
                text: qsTr(" 姓名")
                font.pointSize: 16
            }

            Text {
                id: txt_user_name
                font.pointSize: 16
            }
        }

        Row {
            Label {
                text: qsTr(" 部门")
                font.pointSize: 16
            }
            Text {
                id: txt_dep_name
                font.pointSize: 16
            }
        }
        Row {
            Label {
                text: qsTr(" 账号")
                font.pointSize: 16
            }
            Text {
                id: txt_account
                font.pointSize: 16
            }
        }
        Button {
            style: ButtonStyle {
                label: Text {
                    text: qsTr("登录密码修改")
                    font.pointSize: 16
                }

                background: Rectangle {

                }
            }
            onClicked: {
                customer_details.visible = false

                passwd_modify.visible = true
            }
        }
        Button {
            style: ButtonStyle {
                label: Text {
                    text: qsTr("账号切换")
                    font.pointSize: 16
                }
                background: Rectangle {

                }
            }

            onClicked: {
                emit: sig_return_login()
            }
        }
        Button {
            style: ButtonStyle {
                label: Text {
                    text: qsTr("退出")
                    font.pointSize: 16
                }
                background: Rectangle {

                }
            }

            onClicked: {
                emit: sig_quit()
            }
        }
    }

    onVisibleChanged: {
        if( visible ) {
            txt_user_name.text = login.str_username
            txt_account.text = login.str_account
        } else {
            txt_user_name.text = ""
            txt_account.text = ""
        }
    }

    Connections {
        target: passwd_modify
        onSig_return_user_details: {
            passwd_modify.init_info()
            passwd_modify.visible = false
            customer_details.visible = true
        }
    }
}
