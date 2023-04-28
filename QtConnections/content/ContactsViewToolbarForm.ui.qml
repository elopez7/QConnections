

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "ccontrols"

Item {
    width: 136
    height: 817
    property alias editContactButton: editContactButton
    property alias removeContactButton: removeContactButton
    property alias addContactButton: addContactButton

    ColumnLayout {
        anchors.fill: parent
        CIconButton {
            id: addContactButton
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        CIconButton {
            id: removeContactButton
            buttonTextIcon: "-"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        CIconButton {
            id: editContactButton
            buttonTextIcon: "|||"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Item {
            id: spacer
            Layout.topMargin: 390
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
