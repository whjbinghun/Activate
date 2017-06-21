import QtQuick.Window 2.0
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

/*
 * 等待激活
 */

Window {
    id: wnd_wait_active
    title: qsTr( "等待激活" )
    visible: false
    modality: Qt.WindowModal
    flags: Qt.MSWindowsFixedSizeDialogHint | Qt.WindowCloseButtonHint

    signal sig_show_wait_active_wnd()

    Column {
        Rectangle {
            width: n_width
            height: 40
            border.width: 1
            gradient: Gradient {    //颜色渐变
                GradientStop {position: 0.0; color: "#0099FF" }
                GradientStop {position: 1.0; color: "#0099FF" }
            }

            Text {
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("等待激活")
            }
        }

        Row {
            Text {
                id: text_send_name
                color: "blue"
                text: qsTr( "发送人" )
            }

            Text {
                id: text_send_date
                color: "blue"
                text: qsTr( "" )
            }
        }
        Text {
            id: text_soft
            text: qsTr( "软件名称:")
        }

        Text {
            id: text_soft_name
            text: qsTr( "" )
        }

        Text {
            id: text_serial_no
            text: qsTr( "机器序列码：")
        }

        Row {
            Button {
                id: btn_close
                style: ButtonStyle {
                    label: Text {
                        color: "blue"
                        text: qsTr( "关闭" )
                    }
                }

                onClicked: {
                    wnd_wait_active.visible = false
                }
            }

            Button {
                id: btn_see
                style: ButtonStyle {
                    label: Text {
                        color: "blue"
                        text: qsTr( "查看" )
                    }
                }
                onClicked: {
                    wnd_wait_active.visible = false
                    emit: sig_show_wait_active_wnd()
                }
            }
        }
    }
}
