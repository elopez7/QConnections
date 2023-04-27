

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
    property alias signUpButton: signUpButton
    property alias loginMouseArea: loginMouseArea

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent

        Image {
            id: image
            width: 100
            height: 100
            source: "images/LogoNoCaption.png"
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
            text: "Sign Up"
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.styleName: "Light"
            font.family: "Roboto"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ColumnLayout {
            id: emailInputLayout
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
            id: passwordInputLayout
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

        ColumnLayout {
            id: confirmPasswordInputLayout
            width: 100
            height: 100
            Layout.fillHeight: true
            Layout.fillWidth: true

            Label {
                id: confirmPasswordLabel
                color: "#ffffff"
                text: qsTr("Confirm Password")
                font.pixelSize: 18
                Layout.maximumHeight: 20
                font.styleName: "Light"
                font.family: "Roboto"
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            CTextField {
                id: confirmPasswordInput
                placeholderText: "Confirm Password"
                echoMode: TextInput.Password
            }
        }

        ColumnLayout {
            id: fullNameLayout
            width: 100
            height: 100
            Layout.fillHeight: true
            Layout.fillWidth: true

            Label {
                id: fullNameLabel
                color: "#ffffff"
                text: qsTr("Full Name")
                font.pixelSize: 18
                Layout.maximumHeight: 20
                font.styleName: "Light"
                font.family: "Roboto"
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            CTextField {
                id: fullNameInput
                placeholderText: "Full Name"
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
            id: signUpButton
            text: "SIGN UP"
            Layout.minimumHeight: 33
            Layout.maximumHeight: 33
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Label {
            id: label3
            color: "#98a7b9"
            text: qsTr("By clicking Join Now, you accept the User Agreement and Privacy Policy")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.WordWrap
            font.styleName: "Regular"
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
                text: qsTr("Already have an account?")
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
                text: qsTr("Login")
                font.pixelSize: 12
                verticalAlignment: Text.AlignBottom
                Layout.maximumWidth: 122
                font.styleName: "Bold"
                font.family: "Roboto"
                Layout.fillHeight: true
                Layout.fillWidth: true

                MouseArea {
                    id: loginMouseArea
                    anchors.fill: parent
                    anchors.rightMargin: 64
                    anchors.topMargin: 32
                }
            }
        }
    }
}
