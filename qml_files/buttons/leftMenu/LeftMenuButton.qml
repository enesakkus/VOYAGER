import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: leftMenuBtn
    //~~Property for reference on main qml file~~//
    ///////////////////////////////////////////////
    property url btnSource : "../../../images/toggleBtn.svg"
    property string btnText : "Dummy Button Name"

    //~~Properties for dynamic coloring of button~~//
    /////////////////////////////////////////////////
    property color btnDefaultColor: "#081625"
    property color btnMouseOverColor: "#102B49"
    property color btnMouseClickedColor: "#1C4E83"

    //~~QtObject for dynamic coloring of button~~//
    ///////////////////////////////////////////////
    QtObject {
        id: internal
        property var dynamicColor: if(leftMenuBtn.down){
                                        leftMenuBtn.down ? btnMouseClickedColor : btnDefaultColor
                                    }
                                    else {
                                        leftMenuBtn.hovered ? btnMouseOverColor : btnDefaultColor
                                    }
    }

    width: 200
    height: 40
    background: Rectangle {
        id: leftMenuBtnBg
        color: internal.dynamicColor

        Image {
            id: leftMenuBtnImage
            source: btnSource
            anchors {
                verticalCenter: parent.verticalCenter
                //horizontalCenter: parent.horizontalCenter
                left: parent.left
                leftMargin: 6
            }
            height: 28
            width: 28
            fillMode: Image.PreserveAspectFit
            antialiasing: false
        }

        ColorOverlay {
            anchors.fill: leftMenuBtnImage
            source: leftMenuBtnImage
            color: "#ffffff"
            antialiasing: false
        }

        Text {
            id: buttonNameText
            text: btnText
            color: "#ffffff"
            anchors.fill: parent
            anchors.leftMargin: 40
            verticalAlignment: Text.AlignVCenter
            leftPadding: 20
            font.pointSize: 9
        }
    }
}