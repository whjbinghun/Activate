import QtQuick.Window 2.0
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

/*
 * 等待锁定 详情信息
 */

Window {
    id: wnd_wait_lock_info
    title: qsTr( "等待锁定" )
    visible: false
    modality: Qt.WindowModal

    signal sig_show_wait_lock_wnd()

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
                text: qsTr("等待锁定")
            }
        }

        Component {
            id: contactDelegate
            Item {
                width: wnd_wait_lock_info.width
                height: column_lock.height
                Column {
                    id: column_lock
                    spacing: 5


                    Text {
                        text: "软件名称:" + soft_name
                        wrapMode: Text.Wrap    //文本换行
                    }

                    Rectangle {//line
                        width: parent.width
                        height: 1
                        border.color: "blue"
                    }

                    Text {
                        text: "软件版本:" + version
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        border.color: "blue"
                    }

                    Text {
                        text: "机器序列码:" + serial_no
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        border.color: "blue"
                    }

                    Text {
                        text: "公司单位名:" + unit_name
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        border.color: "blue"
                    }

                    Text {
                        text: "用户名称:" + username
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        border.color: "blue"
                    }

                    Text {
                        text: "申请单位:" + apply_company_name
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        border.color: "blue"
                    }

                    Text {
                        text: "申请人名称:" + apply_username
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        border.color: "blue"
                    }

                    Text {
                        text: "激活码:" + active_code
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        border.color: "blue"
                    }

                    Row {
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        spacing: 100

                        Button {
                            text: "锁定"
                        }

                        Button {
                            text: "拒绝"
                        }

                    }
                }
            }
        }

        ListModel {
            id: list_wait_lock_info
        }

        ListView {
            anchors.fill: parent
            anchors.topMargin: 40
            model: list_wait_lock_info
            delegate: contactDelegate
            highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
            focus: true
        }
    }
}