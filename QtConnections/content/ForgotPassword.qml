import QtQuick 2.15

ForgotPasswordForm {
    signal pushPage(url pageUrl)
    recoverPasswordButton.onClicked: pushPage("SignIn.qml")
}
