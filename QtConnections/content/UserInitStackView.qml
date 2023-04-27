import QtQuick
import QtQuick.Controls

StackView {
    id: root
    width: 327
    height: 738
    initialItem: "SignIn.qml"
    signal loadPage(url pageUrl)

    pushEnter: Transition {
        PropertyAnimation {
            property: "opacity"
            from: 0
            to: 1
            duration: 200
        }
    }
    pushExit: Transition {
        PropertyAnimation {
            property: "opacity"
            from: 1
            to: 0
            duration: 200
        }
    }
    popEnter: Transition {
        PropertyAnimation {
            property: "opacity"
            from: 0
            to: 1
            duration: 200
        }
    }
    popExit: Transition {
        PropertyAnimation {
            property: "opacity"
            from: 1
            to: 0
            duration: 200
        }
    }

    replaceEnter: Transition {
        PropertyAnimation {
            property: "opacity"
            from: 0
            to: 1
            duration: 200
        }
    }
    replaceExit: Transition {
        PropertyAnimation {
            property: "opacity"
            from: 1
            to: 0
            duration: 200
        }
    }

    Connections {
        target: root.currentItem
        ignoreUnknownSignals: true
        function onPushPage(pageUrl){
            root.replace(pageUrl)
        }

        function onLoadPage(pageUrl){
            root.loadPage(pageUrl)
        }
    }
}
