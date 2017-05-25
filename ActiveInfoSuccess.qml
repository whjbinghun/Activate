import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

Rectangle {
    id: avtive_info_details

    property int n_width: 320
    property int n_height: 580

    width: n_width
    height: n_height

    Rectangle {
        id: rct_title
        anchors.left: parent.left
        anchors.top: parent.top

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
            text: "激活信息"
        }
    }

    //qrc:/ActiveInfoSuccess.qml:38:5: QML Column: Cannot specify top, bottom, verticalCenter, fill or centerIn anchors for items inside Column. Column will not function.
    //报错，有可能是子控件中anchors使用不正确
    Column {
        anchors.top: rct_title.bottom
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        spacing: 20

        Rectangle {
            width: parent.width
            height: 60
            border.width: 1
            Image {
                id: image_suc
                source: ""
            }
        }

        Text {
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 17
            text: "激活信息已发送成功！"
        }

        Text {
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "正在生成激活码，请稍后......"
        }

        Button {
            width: parent.width
            height: 30
            text: "查看激活信息"
            style: ButtonStyle {

                background: Rectangle {
                    radius: 8
                    gradient: Gradient {    //颜色渐变
                        GradientStop {position: 0.0; color: control.pressed?"#ccc":"lightsteelblue" }
                        GradientStop {position: 1.0; color: control.pressed?"#aaa":"blue" }
                    }
                }
            }
        }
    }
}
