import QtQuick 2.15

SignInForm {
    signal loadPage()
    signal pushPage(url pageUrl)

    signInButton.onClicked: {
        //Sign in functionality here
        //If sign in successful, then load the Dashboard
        //errorLabel.visible = !errorLabel.visible

        //Remember, this loadPage() already works

        loadPage()
    }

    signUpMouseArea.onClicked: pushPage("SignUp.qml")
    forgotPasswordMouseArea.onClicked: pushPage("ForgotPassword.qml")

}
