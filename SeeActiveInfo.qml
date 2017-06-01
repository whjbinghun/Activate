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
            text: qsTr("查看信息")
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
                    text: qsTr("软件名称：")
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
                text: qsTr("软件版本：")
            }
            Label {
                id: lab_soft_version
                height: 30

            }
        }

        Row {
            Label {
                height: 30
                text: qsTr("机器序列码：")
            }
            Label { //序列号
                id: lab_serial_num
                height: 30

            }
        }

        Row {
            Label {
                height: 30
                text: qsTr("公司单位名：")
            }
            Label {
                id: lab_company_name
                height: 30

            }
        }

        Row {
            Label {
                height: 30
                text: qsTr("用户名称：")
            }
            Label {
                id: lab_user_name
                height: 30

            }
        }

        Row {
            Label {
                height: 30
                text: qsTr("申请单位：")
            }
            Label { //申请单位
                id: lab_apply_unit
                height: 30
            }
        }

        Row {
            Label {
                height: 30

                text: qsTr("申请人名称：")
            }
            Label {
                id: lab_applicant_name
                height: 30

            }
        }

        Row {
            Label {
                height: 30

                text: qsTr("备注：")
            }
            Label {
                id: lab_remarks
                height: 30

            }
        }
    }
}
