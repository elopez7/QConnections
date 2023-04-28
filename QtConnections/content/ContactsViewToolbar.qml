import QtQuick 2.15

ContactsViewToolbarForm {
    width: 136
    height: 817

    signal addContact()
    signal removeContact()
    signal editContact()

    addContactButton.onClicked: {
        addContact()
    }

    removeContactButton.onClicked: {
        removeContact()
    }

    editContactButton.onClicked: {
        editContact()
    }
}
