import QtQuick 2.4

Rectangle {
    id: rct_content
    anchors.fill: parent

    property string text: ""
    property bool btnVisible: false
    property string imageSource: ""

    signal sig_return()

    gradient: Gradient {    //颜色渐变
        GradientStop {position: 0.0; color: "#0099FF" }
        GradientStop {position: 1.0; color: "#0099FF" }
    }

    Row {
        anchors.fill: parent
        spacing: 10

        Image {
            width: parent.height
            height: parent.height
            visible: btnVisible
            source: imageSource
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    emit: sig_return()
                }
            }
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter
            height: 40
            color: "white"
            text: qsTr( rct_content.text )
        }
    }
}
