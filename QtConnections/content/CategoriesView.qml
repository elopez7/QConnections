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

    RoundButton{
        id: customRoundButton
        x: 159
        y: 116
        width: 167
        height: 167
        text: "+"
        font.pixelSize: 164
        font.bold: false
        font.family: "Roboto"
        display: AbstractButton.TextOnly

        background: Rectangle{
            radius: customRoundButton.radius
            color: customRoundButton.down ? "#047eff" : "#1f8efa"
        }


    }
}
