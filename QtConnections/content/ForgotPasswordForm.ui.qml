

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 6.3
import "ccontrols"

Item {
    id: root
    width: 327
    height: 728
    property alias recoverPasswordButton: recoverPasswordButton

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent

        Image {
            id: image
            width: 100
            height: 100
            source: "images/logoNoCaption.png"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.maximumHeight: 128
            Layout.maximumWidth: 128
            Layout.fillHeight: true
            Layout.fillWidth: true
            fillMode: Image.PreserveAspectFit
        }

        Label {
            id: label
            color: "#ffffff"
            text: qsTr("Forgot Password")
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.styleName: "Light"
            font.family: "Roboto"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Label {
            id: label3
            color: "#869aac"
            text: qsTr("Place your email in the field below.
We will send you a link with the
instructions to follow")
            font.pixelSize: 17
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.styleName: "Light"
            font.family: "Roboto"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ColumnLayout {
            id: emailLayout
            width: 100
            height: 100
            Layout.fillHeight: true
            Layout.fillWidth: true

            Label {
                id: emailLabel
                color: "#ffffff"
                text: qsTr("Email")
                font.pixelSize: 18
                Layout.maximumHeight: 20
                font.styleName: "Light"
                font.family: "Roboto"
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            CTextField {
                id: emailInput
                placeholderText: "Email"
            }
        }

        Item {
            id: item1
            width: 200
            height: 200
            Layout.maximumHeight: 16
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        CButton {
            id: recoverPasswordButton
            text: "RECOVER PASSWORD"
            Layout.minimumHeight: 33
            Layout.maximumHeight: 33
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Item {
            id: itemSpacer
            width: 100
            height: 100
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
