import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: windowControlBtn
    //~~Property for reference on main qml file~~//
    ///////////////////////////////////////////////
    property url btnSource : "../../../images/closeBtn.svg"

    //~~Properties for dynamic coloring of button~~//
    /////////////////////////////////////////////////
    property color btnDefaultColor: "#081625"
    property color btnMouseOverColor: "#102B49"
    property color btnMouseClickedColor: "#1C4E83"

    //~~QtObject for dynamic coloring of button~~//
    ///////////////////////////////////////////////
    QtObject {
        id: internal
        property var dynamicColor: if(windowControlBtn.down){
                                        windowControlBtn.down ? btnMouseClickedColor : btnDefaultColor
                                    }
                                    else {
                                        windowControlBtn.hovered ? btnMouseOverColor : btnDefaultColor
                                    }
    }

    width: 50
    height: 35
    background: Rectangle {
        id: windowControlBtnBg
        color: internal.dynamicColor

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