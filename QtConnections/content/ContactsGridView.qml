/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 2.15

GridView {
    width: 1250
    height: 833

    cellWidth: 276
    cellHeight: 359

    model: ContactsGridViewModel {
    }

    highlight: Rectangle {
        width: 120
        height: 120
        color: "transparent"
        radius: 4
        border.color: "#1F8EFA"
        border.width: 8
    }

    delegate: ContactsGridViewDelegate {
    }
}
