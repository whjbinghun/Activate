import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

/*
 * 发送人列表
 */

Rectangle {
    id: rct_send_list
    anchors.fill: parent

    Column {
        Text {
            text: qsTr( "发送人" )
        }

        Component {
            id: contactDelegate
            Item {
                width: rct_active.width
                height: 30

                Row {
                    id: row_sender
                    spacing: 10

                    Button {
                        visible: (text.length==0?false:true)
//                        style: ButtonStyle {
//                            background: Image {
//                                source:
//                            }
//                        }
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

}

