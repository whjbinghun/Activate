import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import JQQRCodeReader 1.0
import "common_qml"

/*
 * 已审核
 */
Rectangle {
    id: rct_audited
    width: parent.width
    height: parent.height

    Component.onCompleted: {
        list_audit_info.clear()
        var n_length = audit_data.get_audit_length()
        for( var i = 0; i<n_length; ++i ) {
            list_audit_info.append( {"id": i, "status":audit_data.get_audit_status( i )
                                           ,"date": audit_data.get_audit_date( i )
                                           , "username":audit_data.get_audit_send_name( i )
                                           , "approver": audit_data.get_audit_approver( i )
                                           , "department":audit_data.get_audit_department( i )
                                           , "soft_name": audit_data.get_audit_soft_name( i )
                                           , "serial_no":audit_data.get_audit_serial_num( i )
                                           , "activation_code": audit_data.get_audit_activation_code( i ) } )
        }
    }

    Component {
        id: contactDelegate
        Item {
            width: rct_audited.width
            height: column_audited.height
            Column {
                id: column_audited
                spacing: 5

                Column {
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    spacing: 5

                    Row {
                        spacing: rct_audited.width - (text_status.width + text_date.width+20)
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
                    Text {
                        text: '<b>激活码:</b> ' + activation_code
                        font.pixelSize: 14
                    }
                }

                Line {
                    width:  rct_audited.width
                }
            }
        }
    }

    ListModel {
        id: list_audit_info
        //ListElement { date: ""; username: ""; department: "";soft_name:""; serial_no: "" }
    }

      ListView {
          anchors.fill: parent
          model: list_audit_info
          delegate: contactDelegate
          //highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
          focus: true
          spacing: 10
      }
}
