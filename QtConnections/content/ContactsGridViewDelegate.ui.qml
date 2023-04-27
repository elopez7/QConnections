import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Studio.Effects

Item {
    id: delegate
    width: 276
    height: 359

    Rectangle {
        id: rectangle
        color: "#2f3b52"
        anchors.fill: parent
        anchors.margins: 12
        visible: true
        radius: 4

        Rectangle {
            id: clipRect
            color: "#ffffff"
            radius: 93
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 0
            anchors.bottomMargin: 140
            anchors.rightMargin: 40
            anchors.leftMargin: 40

            layer.enabled: true
            layer.effect: OpacityMaskEffect {
                maskSource: Item {
                    width: clipRect.width
                    height: clipRect.height
                    Rectangle {
                        anchors.centerIn: parent
                        width: clipRect.adapt ? clipRect.width : Math.min(
                                                    clipRect.width,
                                                    clipRect.height)
                        height: clipRect.adapt ? clipRect.height : width
                        radius: clipRect.radius
                    }
                }
            }

            Image {
                id: profilePicture
                anchors.fill: parent
                source: ProfilePicture
                fillMode: Image.PreserveAspectFit
            }
        }

        Label {
            id: userNameLabel
            color: "#869aac"
            text: name
            anchors.top: clipRect.bottom
            font.pixelSize: 17
            font.styleName: "Light"
            font.family: "Roboto"
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            id: userAddress
            color: "#869aac"
            text: Address
            anchors.top: userNameLabel.bottom
            font.pixelSize: 17
            font.styleName: "Light"
            font.family: "Roboto"
            anchors.topMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            id: userEmail
            color: "#869aac"
            text: Email
            anchors.top: userAddress.bottom
            font.pixelSize: 17
            font.styleName: "Light"
            font.family: "Roboto"
            anchors.topMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            id: userPhone
            color: "#869aac"
            text: Phone
            anchors.top: userEmail.bottom
            font.pixelSize: 17
            font.styleName: "Light"
            font.family: "Roboto"
            anchors.topMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: delegate.GridView.view.currentIndex = index
    }
    states: [
        State {
            name: "Highlighted"

            when: delegate.GridView.isCurrentItem

            PropertyChanges {
                target: rectangle
                color: "#131A27"
            }
        }
    ]
}
