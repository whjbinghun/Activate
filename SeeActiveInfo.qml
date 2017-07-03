import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import "common_qml"

Rectangle {
    id: avtive_info_details
    anchors.fill: parent

    property int gn_single_height: parent.height/12

    Rectangle {
        id: rct_title
        width: parent.width
        height: gn_single_height

        gradient: Gradient {    //颜色渐变
            GradientStop {position: 0.0; color: "#0099FF" }
            GradientStop {position: 1.0; color: "#0099FF" }
        }

        Row {
            spacing: 10

            Button {
                //iconSource:
                height: gn_single_height
                opacity: 0

                onClicked: {
                    //emit: sig_return_customer()
                }
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("查看信息")
                color: "white"
            }
        }
    }

    Column {
        id: col_content
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
                    height: gn_single_height
                    verticalAlignment: Text.AlignVCenter
                    text: "软件名称："
                }
                Text {
                    id: lab_soft_name
                    height: gn_single_height
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
                    height: gn_single_height
                    text: "软件版本："
                    verticalAlignment: Text.AlignVCenter
                }
                Label {
                    id: lab_soft_version
                    height: gn_single_height
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
                    height: gn_single_height
                    text: "机器序列码："
                    verticalAlignment: Text.AlignVCenter
                }
                Label { //序列号
                    id: lab_serial_num
                    height: gn_single_height
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
                    height: gn_single_height
                    text: "公司单位名："
                    verticalAlignment: Text.AlignVCenter
                }
                Label {
                    id: lab_company_name
                    height: gn_single_height
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
                    height: gn_single_height
                    text: "用户名称："
                    verticalAlignment: Text.AlignVCenter
                }
                Label {
                    id: lab_user_name
                    height: gn_single_height
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
                    height: gn_single_height
                    text: "申请单位："
                    verticalAlignment: Text.AlignVCenter
                }
                Label { //申请单位
                    id: lab_apply_unit
                    height: gn_single_height
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
                    height: gn_single_height
                    verticalAlignment: Text.AlignVCenter
                    text: "申请人名称："
                }
                Label {
                    id: lab_applicant_name
                    height: gn_single_height
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
                    id: lab_remarks
                    height: gn_single_height
                    verticalAlignment: Text.AlignVCenter
                    text: "备注："
                }
                Label {
                    id: text_remarks
                    width: col_content.width - lab_remarks.width - 30
                    height: gn_single_height
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Line {
               width: avtive_info_details.width
            }
        }
    }
}
