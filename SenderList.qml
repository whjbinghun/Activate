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
    //anchors.fill: parent

    property string text
    property int value
    property int gn_btn_height: 30

    Text {
        id: text_sender
        anchors.top: parent.top
        anchors.topMargin: 20
        height: 20
        text: qsTr( "发送人" )

    }

    Component {
        id: contactDelegate
        Item {
            width: rct_send_list.width
            height: 30

            Row {
                id: row_sender
                spacing: 20

                Button {
                    text: user_name_1
                    visible: (text.length==0?false:true)
//                        style: ButtonStyle {
//                            background: Image {
//                                source:
//                            }
//                        }
                }

                Button {
                    text: user_name_2
                    visible: (text.length==0?false:true)
                }

                Button {
                    text: user_name_3
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
        anchors.top: text_sender.bottom
        anchors.left: text_sender.left
        height: parent.height - text_sender.x - text_sender.height
        model: list_active_info
        delegate: contactDelegate
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        focus: true
    }

    onTextChanged: {
        list_active_info.clear()

        if( text.length === 0 ) {
            visible = false
        } else {
            visible = true
            var strList = text.split(":")
            var n_len_row = Math.floor( strList.length/3 )
            var n_len_leave = strList.length%3    //余

            for( var i =0; i< n_len_row; ++i ) {
                list_active_info.append( {"user_name_1":strList[i*3], "user_name_2":strList[i*3+1], "user_name_3":strList[i*3+2] } )
            }

            if( n_len_leave == 1 ) {
                list_active_info.append( {"user_name_1": strList[n_len_row*3+1], "user_name_2":"", "user_name_3":"" } )
            } else if( n_len_leave == 2 ) {
                list_active_info.append( {"user_name_1": strList[n_len_row*3+1], "user_name_2":strList[n_len_row*3+2], "user_name_3":"" } )
            }

            var n_height = n_len_row * gn_btn_height + (n_len_leave > 0 ? gn_btn_height:0)

            height = n_height + gn_btn_height
        }
    }
}

