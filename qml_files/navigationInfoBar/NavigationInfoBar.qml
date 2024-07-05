import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

//~~Navigation Info Bar Rectangle~~//
/////////////////////////////////////
Rectangle {
    id: navigationInfoBarRectangle
    
    height: 40 
    width: 600
    color: "#0f2945"
    anchors {
        top: parent.top
        right: parent.right
        left: leftMenuBarBaseInMain.right
    }

    //~~Navigation Info Bar Text~~//
    ////////////////////////////////
    Text {
        id: navigationInfoBarText
        
        text: contentRectangle.navigationString
        width: 100
        color: "#3a5a7b"
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }
        font.pointSize: 9
        leftPadding: 10
        verticalAlignment: Text.AlignVCenter

    }
}