

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

AbstractButton {
    id: delegate
    width: 190 //ListView.view.width
    height: 53

    required property int index
    required property string name
    required property url iconSource
    required property url iconAlternate
    required property url pageUrl

    signal pushPage(url pageToPush)

    RowLayout {
        id: rowLayout
        anchors.fill: parent

        Image {
            id: itemIcon
            width: 100
            height: 100
            source: delegate.iconSource
            Layout.maximumWidth: 72
            Layout.bottomMargin: 8
            Layout.topMargin: 8
            Layout.fillHeight: true
            Layout.fillWidth: true
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: label
            color: "#98a7b9"

            text: delegate.name
            font.pixelSize: 12
            verticalAlignment: Text.AlignVCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
            font.styleName: "Regular"
            font.family: "Roboto"
        }
    }

    states: [
        State {
            name: "Highlighted"

            when: delegate.ListView.isCurrentItem
            PropertyChanges {
                target: label
                color: "#1F8EFA"
            }

            PropertyChanges {
                target: itemIcon
                source: delegate.iconAlternate
            }
        }
    ]

    Connections {
        function onClicked() {
            delegate.ListView.view.currentIndex = index
            pushPage(pageUrl)
        }
    }
}
