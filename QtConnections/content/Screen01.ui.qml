

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtConnections
import QtQuick.Layouts

Loader {
    id: screenLoader
    width: Constants.width
    height: Constants.height

    source: "WelcomeScreen.ui.qml"

    Connections {
        target: screenLoader.item
        ignoreUnknownSignals: true
        function onLoadPage(pageUrl) {
            screenLoader.source = "Dashboard.qml"
        }
    }
}
