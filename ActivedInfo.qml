import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

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
                Text {
                    text: '<b>剩余有效天数:</b> ' + effective_days +'天'
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
                Rectangle {
                   width:  rct_active.width
                   height: 1
                   color: "black"
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
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        focus: true
    }
}

