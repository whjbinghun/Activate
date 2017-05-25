import QtQuick 2.4
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

    visible: false
    modality: Qt.ApplicationModal
    //flags: Qt.MSWindowsFixedSizeDialogHint | Qt.WindowCloseButtonHint

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
                text: "软件激活平台"
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
                text: "登录"
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
                    width: 245
                    height: 40
                    placeholderText: qsTr( "请输入密码" )
                    echoMode: TextInput.Password
                }
            }

            Row {
                spacing: 85
                CheckBox {
                    height: 30
                    text: "记住登录名"
                }

                Button {
                    height: 30
                    text: "忘记密码?"
                    style: ButtonStyle {
                        background: Rectangle {

                        }
                    }

                }
            }

            Button {
                anchors.left: parent.left
                width: parent.width
                height: 35
                text: "登录"
                style: ButtonStyle {
                    background: Rectangle {
                        gradient: Gradient {    //颜色渐变
                            GradientStop {position: 0.0; color: control.pressed?"#ccc":"lightsteelblue" }
                            GradientStop {position: 1.0; color: control.pressed?"#aaa":"blue" }
                        }
                    }
                }
            }
        }
    }
}
