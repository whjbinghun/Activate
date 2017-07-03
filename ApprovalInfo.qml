import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

/**
  * 审批信息界面
  */
Rectangle {
    anchors.fill: parent


    signal sig_return_customer()


    property int n_status: 1
    property int gn_single_height: parent.height/12

    Component.onCompleted: {
        n_status = 1
        //待审核按钮处于按下状态,并显示为待审核界面
        if( !pending_audit.visible ) {
            pending_audit.visible = true
            audited.visible =false
            refuse.visible = false
        }
    }

    /*
     * title
     */
    Rectangle {
        width: parent.width
        height: gn_single_height
        //color: Qt.blue//"#0099FFFF"
        z: 50
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

                //iconSource:
                onClicked: {
                    emit: sig_return_customer()
                }
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
                text: qsTr("审批信息")
            }
        }
    }

    /*
     * 按钮
     */
    Row {
        anchors.fill: parent
        anchors.topMargin: gn_single_height
        z: 50

        Button {
            width: parent.width/3
            height: gn_single_height
            //iconSource:
            style: ButtonStyle {
                label: Text {
                    color: "blue"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr( "待审核" )
                }

                background: Rectangle {
                    border.width: 1
                    radius: gn_single_height/5
                }
            }

            onClicked: {
                if( !pending_audit.visible ) {
                    pending_audit.visible = true
                    audited.visible =false
                    refuse.visible = false
                }
            }
        }

        Button {
            width: parent.width/3
            height: gn_single_height
            //iconSource:
            style: ButtonStyle {
                label: Text {
                    color: "blue"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr( "已审核" )
                }

                background: Rectangle {
                    border.width: 1
                    radius: gn_single_height/5
                }
            }

            onClicked: {
                if( !audited.visible ) {
                    pending_audit.visible = false
                    audited.visible =true
                    refuse.visible = false
                }
            }

        }

        Button {
            width: parent.width - parent.width*2/3
            height: gn_single_height
            //iconSource:
            style: ButtonStyle {
                label: Text {
                    color: "blue"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr( "拒绝" )
                }

                background: Rectangle {
                    border.width: 1
                    radius: gn_single_height/5
                }
            }
            onClicked: {
                if( !refuse.visible ) {
                    pending_audit.visible = false
                    audited.visible =false
                    refuse.visible = true
                }
            }
        }
    }

    /*
     * 待审核
     */
    PendingAudit {
        id: pending_audit
        visible: true
        anchors.fill: parent
        anchors.topMargin: gn_single_height*2
        z: 1
    }

    /*
     * 已审核
     */
    Audited {
        id: audited
        visible: false
        anchors.fill: parent
        anchors.topMargin: gn_single_height*2
        z: 1
    }

    /*
     * 拒绝
     */
    Refuse {
        id: refuse
        visible: false
        anchors.fill: parent
        anchors.topMargin: gn_single_height*2
        z: 1
    }


}
