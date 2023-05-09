import QtQuick

DashboardForm {
    property int authMethod

    property int anonymous : 0
    property int emailAndPassword : 1


    Component.onCompleted: {
        if(authMethod === anonymous){
            dashboardStackView.push("DashboardMain.qml", {"authMethod" : authMethod})
        }
        else if(authMethod === emailAndPassword){
            console.log("EMAIL AND PASSWORD")
        }
    }
}
