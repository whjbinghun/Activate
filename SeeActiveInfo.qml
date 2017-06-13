import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

Rectangle {
    id: avtive_info_details

    property int n_width: 320
    property int n_height: 580
    property int gn_lab_height: 40

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
                 text: qsTr("查看信息")
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

            Rectangle {
                width: avtive_info_details.width
                height: 1
                border.width: 1
                color: "blue"
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

            Rectangle {
                width: avtive_info_details.width
                height: 1
                border.width: 1
                color: "blue"
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
            Rectangle {
                width: avtive_info_details.width
                height: 1
                border.width: 1
                color: "blue"
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
            Rectangle {
                width: avtive_info_details.width
                height: 1
                border.width: 1
                color: "blue"
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
            Rectangle {
                width: avtive_info_details.width
                height: 1
                border.width: 1
                color: "blue"
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
            Rectangle {
                width: avtive_info_details.width
                height: 1
                border.width: 1
                color: "blue"
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
            Rectangle {
                width: avtive_info_details.width
                height: 1
                border.width: 1
                color: "blue"
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
            Rectangle {
                width: avtive_info_details.width
                height: 1
                border.width: 1
                color: "blue"
            }
        }
    }
}
