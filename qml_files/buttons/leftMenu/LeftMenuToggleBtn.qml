import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: leftMenuToggleBtn
    //~~Property for reference on main qml file~~//
    ///////////////////////////////////////////////
    property url btnSource : "../../../images/toggleBtn.svg"

    //~~Properties for dynamic coloring of button~~//
    /////////////////////////////////////////////////
    property color btnDefaultColor: "#081625"
    property color btnMouseOverColor: "#102B49"
    property color btnMouseClickedColor: "#1C4E83"

    //~~QtObject for dynamic coloring of button~~//
    ///////////////////////////////////////////////
    QtObject {
        id: internal
        property var dynamicColor: if(leftMenuToggleBtn.down){
                                        leftMenuToggleBtn.down ? btnMouseClickedColor : btnDefaultColor
                                    }
                                    else {
                                        leftMenuToggleBtn.hovered ? btnMouseOverColor : btnDefaultColor
                                    }
    }

    width: 40
    height: 40
    background: Rectangle {
        id: leftMenuToggleBtnBg
        color: internal.dynamicColor

        Image {
            id: leftMenuToggleBtnImage
            source: btnSource
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
            height: 28
            width: 28
            fillMode: Image.PreserveAspectFit
            antialiasing: false
        }

        ColorOverlay {
            anchors.fill: leftMenuToggleBtnImage
            source: leftMenuToggleBtnImage
            color: "#ffffff"
            antialiasing: false
        }
    }
}