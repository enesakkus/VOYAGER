import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "buttons/windowControl"
import "TopBar"
import "StatusBar"

Window {
    id: mainWindow
    width: 1280
    height: 720
    minimumWidth: 1280
    minimumHeight: 720
    visible: true
    color: "#00000000"
    title: qsTr("Voyager")

    //~~Remove MS Windows Frame~~//
    ///////////////////////////////
    flags: Qt.Window | Qt.FramelessWindowHint

    //~~Main QML QtObjects for Window Control Buttons~~//
    ///////////////////////////////////////////////////// 
    property int windowStatus: 0
    property int lastWindowStatus: 0

    onActiveChanged: {
        if(mainWindow.active == true & lastWindowStatus == 1){
            mainWindow.showMaximized()
        }
    }

    //~~Background Rectange~~//
    ///////////////////////////
    Rectangle {
        id: background
        color: "#163758"
        border.color: "#19436c"
        border.width: 1
        anchors.fill: parent

        //~~App Container Rectangle~~//
        ///////////////////////////////
        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.fill: parent
            anchors {
                topMargin:1
                bottomMargin:1
                leftMargin:1
                rightMargin:1
            }

            TopBar {
                id: topBarInMain
            }

            StatusBar {
                id: statusBarInMain
            }
        }
    }

    //~~Mouse Area for corner resize action~~//
    ///////////////////////////////////////////
    MouseArea {
        id: resizeCorner
        width: 20
        height: 20
        anchors {
            right: parent.right
            bottom: parent.bottom
        }
        cursorShape: if(windowStatus == 0){
                        Qt.SizeFDiagCursor
                    }
        DragHandler {
            target: null
            onActiveChanged: if(active & windowStatus == 0) {mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)}
        }
    }

    //~~Mouse Area for bottom resize action~~//
    ///////////////////////////////////////////
    MouseArea {
        id: resizeBottom
        height: 8
        anchors {
            right: parent.right
            bottom: parent.bottom
            left: parent.left
            rightMargin: 20
        }
        cursorShape: if(windowStatus == 0){
                        Qt.SizeVerCursor
                    }
        DragHandler {
            target: null
            onActiveChanged: if(active & windowStatus == 0) {mainWindow.startSystemResize(Qt.BottomEdge)}
        }
    }

    //~~Mouse Area for right resize action~~//
    ///////////////////////////////////////////
    MouseArea {
        id: resizeRight
        width: 8
        anchors {
            right: parent.right
            bottom: parent.bottom
            top: parent.top
            bottomMargin: 20
        }
        cursorShape: if(windowStatus == 0){
                        Qt.SizeHorCursor
                    }
        DragHandler {
            target: null
            onActiveChanged: if(active & windowStatus == 0) {mainWindow.startSystemResize(Qt.RightEdge)}
        }
    }

    //~~Mouse Area for left resize action~~//
    ///////////////////////////////////////////
    MouseArea {
        id: resizeLeft
        width: 8
        anchors {
            left: parent.left
            bottom: parent.bottom
            top: parent.top
            bottomMargin: 20
        }
        cursorShape: if(windowStatus == 0){
                        Qt.SizeHorCursor
                    }
        DragHandler {
            target: null
            onActiveChanged: if(active & windowStatus == 0) {mainWindow.startSystemResize(Qt.LeftEdge)}
        }
    }
}