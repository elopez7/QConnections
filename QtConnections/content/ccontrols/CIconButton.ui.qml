import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

AbstractButton {
    id: addContact

    property alias iconSource: buttonIcon.source

    icon.source: "images/buttonAdd.png"
    display: AbstractButton.IconOnly
    Layout.fillHeight: true
    Layout.fillWidth: true
    Image {
        id: buttonIcon
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }
}
