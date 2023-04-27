import QtQuick 6.4
import QtQuick.Controls 6.4
import QtConnections
import QtQuick.Layouts 6.3
import QtCharts 6.3

Rectangle {
    id: root
    width: Constants.width
    height: Constants.height
    color: "#242e42"

    signal loadPage(url pageUrl)

    Image {
        id: titleImage
        source: "images/titleImage.png"
        fillMode: Image.PreserveAspectFit

        Image {
            id: logoCaption
            anchors.left: parent.left
            anchors.top: parent.top
            source: "images/LogoCaption.png"
            anchors.topMargin: 56
            anchors.leftMargin: 53
            fillMode: Image.PreserveAspectFit
        }

        ColumnLayout {
            id: welcomeText
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 272
            anchors.bottomMargin: 256
            anchors.leftMargin: 53
            anchors.topMargin: 382

            Label {
                id: yourConnections
                color: "#ffffff"
                text: qsTr("YOUR CONNECTIONS")
                font.pixelSize: 50
                font.styleName: "Light"
                font.family: "Roboto"
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            Label {
                id: singlePlace
                color: "#ffffff"
                text: qsTr("IN A SINGLE PLACE!")
                font.pixelSize: 50
                font.styleName: "Bold"
                font.family: "Roboto"
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            Item {
                id: item1
                width: 200
                height: 200
                Layout.maximumHeight: 64
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            Label {
                id: label
                color: "#eeeff0"
                text: qsTr("Built with pride using:")
                font.pixelSize: 18
                font.styleName: "Bold"
                font.family: "Roboto"
            }

            RowLayout {
                id: rowLayout
                width: 100
                height: 100
                Layout.fillHeight: true
                Layout.fillWidth: true

                Image {
                    id: qtLogo
                    source: "images/qtLogo.png"
                    Layout.maximumWidth: 64
                    Layout.minimumHeight: 64
                    Layout.maximumHeight: 64
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    fillMode: Image.PreserveAspectFit
                }

                Image {
                    id: c_Logo
                    source: "images/C_Logo.png"
                    Layout.maximumWidth: 64
                    Layout.maximumHeight: 64
                    Layout.minimumHeight: 64
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
    }

    UserInitStackView {
        id: userInitStackView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 101
        anchors.bottomMargin: 43
        anchors.topMargin: 119
        anchors.leftMargin: 1012

        Connections {
            target: userInitStackView
            function onLoadPage(pageUrl) {
                loadPage(pageUrl)
            }
        }
    }
}
