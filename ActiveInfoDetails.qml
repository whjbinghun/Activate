import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import "common_qml"

/*
 * 单个激活信息
 */

Rectangle {
    id: avtive_info_details

    width: n_width
    height: n_height

    property int n_width: 320
    property int n_height: 580

    property int gn_lab_height: 40

    signal  sig_show_active_suc()

    Rectangle {
        id: rct_title
        width: n_width
        height: 40

        gradient: Gradient {    //颜色渐变
            GradientStop {position: 0.0; color: "#0099FF" }
            GradientStop {position: 1.0; color: "#0099FF" }
        }

        Row {
            spacing: 10

            Button {
                //iconSource:
                height: 40
                opacity: 0

                onClicked: {
                    //emit: sig_return_customer()
                }
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
                text: qsTr("激活信息")
            }
        }
    }



    Column {
        anchors.top: rct_title.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        spacing: 10

        Column {
            Row {
                anchors.left: parent.left
                anchors.leftMargin: 10
                Label {
                    height: gn_lab_height
                    verticalAlignment: Text.AlignVCenter
                    text: "软件名称："
                }
                Text {
                    id: lab_soft_name
                    height: gn_lab_height
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                }
            }

            Line {
                width: avtive_info_details.width
            }
        }

        Column {
            Row {
                anchors.left: parent.left
                anchors.leftMargin: 10
                Label {
                    height: gn_lab_height
                    text: "软件版本："
                    verticalAlignment: Text.AlignVCenter
                }
                Label {
                    id: lab_soft_version
                    height: gn_lab_height
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Line {
                width: avtive_info_details.width
            }
        }

        Column {
            Row {
                anchors.left: parent.left
                anchors.leftMargin: 10
                Label {
                    height: gn_lab_height
                    text: "机器序列码："
                    verticalAlignment: Text.AlignVCenter
                }
                Label { //序列号
                    id: lab_serial_num
                    height: gn_lab_height
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Line {
                width: avtive_info_details.width
            }
        }

        Column {
            Row {
                anchors.left: parent.left
                anchors.leftMargin: 10
                Label {
                    height: gn_lab_height
                    text: "公司单位名："
                    verticalAlignment: Text.AlignVCenter
                }
                Label {
                    id: lab_company_name
                    height: gn_lab_height
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Line {
                width: avtive_info_details.width
            }
        }

        Column {
            Row {
                anchors.left: parent.left
                anchors.leftMargin: 10
                Label {
                    height: gn_lab_height
                    text: "用户名称："
                    verticalAlignment: Text.AlignVCenter
                }
                Label {
                    id: lab_user_name
                    height: gn_lab_height
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Line {
                width: avtive_info_details.width
            }
        }

        Column {
            Row {
                anchors.left: parent.left
                anchors.leftMargin: 10
                Label {
                    height: gn_lab_height
                    text: "申请单位："
                    verticalAlignment: Text.AlignVCenter
                }
                Label { //申请单位
                    id: lab_apply_unit
                    height: gn_lab_height
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Line {
                width: avtive_info_details.width
            }
        }

        Column {
            Row {
                anchors.left: parent.left
                anchors.leftMargin: 10
                Label {
                    height: gn_lab_height
                    verticalAlignment: Text.AlignVCenter
                    text: "申请人名称："
                }
                Label {
                    id: lab_applicant_name
                    height: gn_lab_height
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Line {
                width: avtive_info_details.width
            }
        }

        Column {
            spacing: 10
            Row {
                anchors.left: parent.left
                anchors.leftMargin: 10
                Label {
                    height: gn_lab_height
                    verticalAlignment: Text.AlignVCenter
                    text: "备注："
                }
                TextField {
                    id: text_remarks
                    width: 200
                    height: gn_lab_height
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Line {
                width: avtive_info_details.width
            }
        }

        Button {
            id: btn_send
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            width: parent.width - 20
            height: 30
            style: ButtonStyle {
                label: Text {
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "发送"
                    color: "white"
                }

                background: Rectangle {
                    radius: 4
                    gradient: Gradient {    //颜色渐变
                        GradientStop {position: 0.0; color: control.pressed?"#ccc":"#0099FF" }
                        GradientStop {position: 1.0; color: control.pressed?"#aaa":"#0099FF" }
                    }
                }
            }

            onClicked: {
                var str_all_active_info = get_active_info()
                login.send_active_info( str_all_active_info )
                emit: sig_show_active_suc()
            }
        }
    }

    function set_active_info( str_qr_code )
    {
        var strList_qr_code = str_qr_code.split( ":" )
        var n_len = strList_qr_code.length
        if( n_len === 7 ) {
            lab_soft_name.text = strList_qr_code[0]
            lab_soft_version.text = strList_qr_code[1]
            lab_serial_num.text = strList_qr_code[2]
            lab_company_name.text = strList_qr_code[3]
            lab_user_name.text = strList_qr_code[4]
            lab_apply_unit.text = strList_qr_code[5]
            lab_applicant_name.text = strList_qr_code[6]
        }
    }

    function get_active_info()
    {
        var str_all_active_info = lab_soft_name.text + ":" + lab_soft_version.text + ":"
            + lab_serial_num.text + ":" + lab_company_name.text + ":" + lab_user_name.text + ":"
            + lab_apply_unit.text + ":" + lab_applicant_name.text + ":" + text_remarks.text;

        return str_all_active_info
    }
}
