import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

Rectangle {
    id: avtive_info_details
    anchors.fill: parent

    property int gn_single_height: parent.height/12
    signal sig_see_active_info()

    Rectangle {
        id: rct_title
        anchors.left: parent.left
        anchors.top: parent.top

        width: parent.width
        height: gn_single_height

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
                text: qsTr("激活信息")
            }
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
            height: gn_single_height*2
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
            text: qsTr("激活信息已发送成功！")
        }

        Text {
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: qsTr("正在生成激活码，请稍后......")
        }

        Button {
            width: parent.width
            height: gn_single_height
            style: ButtonStyle {
                label: Text {
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr("查看激活信息")
                    color: "white"
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
                emit: sig_see_active_info()
            }
        }
    }
}
