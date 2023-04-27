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
            addContactPopup.open()
        }

    }

    Popup{
        id: addContactPopup
        width: 977
        height: 495
        anchors.centerIn: root


        contentItem: ContactCard{

        }
    }
}
