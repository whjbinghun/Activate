import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

/*
 * 审批人列表
 */

Rectangle {
    id: rct_approver_list
    anchors.fill: parent

    Component {
        id: contactDelegate
        Item {
            width: rct_active.width
            height: 30
            Row {
                id: row_approver
                spacing: 10

                Button {
                    visible: (text.length==0?false:true)
                }

                Button {
                    visible: (text.length==0?false:true)
                }

                Button {
                    visible: (text.length==0?false:true)
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
