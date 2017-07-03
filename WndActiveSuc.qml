import QtQuick.Window 2.0
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

/*
 * 激活成功
 */

Window {
    id: wnd_wait_active
    title: qsTr( "激活成功" )
    visible: false
    modality: Qt.WindowModal
    width: 300
    flags: Qt.MSWindowsFixedSizeDialogHint | Qt.WindowCloseButtonHint

    property int gn_single_height: parent.height/12
    signal sig_show_wait_active_wnd()

    Rectangle {
        id: rect_title
        width: parent.width
        height: gn_single_height
        border.width: 1
        gradient: Gradient {    //颜色渐变
            GradientStop {position: 0.0; color: "#0099FF" }
            GradientStop {position: 1.0; color: "#0099FF" }
        }

        Text {
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("激活成功")
        }
    }

    Column {
        anchors.top: rect_title.bottom
        anchors.topMargin: 8
        spacing: 8
        Row {
            Text {
                id: text_approver_name
                width: wnd_wait_active.width/2
                text: qsTr( "审批人:" )
            }

            Text {
                id: text_approver_date
                width: wnd_wait_active.width - wnd_wait_active.width/2
                text: qsTr( "审批时间:" )
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
            text: qsTr( "机器序列码:" )
        }

        Text {
            id: text_active_code
            text: qsTr( "激活码:" )
        }

        Row {
            Button {
                id: btn_close
                width: wnd_wait_active.width/2
                height: gn_single_height
                text: qsTr( "关闭" )
                onClicked: {
                    wnd_wait_active.visible = false
                }
            }

            Button {
                id: btn_see
                width: wnd_wait_active.width - wnd_wait_active.width/2
                height: gn_single_height
                text: qsTr( "查看" )
                onClicked: {
//                    wnd_wait_active.visible = false
//                    emit: sig_show_wait_active_wnd()
                }
            }
        }
    }
}
