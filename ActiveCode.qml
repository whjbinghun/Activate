import QtQuick.Window 2.0
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import "common_qml"

/*
 * 激活码
 */

Window {
    id: wnd_active_code
    title: qsTr( "激活码" )
    visible: false
    modality: Qt.WindowModal

    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight

    property int gn_single_height: parent.height/12
    signal sig_show_wait_active_wnd()

    Rectangle {
        id: rct_title

        width: parent.width
        height: gn_single_height
        border.width: 1
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
                    emit: sig_return_customer()
                }
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("激活码")
            }
        }
    }

    Rectangle {
        id: rct_active_suc
        anchors.top: rct_title.bottom
        height: gn_single_height
        Row {
            Image {

            }
            Text {
                text: qsTr( "生成激活码成功!" )
                font.pointSize: 20
            }
        }
    }

    Column {
        id: col_approver_info
        anchors.top: rct_active_suc.bottom
        height: gn_single_height*2
        spacing: 10
        Row {
            Text {
                width: wnd_active_code.width/2
                color: "blue"
                text: "审批人:" + "王五（销售部）"
            }
            Text {
                width: wnd_active_code.width - wnd_active_code.width/2
                color: "blue"
                text: "审批时间:" + "2017-3-17"
            }
        }
        Text {
            color: "blue"
            text: "剩余有效期:" + "364" + "天"
        }
    }

    Column {
        id: col_active_info
        anchors.top: col_approver_info.bottom
        Component {
            id: contactDelegate
            Item {
                width: wnd_wait_active_info.width
                height: column_active.height
                Column {
                    id: column_active
                    spacing: 5


                    Text {
                        text: "软件名称:" + soft_name
                        wrapMode: Text.Wrap    //文本换行
                    }

                    Line {
                       width: parent.width
                    }

                    Text {
                        text: "软件版本:" + version
                    }

                    Line {
                       width: parent.width
                    }

                    Text {
                        text: "机器序列码:" + serial_no
                    }

                    Line {
                       width: parent.width
                    }

                    Text {
                        text: "公司单位名:" + unit_name
                    }

                    Line {
                       width: parent.width
                    }

                    Text {
                        text: "用户名称:" + username
                    }

                    Line {
                       width: parent.width
                    }

                    Text {
                        text: "申请单位:" + apply_company_name
                    }

                    Line {
                       width: parent.width
                    }

                    Text {
                        text: "申请人名称:" + apply_username
                    }

                    Line {
                       width: parent.width
                    }

                    Text {
                        text: "激活码:" + active_code
                    }
                }
            }
        }

        ListModel {
            id: list_wait_active_info
        }

        ListView {
            anchors.fill: parent
            anchors.topMargin: gn_single_height
            model: list_wait_active_info
            delegate: contactDelegate
            highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
            focus: true
        }
    }
}
