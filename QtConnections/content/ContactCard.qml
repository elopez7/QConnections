import QtQuick 2.15

ContactCardForm {
    width: 977
    height: 495

    signal addContactToList()
    signal cancelAddContact()
    signal changePicture()

    addContactButton.onClicked:  {
        addContactToList()
    }

    cancelButton.onClicked: {
        cancelAddContact()
    }

    selectPictureButton.onClicked: {
        changePicture()
    }

}
