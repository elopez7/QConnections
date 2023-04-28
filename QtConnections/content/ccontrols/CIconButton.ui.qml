import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RoundButton {
    id: root
    width: 512
    height: 512

    property alias buttonTextIcon: buttonContent.text

    display: AbstractButton.TextOnly
    Layout.fillHeight: true
    Layout.fillWidth: true

    contentItem: Label {
        id: buttonContent
        text: "+"
        anchors.fill: parent
        font.pixelSize: 400
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.family: "Roboto"
    }

    background: Rectangle {
        radius: root.radius
        color: root.down ? "#047eff" : "#1f8efa"
    }
}
