import QtQuick 2.15
import authModule

SignInForm {
    signal loadPage(int authMethod)
    signal pushPage(url pageUrl)

    signInButton.onClicked: {
        if(!emailInput.text || !passwordInput.text){
            emailInput.text = ""
            passwordInput.text = ""
            errorLabel.text = "Email or password can't be empty"
            errorLabel.visible = true
            return
        }

        signInButton.enabled = false
        AuthComponent.emailPasswordSignIn(emailInput.text, passwordInput.text)
    }

    signUpMouseArea.onClicked: pushPage("SignUp.qml")
    forgotPasswordMouseArea.onClicked: pushPage("ForgotPassword.qml")

    Connections{
        target: AuthComponent

        function onEmailPasswordLogInSuccess(){
            loadPage(AuthComponent.authMethod)
        }

        function onEmailPasswordLogInFailure(){
            errorLabel.text = "An error has ocurred"
            errorLabel.visible = true;
        }
    }
}
