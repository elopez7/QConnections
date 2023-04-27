import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Studio.Effects 1.0

Item {
    id: root
    width: 156
    height: 137
    property alias profilePictureSource: profilePicture.source

    Rectangle {
        id: clipRect
        color: "#ffffff"
        radius: 45
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 0
        anchors.bottomMargin: 47
        anchors.rightMargin: 33
        anchors.leftMargin: 33

        layer.enabled: true
        layer.effect: OpacityMaskEffect{
            maskSource: Item{
                width: clipRect.width
                height: clipRect.height
                Rectangle{
                    anchors.centerIn: parent
                    width: clipRect.adapt ? clipRect.width : Math.min(clipRect.width, clipRect.height)
                    height: clipRect.adapt ? clipRect.height : width
                    radius: clipRect.radius
                }
            }
        }

        Image {
            id: profilePicture
            anchors.fill: parent
            source: "images/titleImage.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    Label {
        id: userNameLabel
        color: "#869aac"
        text: qsTr("Esteban Lopez")
        anchors.top: clipRect.bottom
        anchors.bottom: parent.bottom
        font.pixelSize: 17
        font.styleName: "Light"
        font.family: "Roboto"
        anchors.bottomMargin: 0
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
