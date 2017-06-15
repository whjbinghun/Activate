import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

/*
 * 筛选信息
 */

Rectangle {
    id: rct_screen_info
    anchors.fill: parent

    property int gn_btn_height: 30

    Component.onCompleted: {
        //如果用户为销售人员

        //如果用户为区域经理及总经理

    }

    Component {
        id: contactDelegate
        Item {
            width: rct_active.width
            height: column_active.height
            Column {
                id: column_active
                spacing: 5

                SenderList {
                    visible: false
                }

                ApproverInfoList {
                    id: approver_info_list
                }

                Text {
                    text: qsTr( "时间排序")
                }

                Row {
                    Button {
                        text: qsTr( "剩余有效期" )
                    }

                    Button {
                        text: qsTr( "激活时间" )
                    }
                }

                Text {
                    text: qsTr( "是否锁定" )
                }

                Row {
                    Button {
                        text: qsTr( "是" )
                    }

                    Button {
                        text: qsTr( "否" )
                    }
                }

                Row {

                }
            }
        }
    }

    ListModel {
        id: list_active_info
    }

    ListView {
        id: list_view
        anchors.top: parent.top
        height: parent.height - gn_btn_height

        model: list_active_info
        delegate: contactDelegate
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        focus: true
    }

    Row {
        anchors.top: list_view.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        Button {
            width: parent.width/2
            height: gn_btn_height
            text: qsTr( "重置" )
        }

        Button {
            width: parent.width - parent.width/2
            height: gn_btn_height
            text: qsTr( "完成" )
        }
    }
}
