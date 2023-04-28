import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    width: 1250
    height: 833

    ContactsGridView{
        anchors.left: parent.left
        anchors.right: toolBar.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        clip: true
        anchors.rightMargin: 0

    }

    ContactsViewToolbar{
        id: toolBar
        x: 1106
        y: 8

        onAddContact: {
            contactCardPopup.cardText = "Add Contact"
            contactCardPopup.addContactText = "Add Contact"
            addContactPopup.open()
        }

        onRemoveContact: {
            removeContactDialog.open()
        }

        onEditContact: {
            contactCardPopup.cardText = "Edit Contact"
            contactCardPopup.addContactText = "Update Contact"
            addContactPopup.open()
        }
    }

    Dialog{
        id: removeContactDialog
        anchors.centerIn: root
        modal: true
        closePolicy: Popup.NoAutoClose
        contentItem: Confirm{
            id: confirmDialog

            onConfirmRemove: {
                removeContactDialog.close()
            }

            onCancelRemove: {

                removeContactDialog.close()
            }
        }

        enter: Transition {
            NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 }
        }

        exit: Transition {
            NumberAnimation { property: "opacity"; from: 1.0; to: 0.0 }
        }
    }

    Popup{
        id: addContactPopup
        width: 977
        height: 495
        modal: true
        anchors.centerIn: root
        closePolicy: Popup.NoAutoClose

        contentItem: ContactCard{
            id: contactCardPopup

            onChangePicture: {
                addContactPopup.close()
            }

            onCancelAddContact: {
                addContactPopup.close()
            }

            onAddContactToList: {
                addContactPopup.close()
            }
        }
        enter: Transition {
            NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 }
        }

        exit: Transition {
            NumberAnimation { property: "opacity"; from: 1.0; to: 0.0 }
        }
    }
}
