import QtQuick 2.2
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.2

Button {
    property url btnSource : "../../../images/closeBtn.svg"
    width: 50
    height: 35
    background: Rectangle {
        id: windowControlBtnBg
        color: "purple"

        Image {
            id: windowControlBtnImage
            source: btnSource
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
            height: 16
            width: 16
            fillMode: Image.PreserveAspectFit
            antialiasing: false
        }

        ColorOverlay {
            anchors.fill: windowControlBtnImage
            source: windowControlBtnImage
            color: "#ffffff"
            antialiasing: false
        }
    }
}