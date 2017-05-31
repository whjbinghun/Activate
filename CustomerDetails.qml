import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
/**
  * 用户详情界面
  */
Rectangle {
    id: customer_details

    property int n_width: 320
    property int n_height: 580

    width: n_width
    height: n_height

    MouseArea {
        //手往左边滑动，窗口移动向左边
    }

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
            spacing: 20

            Row {
                Label {
                    text: "姓名"
                }

                Text {
                    id: txt_user_name
                }
            }

            Row {
                Label {
                    text: "部门"
                }
                Text {
                    id: txt_dep_name
                }
            }
            Row {
                Label {
                    text: "账号"
                }
                Text {
                    id: txt_account
                }
            }
            Button {
                text: "登录密码修改"
                style: ButtonStyle {
                    background: Rectangle {

                    }
                }
                onPressedChanged: {
                    customer_details.visible = false

                    passwd_modify.visible = true
                }
            }
            Button {
                text: "账号切换"
                style: ButtonStyle {
                    background: Rectangle {

                    }
                }
            }
            Button {
                text: "退出"
                style: ButtonStyle {
                    background: Rectangle {

                    }
                }
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
}
