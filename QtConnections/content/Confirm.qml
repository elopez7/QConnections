import QtQuick 2.15

ConfirmForm {
    width: 376
    height: 504

    signal confirmRemove()
    signal cancelRemove()

    yesButton.onClicked: {
        confirmRemove()
    }

    noButton.onClicked: {
        cancelRemove()
    }
}

