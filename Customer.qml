import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1

Rectangle {
    id: rct_customer
    anchors.fill: parent

    property alias user_info_text: txt_user_info.text
    property int gn_single_height: parent.height/12
    signal sig_clicked_user()
    signal sig_return_login()
    signal sig_quit()

    Rectangle {
        id: rect_title
        width: parent.width
        height: gn_single_height
        //border.width: 1
        gradient: Gradient {    //颜色渐变
            GradientStop {position: 0.0; color: "#0099FF" }
            GradientStop {position: 1.0; color: "#0099FF" }
        }

        Text {
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("软件激活平台")
            color: "white"
        }
    }

    Rectangle {
        id: rct_content
        anchors.fill: parent
        anchors.topMargin: gn_single_height
        Column {
            anchors.fill: parent
            Rectangle {
                width: parent.width
                height: gn_single_height*4

                Column {
                    anchors.fill: parent
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width/3
                        height: parent.width/3
                        source: "user.png"
//                        sourceSize.width: 60
//                        sourceSize.height: 60

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                emit: sig_clicked_user()
                            }
                        }
                    }
                    Text {
                        id: txt_user_info
                        width: parent.width
                        horizontalAlignment: Text.AlignHCenter
                        text: qsTr("")
                        font.pointSize: 16
                    }
                }
            }

            Column {
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                spacing: 20

                Rectangle {
                    width: scan_qr.width + text_qr.width
                    height: gn_single_height
                    Row {
                        Image {
                            id: scan_qr
                            width: gn_single_height
                            height: gn_single_height
                            source: "qr.jpg"
                        }
                        Text {
                            id: text_qr
                            height: gn_single_height
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: qsTr( "扫描二维码" )
                            font.pointSize: 20
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            rct_content.visible = false
                            scan_code.visible = true
                        }
                    }
                }

                Rectangle {
                    width: approve_info.width + text_approve_info.width
                    height: gn_single_height
                    Row {
                        Image {
                            id: approve_info
                            width: gn_single_height
                            height: gn_single_height
                            source: "dep_info.png"
                        }
                        Text {
                            id: text_approve_info
                            height: gn_single_height
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: qsTr(" 审批信息")
                            font.pointSize: 20
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            rct_content.visible = false
                            approval_info.visible = true
                        }
                    }
                }

                Rectangle {
                    width: active_list.width + text_active_list.width
                    height: gn_single_height
                    Row {
                        Image {
                            id: active_list
                            width: gn_single_height
                            height: gn_single_height
                            source: "active.png"
                        }
                        Text {
                            id: text_active_list
                            height: gn_single_height
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: qsTr(" 激活列表")
                            font.pointSize: 20
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            rct_content.visible = false
                            active_info_list.visible = true
                        }
                    }
                }
            }
        }
    }

    ScanCode {
        id: scan_code
        anchors.fill: parent
        visible: false
    }

    ApprovalInfo {//审批信息
        id: approval_info
        anchors.fill: parent
        visible: false
    }

    AcitveInfoList {//激活信息列表
        id: active_info_list
        anchors.fill: parent
        visible: false
    }

    ActiveInfoDetails {
        id: active_info_details
        anchors.fill: parent
        visible: false
    }

    ActiveInfoSuccess {
        id: active_info_suc
        anchors.fill: parent
        visible: false
    }

    SeeActiveInfo {
        id: see_active_info
        anchors.fill: parent
        visible: false
    }

    Connections {
        target: customer_details

        onSig_return_customer: {
            customer_details.visible = false
            rct_customer.visible = true
        }

        onSig_return_login: {
            emit: sig_return_login()
        }

        onSig_quit: {
            emit: sig_quit()
        }
    }

    Connections {
        target: scan_code
        onSig_qrCode_return: {
            var qr_text = scan_code.qr_text
            scan_code.visible = false

            if( qr_text.length == 0 ) {
                rct_content.visible = true
            } else {
                active_info_details.visible = true
                active_info_details.set_active_info( qr_text )
            }
        }
    }

    Connections {
        target: approval_info
        onSig_return_customer: {

            approval_info.visible = false
            rct_content.visible = true
        }
    }

    Connections {
        target: active_info_list
        onSig_return_customer: {
            active_info_list.visible = false
            rct_content.visible = true
        }
    }

    Connections {
        target: active_info_details
        onSig_show_active_suc: {
            active_info_details.visible = false
            active_info_suc.visible = true
        }
    }

    Connections {
        target: active_info_suc
        onSig_see_active_info: {
            active_info_suc.visible = false
            see_active_info.visible = true
        }
    }
}
