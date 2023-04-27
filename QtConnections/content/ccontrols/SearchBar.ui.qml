import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    width: 720
    height: 64

    CTextField {
        id: searchField
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: buttonIcon.bottom
        font.pixelSize: 32
        anchors.bottomMargin: 0
        placeholderText: "Search for contacts"
        anchors.leftMargin: 67
    }

    Image {
        id: buttonIcon
        anchors.left: parent.left
        anchors.right: searchField.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "../images/searchIcon.png"
        anchors.bottomMargin: 0
        anchors.rightMargin: 0

        MouseArea {
            id: mouseArea
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
        }
    }

}
