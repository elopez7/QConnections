import QtQuick 2.15
import authModule

SignUpForm {
    signal pushPage(url pageUrl)

    loginMouseArea.onClicked: pushPage("SignIn.qml")

    signUpButton.onClicked: {
        if(!passwordInput.text || !confirmPasswordInput.text){
            clearInputFields()
            passwordInput.placeholderText = "This field can't be empty"
            confirmPasswordInput.placeholderText = "This field can't be empty"
            return
        }

        if(passwordInput.text === confirmPasswordInput.text){
            signUpButton.enabled = false
            AuthComponent.emailPasswordSignUp(emailInput.text, passwordInput.text)
            return
        }
        clearInputFields()
        passwordInput.placeholderText = "Passwords Don't Match"
        confirmPasswordInput.placeholderText = "Passwords Don't Match"
    }

    Connections{
        target: AuthComponent

        function onEmailPasswordSignUpSuccess(){
            pushPage("SignIn.qml")
        }

        function onEmailPasswordSignUpFailure(){
            console.log("Sign Up Failed")
        }
    }


    function clearInputFields(){
        passwordInput.text = ""
        confirmPasswordInput.text = ""
    }
}
