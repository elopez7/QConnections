import QtQuick 2.15

SignUpForm {
    signal pushPage(url pageUrl)

    loginMouseArea.onClicked: pushPage("SignIn.qml")
    signUpButton.onClicked: pushPage("SignIn.qml")
}
