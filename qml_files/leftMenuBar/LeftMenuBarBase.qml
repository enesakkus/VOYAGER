import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../buttons/leftMenu"

//~~Left Menu Bar Background~~//
////////////////////////////////
Rectangle {
    id: leftMenuBarBaseRectangle
    width: 40
    color: "#081625"
    anchors {
        left: parent.left
        top: parent.top
        bottom: parent.bottom
    }

    LeftMenuToggleBtn {
        id: leftMenuToggleBtn
        anchors {
            top: parent.top
        }
        onPressed: contentRectangle.anAccesibleItem.start() 
    }
}