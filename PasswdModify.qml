import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

Rectangle {
    signal sig_return_user_details();

    Column {
        Rectangle {
            width: n_width
            height: 40
            border.width: 1
            gradient: Gradient {    //颜色渐变
                GradientStop {position: 0.0; color: "lightsteelblue" }
                GradientStop {position: 1.0; color: "blue" }
            }

            Button {
                //iconSource:
                onPressedChanged: {
                    sig_return_user_details()
                }
            }

            Text {
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("修改密码")
            }
        }

        Column {
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            spacing: 30

            Row {
                Label {
                    text: qsTr("当前密码：")
                }
                TextField {

                }
            }
            Row {
                Label {
                    text: qsTr("新密码：")
                }
                TextField {

                }
            }
            Row {
                Label {
                    text: qsTr("确认新密码：")
                }
                TextField {

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
