import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import "common_qml"

/*
 * 已激活信息
 */
Rectangle {
    id: rct_active
    width: parent.width
    height: parent.height

    Component.onCompleted: {
        list_active_info.clear()
        var n_length = audit_data.get_audit_length()
        for( var i = 0; i<n_length; ++i ) {
            if( audit_data.get_audit_status( i ) !== "激活成功!" ) continue;

            list_active_info.append( {"id": i, "status":audit_data.get_audit_status( i )
                                           ,"date": audit_data.get_audit_date( i )
                                           , "username":audit_data.get_audit_send_name( i )
                                           , "approver":audit_data.get_audit_approver( i )
                                           , "effective_days":audit_data.get_audit_effective_days( i )
                                           , "department":audit_data.get_audit_department( i )
                                           , "soft_name": audit_data.get_audit_soft_name( i )
                                           , "serial_no":audit_data.get_audit_serial_num( i )
                                           , "activation_code": audit_data.get_audit_activation_code( i ) } )
        }
    }

    Component {
        id: contactDelegate
        Item {
            width: rct_active.width
            height: column_active.height
            Column {
                id: column_active
                spacing: 5
                Row {
                    spacing: rct_active.width - (text_status.width + text_date.width)
                    Text {
                        id: text_status
                        text: status
                        font.pixelSize: 14
                    }
                    Text {
                        id: text_date
                        text: date
                        font.pixelSize: 14
                    }
                }
                Text {
                    text: '<b>发送人:</b> ' + username + '(' + department + ')'
                    font.pixelSize: 14
                }
                Text {
                    text: '<b>审批人:</b> ' + approver + '(' + department + ')'
                    font.pixelSize: 14
                }

                Row {
                    spacing: rct_active.width - ( text_eff_days.width + btn_lock.width)
                    Text {
                        id: text_eff_days
                        text: '<b>剩余有效天数:</b> ' + effective_days +'天'
                        font.pixelSize: 14
                    }

                    Button {
                        id: btn_lock
                        style: ButtonStyle {
                            label: Text {
                                color: "white"
                                text: "锁定"
                            }

                            background: Rectangle {
                                radius: 4
                                gradient: Gradient {
                                    GradientStop {position: 0.0; color: "#0099FF" }
                                    GradientStop {position: 1.0; color: "#0099FF" }
                                }
                            }
                        }

                        onClicked: {
                            dlg_lock.visible = true
                        }
                    }
                }

                Text {
                    text: '<b>现场设备录入系统</b>'
                    font.pixelSize: 14
                }
                Text {
                    text: soft_name
                    font.pixelSize: 14
                }

                Text {
                    text: '<b>机器序列码:</b> ' + serial_no
                    font.pixelSize: 14
                }
                Text {
                    text: '<b>激活码:</b> ' + activation_code
                    font.pixelSize: 14
                }

                Line {
                    width:  rct_active.width
                }
            }
        }
    }

    ListModel {
        id: list_active_info
        //ListElement { date: ""; username: ""; department: "";soft_name:""; serial_no: "" }
    }

    ListView {
        anchors.fill: parent
        model: list_active_info
        delegate: contactDelegate
        //highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        focus: true
        spacing: 10
    }

    Dialog {
        id: dlg_lock
        title: "提示"
        visible: false
        //standardButtons: StandardButton.Ok | StandardButton.Cancel
        contentItem: Rectangle {
            //color: "lightskyblue"
            implicitWidth: 300
            implicitHeight: 150

            Column {
                anchors.fill: parent
                anchors.topMargin: 30
                spacing: 20
                Text {
                    text: "<b>是否锁定激活码？</b>"
                    color: "navy"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    text: "(锁定后激活码无效)"
                    color: "navy"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Row {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 30
                    Button {
                        width: parent.width/2
                        height: 30
                        style: ButtonStyle {
                            label: Text {
                                color: "blue"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                text: "确定"
                            }

                            background: Rectangle {
                                border.width: 1
                                gradient: Gradient {
                                    GradientStop {position: 0.0; color: "white" }
                                    GradientStop {position: 1.0; color: "white" }
                                }
                            }
                        }

                        onClicked: {
                            dlg_lock.visible = false
                            //系统将锁定信息发送给销售员对应的区域经理，若区域经理手机中软件激活平台APP处于运行状态，则锁定信息以弹框的形式显示
                        }
                    }

                    Button {
                        width: parent.width - parent.width/2
                        height: 30
                        style: ButtonStyle {
                            label: Text {
                                color: "blue"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                text: "取消"
                            }
                            background: Rectangle {
                                border.width: 1
                                gradient: Gradient {
                                    GradientStop {position: 0.0; color: "white" }
                                    GradientStop {position: 1.0; color: "white" }
                                }
                            }
                        }

                        onClicked: {
                            dlg_lock.visible = false
                        }
                    }
                }
            }
        }
    }
}

