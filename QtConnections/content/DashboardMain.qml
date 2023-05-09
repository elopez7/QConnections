import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import dashboardModule
import "ccontrols"

Item {
    id: root
    width: 1250
    height: 833

    property int authMethod

    property int anonymous : 0
    property int emailAndPassword : 1

    DashboardComponent{
        id: dashboardMain
    }

    Component.onCompleted: {
        dashboardMain.getRandomUserFromWeb()
    }

    Connections{
        target: dashboardMain
        function onRandomUserReadSuccess(){
            firstNameField.text = dashboardMain.firstName
            lastNameField.text = dashboardMain.lastName
            emailField.text = dashboardMain.email
            profilePicture.source = dashboardMain.profilePicture
        }
    }

    RowLayout{
        id: informationLayout
        anchors.fill: parent

        ColumnLayout{
            id: profilePictureLayout
            Layout.maximumWidth: 625
            Layout.fillHeight: true
            Layout.fillWidth: true
            Image{
                id: profilePicture
                source: "images/profilePic.png"
                Layout.topMargin: 24
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.maximumHeight: 420
                Layout.minimumHeight: 420
                Layout.minimumWidth: 420
                Layout.maximumWidth: 420
                fillMode: Image.PreserveAspectFit
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
            CButton{
                id: changePictureButton
                text: "Change Picture"
                Layout.leftMargin: 100
                Layout.maximumWidth: 128
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
            Item{
                id:spacerItemBottomImage
                Layout.minimumHeight: 350
                Layout.maximumHeight: 350
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
        ColumnLayout{
            id: inputFields

            Layout.maximumWidth: 625
            Layout.fillHeight: true
            Layout.fillWidth: true



            Label{
                id: accountInfoTitle
                color: "#ffffff"
                text: qsTr("Account Information")
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
                font.styleName: "Light"
                font.family: "Roboto"
                Layout.maximumWidth: 625
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            RowLayout{
                id: nameLayout
                Layout.fillHeight: true
                Layout.fillWidth: true
                Label{
                    id: nameLabel
                    color: "#ffffff"
                    text: qsTr("First Name")
                    font.pixelSize: 17
                    verticalAlignment: Text.AlignVCenter
                    Layout.minimumWidth: 325
                    Layout.maximumWidth: 325
                    font.styleName: "Light"
                    font.family: "Roboto"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
                CTextField{
                    id: firstNameField
                    Layout.minimumWidth: 256
                    placeholderText: "First Name"
                    Layout.maximumWidth: 256
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
            RowLayout{
                id: lastNameLayout
                Layout.fillHeight: true
                Layout.fillWidth: true
                Label{
                    id: lastNameLabel
                    color: "#ffffff"
                    text: qsTr("Last Name")
                    font.pixelSize: 17
                    verticalAlignment: Text.AlignVCenter
                    Layout.minimumWidth: 325
                    Layout.maximumWidth: 325
                    font.styleName: "Light"
                    font.family: "Roboto"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
                CTextField{
                    id: lastNameField
                    Layout.minimumWidth: 256
                    placeholderText: "Last Name"
                    Layout.maximumWidth: 256
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
            RowLayout{
                id: emailLayout
                Layout.fillHeight: true
                Layout.fillWidth: true
                Label{
                    id: emailLabel
                    color: "#ffffff"
                    text: qsTr("Email")
                    font.pixelSize: 17
                    verticalAlignment: Text.AlignVCenter
                    Layout.minimumWidth: 325
                    Layout.maximumWidth: 325
                    font.styleName: "Light"
                    font.family: "Roboto"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
                CTextField{
                    id: emailField
                    Layout.minimumWidth: 256
                    placeholderText: "Email"
                    Layout.maximumWidth: 256
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
            Label{
                id: passwordTitle
                color: "#ffffff"
                text: qsTr("Change Password")
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
                font.styleName: "Light"
                font.family: "Roboto"
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            RowLayout{
                id: currentPasswordLayout
                Layout.fillHeight: true
                Layout.fillWidth: true
                Label{
                    id: currentPasswordLabel
                    color: "#ffffff"
                    text: qsTr("Current Password")
                    font.pixelSize: 17
                    verticalAlignment: Text.AlignVCenter
                    Layout.minimumWidth: 325
                    Layout.maximumWidth: 325
                    font.styleName: "Light"
                    font.family: "Roboto"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
                CTextField{
                    id: currentPasswordField
                    Layout.minimumWidth: 256
                    placeholderText: "Current Password"
                    echoMode: TextInput.Password
                    Layout.maximumWidth: 256
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
            RowLayout{
                id: newPasswordLayout
                Layout.fillHeight: true
                Layout.fillWidth: true
                Label{
                    id: newPasswordLabel
                    color: "#ffffff"
                    text: qsTr("New Password")
                    font.pixelSize: 17
                    verticalAlignment: Text.AlignVCenter
                    Layout.maximumWidth: 325
                    font.styleName: "Light"
                    font.family: "Roboto"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
                CTextField{
                    id: newPasswordField
                    Layout.minimumWidth: 256
                    placeholderText: "New Password"
                    echoMode: TextInput.Password
                    Layout.maximumWidth: 256
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
            RowLayout{
                id: confirmPasswordLayout
                Layout.fillHeight: true
                Layout.fillWidth: true
                Label{
                    id: confirmPasswordLabel
                    color: "#ffffff"
                    text: qsTr("Confirm Password")
                    font.pixelSize: 17
                    verticalAlignment: Text.AlignVCenter
                    Layout.minimumWidth: 325
                    Layout.maximumWidth: 325
                    font.styleName: "Light"
                    font.family: "Roboto"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
                CTextField{
                    id: confirmPasswordField
                    Layout.minimumWidth: 256
                    placeholderText: "Confirm New Password"
                    echoMode: TextInput.Password
                    Layout.maximumWidth: 256
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
            CButton{
                id: saveChangesButton
                text: "Save Changes"
                Layout.rightMargin: 42
                Layout.leftMargin: 450
                Layout.fillHeight: false
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

            }

            Item{
                id:spacerItemBottom
                Layout.minimumHeight: 300
                Layout.maximumHeight: 300

                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
    }
}
