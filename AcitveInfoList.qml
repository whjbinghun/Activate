import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

/*
 * 激活信息列表
 */
Rectangle {
    anchors.fill: parent

    signal sig_return_customer()

    Component.onCompleted: {

    }

    /*
     * title
     */
    Rectangle {
        width: parent.width
        height: 40
        //color: Qt.blue//"#0099FFFF"
        border.width: 1
        z: 50
        gradient: Gradient {    //颜色渐变
            GradientStop {position: 0.0; color: "lightsteelblue" }
            GradientStop {position: 1.0; color: "blue" }
        }

        Row {
            anchors.fill: parent
            spacing: 10
            Button {
                width: 40
                height: 40

                //iconSource:
                style: ButtonStyle {
                    background: Rectangle {
                        border.width: 1
                        gradient: Gradient {
                            GradientStop {position: 0.0; color: "lightsteelblue" }
                            GradientStop {position: 1.0; color: "blue" }
                        }
                    }
                }
                onClicked: {
                    emit: sig_return_customer()
                }
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("激活列表")
            }
        }
    }

    //筛选

    /*
     * 已激活信息
     */
    ActivedInfo {
        id: actived_info
        anchors.fill: parent
        anchors.topMargin: 80
        z: 1
    }


}
