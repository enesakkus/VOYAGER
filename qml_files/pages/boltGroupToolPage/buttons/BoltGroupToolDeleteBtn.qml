import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Window 2.15

Button {
    id: boltGroupAddNewBtn

    property color btnDefaultColor: "#00000000"
    property color btnMouseOverColor: "#53A4F4"
    property color btnMouseClickedColor: "#1C4E83"
    width: 25
    height: 25

    QtObject{
        id: internalDynamicColorSelection

        property var dynamicColor: if(boltGroupAddNewBtn.down){
                                        boltGroupAddNewBtn.down ? btnMouseClickedColor : btnDefaultColor
                                    }else{
                                        boltGroupAddNewBtn.hovered ? btnMouseOverColor : btnDefaultColor
                                    }

    }

    background: Rectangle {
        color: internalDynamicColorSelection.dynamicColor
        anchors.fill: parent
        radius: 5

        Image {
            id: addNewBoltGroupImage
            source: boltGroupToolAddNewImage
            // source: "../../../../images/BoltGroupToolImages/add_new.svg"
            //sourceSize.width: 30
            //sourceSize.height: 30
            height: parent.height-5
            width: parent.width-5
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        ColorOverlay {
            color: "#d3e6f3"
            anchors.fill: addNewBoltGroupImage
            height: parent.height-5; width: parent.width-5
            source: addNewBoltGroupImage
            antialiasing: false
        }
    }
}