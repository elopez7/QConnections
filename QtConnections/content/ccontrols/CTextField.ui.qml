import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 6.3

TextField {
    id: textInput1
    color: "#1f8efa"
    font.pixelSize: 12
    verticalAlignment: Text.AlignVCenter
    placeholderTextColor: "#871f8efa"
    placeholderText: "Password"
    Layout.maximumHeight: 33
    Layout.fillHeight: true
    Layout.fillWidth: true
    font.styleName: "Regular"
    font.family: "Roboto"
    background: Rectangle {
        implicitWidth: parent.width
        implicitHeight: parent.height
        color: "#20293C"
        border.color: "#3E4E6C"
        radius: 4
    }
}
