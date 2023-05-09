

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
    width: 327
    height: 728
    property alias errorLabel: errorLabel
    property alias emailInput: emailInput
    property alias passwordInput: passwordInput
    property alias signUpMouseArea: signUpMouseArea
    property alias forgotPasswordMouseArea: forgotPasswordMouseArea
    property alias signInButton: signInButton

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
            text: qsTr("Sign In")
            font.pixelSize: 30
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

        ColumnLayout {
            id: passwordLayout
            width: 100
            height: 100
            Layout.fillHeight: true
            Layout.fillWidth: true

            Label {
                id: passwordLabel
                color: "#ffffff"
                text: qsTr("Password")
                font.pixelSize: 18
                Layout.maximumHeight: 20
                font.styleName: "Light"
                font.family: "Roboto"
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            CTextField {
                id: passwordInput
                echoMode: TextInput.Password
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
            id: signInButton
            text: "SIGN IN"
            Layout.minimumHeight: 33
            Layout.maximumHeight: 33
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Label {
            id: label3
            color: "#98a7b9"
            text: qsTr("Forgot your password?")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.styleName: "Regular"
            font.family: "Roboto"
            Layout.fillHeight: true
            Layout.fillWidth: true

            MouseArea {
                id: forgotPasswordMouseArea
                anchors.fill: parent
                anchors.rightMargin: 96
                anchors.leftMargin: 96
                anchors.bottomMargin: 32
                anchors.topMargin: 32
            }
        }

        Label {
            id: errorLabel
            visible: false
            color: "#EE423D"
            text: qsTr("ERROR MESSAGE")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.styleName: "Bold"
            font.family: "Roboto"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        RowLayout {
            id: rowLayout
            width: 100
            height: 100
            Layout.fillHeight: true
            Layout.fillWidth: true

            Label {
                id: label4
                color: "#70889e"
                text: qsTr("Don't have an account?")
                font.pixelSize: 12
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignBottom
                Layout.maximumWidth: 200
                font.styleName: "Regular"
                font.family: "Roboto"
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            Label {
                id: label5
                color: "#1f8efa"
                text: qsTr("Sign Up")
                font.pixelSize: 12
                verticalAlignment: Text.AlignBottom
                Layout.maximumWidth: 122
                font.styleName: "Bold"
                font.family: "Roboto"
                Layout.fillHeight: true
                Layout.fillWidth: true

                MouseArea {
                    id: signUpMouseArea
                    anchors.fill: parent
                    anchors.rightMargin: 32
                    anchors.topMargin: 80
                }
            }
        }
    }
}
