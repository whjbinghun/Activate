﻿import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1

Window {
    id: login_page
    title: qsTr( "软件激活平台" )

    property int n_width: 320
    property int n_height: 580

    width: n_width
    height: n_height

    visible: true
    modality: Qt.ApplicationModal
    //flags: Qt.MSWindowsFixedSizeDialogHint | Qt.WindowCloseButtonHint

     Component.onCompleted: {
         lab_warning.text = ""
         login.init_ctrl()
//         text_account.text = login.str_account
//         text_passwd.text = login.str_passwd
//         if( text_account.text.length != 0 && text_passwd.text.length != 0 && login.b_auto_login ) {
//            btn_login.pressed
//         }
     }

    Connections {
        target: login

        onSig_warning: {
            lab_warning.text = str_warning;
        }

        onSig_remember_account: {
            text_account.text = login.str_account
            box_remember_account.checked = b_remember_account;
        }

        onSig_ver_success: {
            login_page.visible = !b_ver_success;
        }

        onSig_show_login: {
            login_page.visible = b_show;
        }
    }

    Column {
        Rectangle {
            width: n_width
            height: 40
            //color: Qt.blue//"#0099FFFF"
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
        Image {
            width: n_width
            height: 150
            source: "images/title.png"
        }

        Column {
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            spacing: 15

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 20
                text: qsTr("登录")
            }

            Row {
                Rectangle {
                    width: 50
                    height: 40
                    border.width: 1
                    Image {
                        anchors.fill: parent
                        source: "images/user.png"
                    }
                }

                TextField {
                    id: text_account
                    width: 245
                    height: 40
                    placeholderText: qsTr("邮箱/账号/手机号" )
                }
            }

            Row {
                Rectangle {
                    width: 50
                    height: 40
                    border.width: 1
                    Image {
                        anchors.fill: parent
                        source: "images/pwd.png"
                    }
                }

                TextField {
                    id: text_passwd
                    width: 245
                    height: 40
                    placeholderText: qsTr( "请输入密码" )
                    echoMode: TextInput.Password
                }
            }

            Row {
                spacing: 85
                CheckBox {
                    id: box_remember_account
                    height: 30
                    text: qsTr("记住登录名")

                    onCheckedChanged: {
                        login.b_remember_account = checked;
                    }
                }

                Button {
                    height: 30
                    text: qsTr("忘记密码?")
                    style: ButtonStyle {
                        background: Rectangle {

                        }
                    }

                }
            }

            Label {
                id: lab_warning
                width: parent.width
                height: 35

                text: qsTr("")

            }

            Button {
                id: btn_login
                anchors.left: parent.left
                width: parent.width
                height: 35
                text: qsTr("登录")
                style: ButtonStyle {
                    background: Rectangle {
                        radius: 8
                        gradient: Gradient {    //颜色渐变
                            GradientStop {position: 0.0; color: control.pressed?"#ccc":"lightsteelblue" }
                            GradientStop {position: 1.0; color: control.pressed?"#aaa":"blue" }
                        }
                    }
                }

                onClicked: {
                    lab_warning.text = ""

                    var str_account = text_account.text;
                    var str_passwd = text_passwd.text;
                    if( str_account.length == 0 ) {
                        lab_warning.text = qsTr("账号不能为空！")
                        return;
                    }

                    if( str_passwd.length == 0 ) {
                        lab_warning.text = qsTr("账号不能为空！")
                        return;
                    }

                    login.send_account( str_account, str_passwd );
                }
            }
        }
    }
}
