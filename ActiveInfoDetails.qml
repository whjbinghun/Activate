import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

Rectangle {
    id: avtive_info_details

    property int n_width: 320
    property int n_height: 580

    width: n_width
    height: n_height

    Rectangle {
        id: rct_title
        width: n_width
        height: 40

        border.width: 1
        gradient: Gradient {    //颜色渐变
            GradientStop {position: 0.0; color: "lightsteelblue" }
            GradientStop {position: 1.0; color: "blue" }
        }

        Text {
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            text: "激活信息"
        }
    }



    Column {
        anchors.top: rct_title.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        Rectangle {
            border.width: 1
            width: parent.width
            height: 50
            Row {
                anchors.verticalCenter: parent.verticalCenter
                Label {
                    height: 30
                    text: "软件名称："
                }
                Label {
                    height: 30
                    id: lab_soft_name
                }
            }
        }
        Row {
            Label {
                height: 30
                text: "软件版本："
            }
            Label {
                id: lab_soft_version
                height: 30

            }
        }

        Row {
            Label {
                height: 30
                text: "机器序列码："
            }
            Label { //序列号
                id: lab_serial_num
                height: 30

            }
        }

        Row {
            Label {
                height: 30
                text: "公司单位名："
            }
            Label {
                id: lab_company_name
                height: 30

            }
        }

        Row {
            Label {
                height: 30
                text: "用户名称："
            }
            Label {
                id: lab_user_name
                height: 30

            }
        }

        Row {
            Label {
                height: 30
                text: "申请单位："
            }
            Label { //申请单位
                id: lab_apply_unit
                height: 30
            }
        }

        Row {
            Label {
                height: 30

                text: "申请人名称："
            }
            Label {
                id: lab_applicant_name
                height: 30

            }
        }

        Row {
            Label {
                height: 30

                text: "备注："
            }
            Label {
                id: lab_remarks
                height: 30

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
            text: "发送"
            style: ButtonStyle {
                background: Rectangle {
                    gradient: Gradient {    //颜色渐变
                        GradientStop {position: 0.0; color: control.pressed?"#ccc":"lightsteelblue" }
                        GradientStop {position: 1.0; color: control.pressed?"#aaa":"blue" }
                    }
                }
            }
        }
    }
}
