import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../buttons/leftMenu"

//~~Left Menu Bar Rectangle~~//
///////////////////////////////
Rectangle {
    id: leftMenuBarExpandableRectangle

    color: "#081625"
    width: 40
    anchors {
        left: parent.left
        bottom: parent.bottom
        top: parent.top
        topMargin: 40
    }

    //~~Column For Left Menu Bar~~//
    ////////////////////////////////
    Column {
        id: leftMenuBarColumn
        anchors.fill: parent
        anchors.topMargin: 15

        //~~Left Menu Home Button~~//
        /////////////////////////////
        LeftMenuButton {
            id: leftMenuHomeButton
            btnSource: "../../images/homeBtn2"
            btnText: "Home"
            clip: true
            onClicked: {
                contentRectangle.isMainPageVisible = true
                contentRectangle.isBoltGroupToolPageVisible = false
                contentRectangle.navigationString = "| HOME"
            }
        }
    }

    //~~Property Animation For Left Menu Bar~~//
    ////////////////////////////////////////////
    PropertyAnimation {
        id: leftMenuBarAnimation
        target: leftMenuBarExpandableRectangle
        property: "width"
        to: if(leftMenuBarExpandableRectangle.width == 40) return 200; else return 40
        duration: 500
        easing.type: Easing.InOutQuint

        Component.onCompleted: contentRectangle.anAccesibleItem = leftMenuBarAnimation //~~To make accesible this item to parent item's siblings~~//

    }

}