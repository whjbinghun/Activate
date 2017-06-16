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
    //anchors.fill: parent

    property int gn_btn_height: 30

    Component.onCompleted: {
        //如果用户为销售人员
        //如果用户为区域经理及总经理
        list_screen_info.clear()
        list_screen_info.append( {"str_sender": "张三:销售1:销售2"
                                    , "str_approver":"王五:经理1"
                                     } )
        countDown.start()
    }

    Component {
        id: contactDelegate
        Item {
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5

            width: rct_screen_info.width
            height: sender_list.height + approver_info_list.height + col_time.height + col_lock.height

            SenderList {
                id: sender_list
                text: str_sender
                visible: false
                //value: sender_value
            }

            ApproverInfoList {
                id: approver_info_list
                anchors.top: (sender_list.visible?sender_list.bottom:parent.top)
                text: str_approver
                visible: false
                //value: approver_value
            }

            Column {
                id: col_time
                anchors.top: approver_info_list.bottom
                anchors.topMargin: 20
                spacing: 5
                Text {
                    text: qsTr( "时间排序")
                }

                Row {
                    spacing: 20
                    Button {
                        text: qsTr( "剩余有效期" )
                    }

                    Button {
                        text: qsTr( "激活时间" )
                    }
                }
            }

            Column {
                id: col_lock
                anchors.top: col_time.bottom
                anchors.topMargin: 20
                spacing: 5
                Text {
                    text: qsTr( "是否锁定" )
                }

                Row {
                    spacing: 20
                    Button {
                        text: qsTr( "是" )
                    }

                    Button {
                        text: qsTr( "否" )
                    }
                }
            }
        }
    }

    ListModel {
        id: list_screen_info
    }

    ListView {
        id: list_view
        anchors.fill: parent

        model: list_screen_info
        delegate: contactDelegate
        //highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        focus: false
        z: 2
    }

    Row {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        z: 10
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

    //测试
    property int n_status: 0

    Timer {
        id:countDown;
        interval: 1000;
        repeat: true;
        triggeredOnStart: true;

        onTriggered: {
            list_screen_info.clear()

            switch( n_status ) {
            case 0:
            {
                list_screen_info.append( {"str_sender": ""
                                            , "str_approver":""
                                             } )
                n_status = 1
            }
                break;
            case 1:
            {
                list_screen_info.append( {"str_sender": ""
                                            , "str_approver":"王五:经理1:经理2"
                                             } )
                n_status = 2
            }
                break;
            case 2:
            {
                list_screen_info.append( {"str_sender": "张三:销售1:销售2"
                                            , "str_approver":"王五:经理1:经理2"
                                             } )
                n_status = 3
            }
                break;
            case 3:
            {
                list_screen_info.append( {"str_sender": "张三:销售1:销售2:销售3:销售4"
                                            , "str_approver":"王五:经理1"
                                             } )
                n_status = 4
            }
                break;
            case 4:
            {
                list_screen_info.append( {"str_sender": "张三:销售1:销售2:销售3:销售4:张三:销售1:销售2:销售3:销售4:张三:销售1:销售2:销售3:销售4"
                                            , "str_approver":"王五:经理1:王五1:经理2:王五3:经理4:王五5:经理6:王五8:经理9:王五10:王五:经理1:王五1:经理2:王五3:经理4:王五5:经理6:王五8:经理9:王五10"
                                             } )
                n_status = 0
                stop()
            }
                break;
            default:
                break;
            }
        }
    }
}
