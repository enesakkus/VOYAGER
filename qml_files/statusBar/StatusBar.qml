import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

//~~Status Bar Rectangle~~//
////////////////////////////
Rectangle {

    id: statusBarRectangle
    property url resizeImageSource: "../../images/resize_corner.svg"
    height: 25
    color: "#102b49"
    anchors {
        bottom: parent.bottom
        left: parent.left
        right: parent.right
    }

    //~~Status Bar Info Label~~//
    /////////////////////////////
    Label {
        id: statusBarInfoLabel
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
            right: statusBarSoftwareDetails.left
            rightMargin: 20
            leftMargin: 10
        }
        Text {
            id: statusbarInfoLabelText
            //text: qsTr("Status Bar Info.")
            text: appContainer.statusBarMessage
            color: "#3a5a7b"
            anchors.fill: parent
            clip: true
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 9
        }
    }

    //~~Status Bar Software Details~~//
    ///////////////////////////////////
    Label {
        id: statusBarSoftwareDetails
        text: qsTr("Voyager | 2024 | Coded by: Ethem Enes")
        color: "#3a5a7b"
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: cornerResizeImage.left
            rightMargin: 10
        }
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 9
    }

    //~~Corner Resize Image~~//
    ///////////////////////////
    Image {
        id:cornerResizeImage
        visible: if(mainWindow.windowStatus == 0) {
                    true
                } else {
                    false
                }
        source: resizeImageSource
        height: 25
        width: 25
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        fillMode: Image.PreserveAspectFit
        antialiasing: false
    }
    ColorOverlay {
        visible: if(mainWindow.windowStatus == 0) {
                    true
                } else {
                    false
                }
        anchors.fill: cornerResizeImage
        source: cornerResizeImage
        color: "#3a5a7b"
        antialiasing: false
    }
}