import QtQuick 2.15

SignInForm {
    signal loadPage(url pageUrl)
    signal pushPage(url pageUrl)

    signInButton.onClicked: loadPage("Dashboard.qml")
    signUpMouseArea.onClicked: pushPage("SignUp.qml")
    forgotPasswordMouseArea.onClicked: pushPage("ForgotPassword.qml")

}
