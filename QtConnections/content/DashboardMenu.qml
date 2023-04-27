import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    width: 190
    height: 833

    signal pushPage(url pageUrl)

    UserInfoCard {
        id: userInfoCard
        anchors.top: parent.top
        anchors.topMargin: 25
        anchors.horizontalCenter: parent.horizontalCenter
    }

    DashboardMenuList {
        id: dashboardMenuList
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: userInfoCard.bottom
        anchors.bottom: parent.bottom
        clip: true
        anchors.topMargin: 32

        Connections{
            target: dashboardMenuList
            function onPushPage(pageUrl){
                root.pushPage(pageUrl)
            }
        }
    }
}
