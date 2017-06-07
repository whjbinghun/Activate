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
        height: 40
        //color: Qt.blue//"#0099FFFF"
        border.width: 1
        z: 50
        gradient: Gradient {    //颜色渐变
            GradientStop {position: 0.0; color: "lightsteelblue" }
            GradientStop {position: 1.0; color: "blue" }
        }

        Row {
            anchors.fill: parent
            spacing: 10
            Button {
                width: 40
                height: 40

                //iconSource:
                style: ButtonStyle {
                    background: Rectangle {
                        border.width: 1
                        gradient: Gradient {
                            GradientStop {position: 0.0; color: "lightsteelblue" }
                            GradientStop {position: 1.0; color: "blue" }
                        }
                    }
                }
                onClicked: {
                    emit: sig_return_customer()
                }
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("审批信息")
            }
        }
    }

    /*
     * 按钮
     */
    Row {
        anchors.fill: parent
        anchors.topMargin: 40
        z: 50

        Button {
            width: parent.width/3
            height: 30
            text: qsTr( "待审核" )
            //iconSource:
            style: ButtonStyle {
                background: Rectangle {
                    border.width: 1
                    radius: 4
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
            height: 30
            text: qsTr( "已审核" )
            //iconSource:
            style: ButtonStyle {
                background: Rectangle {
                    border.width: 1
                    radius: 4
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
            height: 30
            text: qsTr( "拒绝" )
            //iconSource:
            style: ButtonStyle {
                background: Rectangle {
                    border.width: 1
                    radius: 4
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
        anchors.topMargin: 80
        z: 1
    }

    /*
     * 已审核
     */
    Audited {
        id: audited
        visible: false
        anchors.fill: parent
        anchors.topMargin: 80
        z: 1
    }

    /*
     * 拒绝
     */
    Refuse {
        id: refuse
        visible: false
        anchors.fill: parent
        anchors.topMargin: 80
        z: 1
    }


}
