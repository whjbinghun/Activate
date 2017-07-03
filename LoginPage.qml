import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1

Window {
    id: login_page
    title: qsTr( "软件激活平台" )
    //visibility: Window.Maximized
    visible: true
    modality: Qt.ApplicationModal
    //flags: Qt.MSWindowsFixedSizeDialogHint | Qt.WindowCloseButtonHint

    property int gn_single_height: height/12

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
            login_page.visibility = Window.Maximized
        }
    }

    Column {
        id: col_title
        Rectangle {
            width: login_page.width
            height: gn_single_height
            gradient: Gradient {    //颜色渐变
                GradientStop {position: 0.0; color: "#0099FF" }
                GradientStop {position: 1.0; color: "#0099FF" }
            }

            Text {
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
                text: qsTr("软件激活平台")
            }
        }
        Image {
            width: login_page.width
            height: gn_single_height*3
            source: "title.png"
        }
    }

    Column {
        anchors.top: col_title.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        spacing: 20

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 20
            text: qsTr("登录")
        }

        Row {
            width: parent.width
            Rectangle {
                id: rect_user
                width: gn_single_height
                height: gn_single_height
                border.width: 1
                Image {
                    anchors.fill: parent
                    source: "user.png"
                }
            }

            TextField {
                id: text_account
                width: parent.width - rect_user.width
                height: gn_single_height
//                validator: RegExpValidator {
//                    regExp: /![\u4e00-\u9fa5]$/
//                }   //正则表达式
                placeholderText: qsTr("邮箱/账号/手机号" )
                style: TextFieldStyle {
                    background: Rectangle {
                        border.width: 1
                    }
                }
            }
        }

        Row {
            Rectangle {
                width: gn_single_height
                height: gn_single_height
                border.width: 1
                Image {
                    anchors.fill: parent
                    source: "pwd.png"
                }
            }

            TextField {
                id: text_passwd
                width: text_account.width
                height: gn_single_height
                placeholderText: qsTr( "请输入密码" )
                echoMode: TextInput.Password
                style: TextFieldStyle {
                    background: Rectangle {
                        border.width: 1
                    }
                }
            }
        }

        Row {
            spacing: parent.width - ( box_remember_account.width + btn_forget_passwd.width )
            CheckBox {
                id: box_remember_account
                height: gn_single_height
                text: qsTr("记住登录名")

                onCheckedChanged: {
                    login.b_remember_account = checked;
                }
            }

            Button {
                id: btn_forget_passwd
                height: gn_single_height
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
            height: gn_single_height

            text: qsTr("")

        }

        Button {
            id: btn_login
            anchors.left: parent.left
            width: parent.width
            height: gn_single_height
            style: ButtonStyle {
                label: Text {
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                    text: qsTr("登录")
                    font.bold: true
                }

                background: Rectangle {
                    radius: gn_single_height/5
                    gradient: Gradient {    //颜色渐变
                        GradientStop {position: 0.0; color: control.pressed?"#ccc":"#0099FF" }
                        GradientStop {position: 1.0; color: control.pressed?"#aaa":"#0099FF" }
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
