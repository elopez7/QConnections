

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15

ListView {
    id: menuView
    width: 420
    height: 420
    interactive: false
    highlightResizeDuration: 0
    signal pushPage(url pageToPush)

    highlightMoveDuration: -1

    model: DashboardMenuListModel {}

    highlight: Rectangle {
        color: "#131A27"
        Rectangle {
            height: parent.height
            width: 8
            color: "#1F8EFA"
        }
    }

    delegate: DashboardMenuListDelegate {
        Connections {
            function onPushPage(pageUrl) {
                menuView.pushPage(pageUrl)
            }
        }
    }
}
