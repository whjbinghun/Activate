import QtQuick.Window 2.0
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import "common_qml"

/*
 * 等待激活 详情信息
 */

Window {
    id: wnd_wait_active_info
    title: qsTr( "等待激活" )
    visible: false
    modality: Qt.WindowModal

    property int gn_single_height: parent.height/12
    signal sig_show_wait_active_wnd()

    Column {
        Rectangle {
            width: wnd_wait_active_info.width
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
                text: qsTr("等待激活")
            }
        }

        Component {
            id: contactDelegate
            Item {
                width: wnd_wait_active_info.width
                height: column_active.height
                Column {
                    id: column_active
                    spacing: 5


                    Text {
                        text: "软件名称:" + soft_name
                        wrapMode: Text.Wrap    //文本换行
                    }

                    Line {
                        width: parent.width
                    }

                    Text {
                        text: "软件版本:" + version
                    }

                    Line {
                        width: parent.width
                    }

                    Text {
                        text: "机器序列码:" + serial_no
                    }

                    Line {
                        width: parent.width
                    }

                    Text {
                        text: "公司单位名:" + unit_name
                    }

                    Line {
                        width: parent.width
                    }

                    Text {
                        text: "用户名称:" + username
                    }

                    Line {
                        width: parent.width
                    }

                    Text {
                        text: "申请单位:" + apply_company_name
                    }

                    Line {
                        width: parent.width
                    }

                    Text {
                        text: "申请人名称:" + apply_username
                    }

                    Line {
                        width: parent.width
                    }

                    Text {
                        text: "备注:"
                    }

                    Line {
                        width: parent.width
                    }

                    Row {
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        spacing: 10

                        Button {
                            height: gn_single_height
                            text: "审批"
                        }

                        Button {
                            height: gn_single_height
                            text: "生成并发送"
                        }

                        Button {
                            height: gn_single_height
                            text: "拒绝"
                        }

                    }
                }
            }
        }

        ListModel {
            id: list_wait_active_info
        }

        ListView {
            anchors.fill: parent
            anchors.topMargin: gn_single_height
            model: list_wait_active_info
            delegate: contactDelegate
            //highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
            focus: true
        }
    }
}
