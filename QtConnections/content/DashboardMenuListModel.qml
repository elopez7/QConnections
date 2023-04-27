import QtQuick 2.15

ListModel {
    ListElement {
        name: "Home"
        iconSource: "images/homeIcon.png"
        iconAlternate: "images/homeIconHighlight.png"
        pageUrl: "DashboardMain.qml"
    }
    ListElement {
        name: "Contacts"
        iconSource: "images/contactsIcon.png"
        iconAlternate: "images/contactsIconHighlight.png"
        pageUrl: "ContactsView.qml"
    }
}
