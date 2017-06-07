﻿import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import JQQRCodeReader 1.0

/*
 * 拒绝
 */

Rectangle {
    id: rct_refuse
    width: parent.width
    height: parent.height

    Component.onCompleted: {
        list_refuse_audit_info.clear()
        var n_length = audit_data.get_refuse_length()
        for( var i = 0; i<n_length; ++i ) {
            list_refuse_audit_info.append( {"id": i, "status":audit_data.get_refuse_status( i )
                                           ,"date": audit_data.get_refuse_date( i )
                                           , "username":audit_data.get_refuse_send_name( i )
                                           , "approver": audit_data.get_refuse_approver( i )
                                           , "department":audit_data.get_refuse_department( i )
                                           , "soft_name": audit_data.get_refuse_soft_name( i )
                                           , "serial_no":audit_data.get_refuse_serial_num( i ) } )
        }
    }

    Component {
        id: contactDelegate
        Item {
            width: rct_refuse.width
            height: column_refuse.height
            Column {
                id: column_refuse
                spacing: 5
                Row {
                    spacing: rct_refuse.width - (text_status.width + text_date.width)
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
                Text {
                    text: '<b>现场设备录入系统</b> '
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

                Rectangle {
                   width:  rct_refuse.width
                   height: 1
                   color: "black"
                }
            }
        }
    }

    ListModel {
        id: list_refuse_audit_info
        //ListElement { date: ""; username: ""; department: "";soft_name:""; serial_no: "" }
    }

      ListView {
          anchors.fill: parent
          model: list_refuse_audit_info
          delegate: contactDelegate
          highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
          focus: true
      }
}
