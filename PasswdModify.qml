import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

Rectangle {
    anchors.fill: parent

    signal sig_return_user_details();

    Rectangle {
        id: rect_title
        width: n_width
        height: 40
        border.width: 1
        gradient: Gradient {    //颜色渐变
            GradientStop {position: 0.0; color: "lightsteelblue" }
            GradientStop {position: 1.0; color: "blue" }
        }

        Row {
            spacing: 10
            Button {
                //iconSource:
                height: 40
                opacity: 0
//                style: ButtonStyle {
//                    background: Rectangle {

//                        gradient: Gradient {    //颜色渐变
//                            GradientStop {position: 0.0; color: control.pressed?"#ccc":"lightsteelblue" }
//                            GradientStop {position: 1.0; color: control.pressed?"#aaa":"blue" }
//                        }
//                    }
//                }

                onClicked: {
                    emit: sig_return_user_details()
                }
            }

            Text {
//                anchors.left: parent.left
//                anchors.leftMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("修改密码")
            }
        }
    }

    Column {
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: rect_title.bottom
        anchors.topMargin: 20

        spacing: 30

        Grid {
            rows: 3
            columns: 2
            spacing: 20

            Label {
                height: 40
                text: qsTr("当前密码：")
                verticalAlignment: Text.AlignVCenter
            }
            TextField {
                id: text_cur_passwd
                width: 200
                height: 40
            }

            Label {
                height: 40
                text: qsTr("新密码：")
                verticalAlignment: Text.AlignVCenter
            }
            TextField {
                id: text_new_passwd
                width: 200
                height: 40
            }

            Label {
                height: 40
                text: qsTr("确认新密码：")
                verticalAlignment: Text.AlignVCenter
            }
            TextField {
                id: text_sure_new_passwd
                width: 200
                height: 40
            }
        }

        Label {
            text: qsTr("密码长度至少6个字符，最多32个字符")
        }

        Button {
            width: parent.width
            height: 30
            text: qsTr("确认")
            style: ButtonStyle {
                background: Rectangle {
                    radius: 4
                    gradient: Gradient {    //颜色渐变
                        GradientStop {position: 0.0; color: control.pressed?"#ccc":"lightsteelblue" }
                        GradientStop {position: 1.0; color: control.pressed?"#aaa":"blue" }
                    }
                }
            }
        }
    }

    function init_info() {
        text_cur_passwd.text = ""
        text_new_passwd.text = ""
        text_sure_new_passwd.text = ""
    }
}
