import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

/*
 * 激活信息列表
 */
Rectangle {
    id: active_info_list
    anchors.fill: parent

    property int gn_single_height: parent.height/12
    signal sig_return_customer()

//    Component.onCompleted: {

//    }

    /*
     * title
     */
    Rectangle {
        id: rct_title
        width: parent.width
        height: gn_single_height
        z: 5
        gradient: Gradient {    //颜色渐变
            GradientStop {position: 0.0; color: "#0099FF" }
            GradientStop {position: 1.0; color: "#0099FF" }
        }

        Row {
            anchors.fill: parent
            spacing: 10
            Button {
                width: gn_single_height
                height: gn_single_height
                opacity: 0.1
                //iconSource:
                onClicked: {
                    emit: sig_return_customer()
                }
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
                text: qsTr( "激活列表" )
            }
        }
    }

    //筛选
    Button {
        id: btn_screen
        anchors.top: rct_title.bottom
        anchors.left: parent.left
        anchors.leftMargin: 10
        height: gn_single_height
        z: 5
        style: ButtonStyle {
            background: Rectangle {
                opacity: 0
            }
        }

        text: qsTr( "筛选" )
        onClicked: {
            screen_info.visible = !screen_info.visible
        }
    }

    /*
     * 已激活信息
     */
    ActivedInfo {
        id: actived_info
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: gn_single_height*2
        z: 1
    }

    ScreenInfo {
        id: screen_info
        anchors.top: rct_title.bottom
        anchors.left: parent.left
        anchors.leftMargin: parent.width - parent.width*2/3
        width: parent.width*2/3
        height: parent.height - rct_title.height
        visible: false

        z: 3
    }
}
