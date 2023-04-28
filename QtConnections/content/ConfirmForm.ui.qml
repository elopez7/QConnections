

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "ccontrols"

Rectangle {
    id: root
    width: 376
    height: 504
    color: "#2f3b52"
    property alias yesButton: yesButton
    property alias noButton: noButton
    clip: true

    ColumnLayout {
        id: contentLayout
        anchors.fill: parent
        Rectangle {
            id: warningImageBackground
            color: "#1f8efa"
            Layout.bottomMargin: 53
            Layout.fillHeight: true
            Layout.maximumHeight: 256
            Layout.minimumHeight: 256

            Layout.fillWidth: true
            Image {
                id: warningImage
                anchors.fill: parent
                source: "images/warningIcon.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Label {
            id: confirmationTitle
            color: "#ffffff"
            text: "Remove Contact"
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.bottomMargin: 16
            font.family: "Roboto"
            Layout.fillHeight: false
            Layout.fillWidth: true
        }
        Label {
            id: confirmationMessage
            text: "Are you sure you want to remove this contact?"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            Layout.bottomMargin: 16
            font.family: "Roboto"
            Layout.fillHeight: false
            Layout.fillWidth: true
        }
        RowLayout {
            id: confirmationButtons
            Layout.bottomMargin: 32
            Layout.rightMargin: 16
            Layout.leftMargin: 16
            spacing: 32
            Layout.fillHeight: true
            Layout.fillWidth: true
            CButton {
                id: yesButton
                text: "OK"
                Layout.fillHeight: false
                Layout.fillWidth: true
            }
            CButton {
                id: noButton
                text: "Cancel"
                Layout.fillHeight: false
                Layout.fillWidth: true
            }
        }
    }
}
