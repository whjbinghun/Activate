import QtQuick.Window 2.0
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

/*
 * 激活码
 */

Window {
    id: wnd_active_code
    title: qsTr( "激活码" )
    visible: false
    modality: Qt.WindowModal
    property int n_width: 320
    property int n_height: 580

    width: n_width
    height: n_height

    signal sig_show_wait_active_wnd()

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
        height: 40
        Row {
            Image {

            }
            Text {
                text: qsTr( "生成激活码成功!" )
                font.pixelSize: 20
            }
        }
    }

    Column {
        id: col_approver_info
        anchors.top: rct_active_suc.bottom
        height: 60
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

                    Rectangle {//line
                        width: parent.width
                        height: 1
                        border.color: "blue"
                    }

                    Text {
                        text: "软件版本:" + version
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        border.color: "blue"
                    }

                    Text {
                        text: "机器序列码:" + serial_no
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        border.color: "blue"
                    }

                    Text {
                        text: "公司单位名:" + unit_name
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        border.color: "blue"
                    }

                    Text {
                        text: "用户名称:" + username
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        border.color: "blue"
                    }

                    Text {
                        text: "申请单位:" + apply_company_name
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        border.color: "blue"
                    }

                    Text {
                        text: "申请人名称:" + apply_username
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        border.color: "blue"
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
            anchors.topMargin: 40
            model: list_wait_active_info
            delegate: contactDelegate
            highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
            focus: true
        }
    }
}
