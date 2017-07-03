import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

Rectangle {
    id: rect_passwd_modify
    anchors.fill: parent

    property int gn_single_height: parent.height/12
    signal sig_return_user_details();

    Rectangle {
        id: rect_title
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
                    emit: sig_return_user_details()
                }
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("修改密码")
                color: "white"
            }
        }
    }

    Column {
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.top: rect_title.bottom
        anchors.topMargin: 20

        spacing: gn_single_height/2

        Grid {
            width: parent.width
            rows: 3
            columns: 2
            spacing: 20

            Label {
                height: gn_single_height
                text: qsTr("当前密码：")
                verticalAlignment: Text.AlignVCenter
            }
            TextField {
                id: text_cur_passwd
                width: parent.width - 20 - lab_new_passwd.width
                height: gn_single_height
                style: TextFieldStyle {
                    background: Rectangle {
                        border.width: 1
                    }
                }

                onTextChanged: {
                    btn_sure.enabled = btn_enabled()
                }
            }

            Label {
                height: gn_single_height
                text: qsTr("新密码：")
                verticalAlignment: Text.AlignVCenter
            }
            TextField {
                id: text_new_passwd
                width: text_cur_passwd.width
                height: gn_single_height

                style: TextFieldStyle {
                    background: Rectangle {
                        border.width: 1
                    }
                }

                onTextChanged: {
                    btn_sure.enabled = btn_enabled()
                }
            }

            Label {
                id: lab_new_passwd
                height: gn_single_height
                text: qsTr("确认新密码：")
                verticalAlignment: Text.AlignVCenter
            }
            TextField {
                id: text_sure_new_passwd
                width: text_cur_passwd.width
                height: gn_single_height

                style: TextFieldStyle {
                    background: Rectangle {
                        border.width: 1
                    }
                }

                onTextChanged: {
                    btn_sure.enabled = btn_enabled()
                }
            }
        }

        Label {
            text: qsTr("密码长度至少6个字符，最多32个字符")
            color: "#828282"
        }

        Button {
            id: btn_sure
            width: parent.width
            height: gn_single_height
            enabled: false
            style: ButtonStyle {
                label: Text {   //定制按钮的文本
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr("确认")
                    color: "white"
                }
                background: Rectangle {
                    radius: gn_single_height/5
                    gradient: Gradient {    //颜色渐变
                        GradientStop {position: 0.0; color: control.pressed?"#ccc":"#0099FF" }
                        GradientStop {position: 1.0; color: control.pressed?"#aaa":"#0099FF" }
                    }
                }
            }

            onClicked: {
                if( text_new_passwd.text !== text_sure_new_passwd.text ) {
                    dlg_passwd.visible = true
                    dlg_passwd.text = "新密码与确认密码不同，请重新输入"
                    btn_sure.enabled = false
                    time_close_dlg.start()
                    return
                }

                login.send_passwd_modify( text_cur_passwd.text, text_new_passwd.text );
                btn_sure.enabled = false
                time_close_dlg.start()
            }
        }
    }

    function init_info() {
        text_cur_passwd.text = ""
        text_new_passwd.text = ""
        text_sure_new_passwd.text = ""
        text_cur_passwd.focus = true
    }

    function btn_enabled() {
        if( text_cur_passwd.text.length == 0 ) return false
        if( text_new_passwd.text.length == 0 ) return false
        if( text_sure_new_passwd.text.length == 0 ) return false

        return true
    }

    Timer {
        id: time_close_dlg

        interval: 1000*5
        //running: true
        //repeat: true
        onTriggered: {
            time_close_dlg.stop()
            dlg_passwd.visible = false
            init_info()
        }
    }

    Dialog {
        id: dlg_passwd

        title: "提示"
        visible: false
        property string text: ""
        contentItem: Rectangle {
            implicitWidth: 400
            implicitHeight: 100
            Text {
                anchors.centerIn: parent
                text: dlg_passwd.text
            }
        }
    }
}
