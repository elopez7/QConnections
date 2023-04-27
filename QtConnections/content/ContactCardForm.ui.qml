

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

Rectangle {
    id: root
    width: 977
    height: 495
    color: "#2f3b52"
    property alias cardText: addContactLabel.text

    RowLayout {
        id: layoutContainer
        anchors.fill: parent
        ColumnLayout {
            id: pictureLayout
            Layout.leftMargin: 32
            Layout.bottomMargin: 32
            Layout.topMargin: 32
            Layout.minimumWidth: 488
            Layout.maximumWidth: 488
            Layout.fillHeight: true
            Layout.fillWidth: true
            Label {
                id: addContactLabel
                color: "#ffffff"
                text: qsTr("Add Contact")
                font.pixelSize: 17
                Layout.bottomMargin: 16
                font.styleName: "Light"
                font.family: "Roboto"
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
            Image {
                id: contactPicture
                source: "images/profilePic.png"

                Layout.fillHeight: true
                Layout.fillWidth: true
                fillMode: Image.PreserveAspectFit
            }

            CButton {
                id: selectPictureButton
                text: "Select Picture"
                Layout.topMargin: 12
                Layout.rightMargin: 118
                Layout.leftMargin: 118
                Layout.fillWidth: true
            }
            Item {
                id: spacerItem
                Layout.topMargin: 76
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }

        ColumnLayout {
            id: fieldsLayout
            Layout.bottomMargin: 16
            Layout.topMargin: 66
            Layout.minimumWidth: 327
            Layout.maximumWidth: 327
            Layout.fillHeight: true
            Layout.fillWidth: true

            ColumnLayout {
                id: firstNameLayout
                Layout.fillHeight: true
                Layout.fillWidth: true

                Label {
                    id: firstNameLabel
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
                    id: firstNameInput
                    placeholderText: "Firstname"
                }
            }

            ColumnLayout {
                id: lastNameLayout
                Layout.fillHeight: true
                Layout.fillWidth: true

                Label {
                    id: lastNameLabel
                    color: "#ffffff"
                    text: qsTr("Lastname")
                    font.pixelSize: 18
                    Layout.maximumHeight: 20
                    font.styleName: "Light"
                    font.family: "Roboto"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

                CTextField {
                    id: lastnameInput
                    placeholderText: "Lastname"
                }
            }

            ColumnLayout {
                id: emailInputLayout
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
                id: addressLayout
                Layout.fillHeight: true
                Layout.fillWidth: true

                Label {
                    id: addressLabel
                    color: "#ffffff"
                    text: qsTr("Address")
                    font.pixelSize: 18
                    Layout.maximumHeight: 20
                    font.styleName: "Light"
                    font.family: "Roboto"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

                CTextField {
                    id: addressInput
                    placeholderText: "Address"
                }
            }

            Item {
                id: itemSpacer
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            RowLayout {
                id: buttonsLayout
                spacing: 32
                Layout.fillHeight: true
                Layout.fillWidth: true
                CButton {
                    id: cancelButton
                    text: "Cancel"
                    Layout.fillWidth: true
                }
                CButton {
                    id: addContactButton
                    text: "Add Contact"
                    Layout.fillWidth: true
                }
            }
        }
    }
}
