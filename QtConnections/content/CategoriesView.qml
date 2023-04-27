import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: root
    width: 1250
    height: 833

    RowLayout{
        id: sampleLayout
        anchors.fill: parent

        Rectangle{
            id: rect1
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "Blue"

        }

        Rectangle{
            id: rect2
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "Red"
        }
    }
}
