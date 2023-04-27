

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtConnections
import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    width: Constants.width
    height: Constants.height
    color: "#242e42"

    TopBar {
        id: topBar
        height: 64
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.leftMargin: 0
        anchors.rightMargin: 0
    }

    DashboardMenu {
        id: dashboardMenu
        width: 190
        anchors.left: parent.left
        anchors.top: topBar.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: 0

        Connections {
            function onPushPage(pageUrl) {
                dashboardStackView.replace(pageUrl)
            }
        }
    }

    DashboardStackView {
        id: dashboardStackView
        initialItem: "DashboardMain.qml"
        anchors.left: dashboardMenu.right
        anchors.right: parent.right
        anchors.top: topBar.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: 0
        anchors.leftMargin: 0
    }
}
