import QtConnections
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "ccontrols"

Item {
    id: topBar
    width: 1440
    height: 67

    Image {
        id: logoCaption
        anchors.left: parent.left
        anchors.right: searchBar.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "images/LogoCaption.png"
        anchors.rightMargin: 0
        fillMode: Image.PreserveAspectFit
    }

    SearchBar {
        id: searchBar
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 200
        anchors.rightMargin: 0
    }
}
