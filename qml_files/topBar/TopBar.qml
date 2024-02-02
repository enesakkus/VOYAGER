import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../buttons/windowControl"

//~~Top Bar Retangle~~//
////////////////////////
Rectangle {
    id: topBar
    height: 35
    color: "#081625"
    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
        rightMargin: 0
        leftMargin: 0
        topMargin: 0
    }

    QtObject {
        id: topBarInternal

        //~~Function for change maximize/restore button when clicked it.~~//
        ////////////////////////////////////////////////////////////////////
        function maximizeRestore(){
            if(mainWindow.windowStatus == 1){
                mainWindow.showNormal()
                mainWindow.windowStatus = 0
                maximizeBtn.btnSource = "../../images/maximizeBtn.svg"
            }
            else{
                mainWindow.showMaximized()
                mainWindow.windowStatus = 1
                maximizeBtn.btnSource = "../../images/restoreDownBtn.svg"
            }
        }

        //~~Function to change maximize/restore button when full window dragged~~//
        ///////////////////////////////////////////////////////////////////////////
        function editMaximizeButtonWhenDragged(){
            if (mainWindow.windowStatus == 1){
                mainWindow.windowStatus = 0
                maximizeBtn.btnSource = "../../images/maximizeBtn.svg"
            }
        }
    }

    //~~Window Control Row~~//
    //////////////////////////
    Row {
        id: windowControlRow
        width: 150
        height: 35
        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
        }

        //~~Collapse Button~~//
        ///////////////////////
        Window_Control_Btn {
            id: collapseBtn
            btnSource: "../../images/collapseBtn.svg"
            onClicked: {
                mainWindow.showMinimized()
            }
        }

        //~~Maximize Button~~//
        ///////////////////////
        Window_Control_Btn {
            id: maximizeBtn
            btnSource: "../../images/maximizeBtn.svg"
            onClicked:{
                topBarInternal.maximizeRestore()
                lastWindowStatus = mainWindow.windowStatus
                //console.log(lastWindowStatus)
            }
            
        }

        //~~Close Button~~//
        ////////////////////
        Window_Control_Btn {
            id: closeBtn
            btnMouseClickedColor: "#ef2929" 
            onClicked: {
                onClicked: mainWindow.close()
            }
        }
    }

    //~~Title Bar~~//
    /////////////////
    Rectangle {
        id: titleBar
        height: 35
        color: "#00000000"
        anchors {
            left: parent.left
            right: windowControlRow.left
            top: parent.top
            leftMargin: windowControlRow.width
        }
        Label {
            id: appNameLabel
            text: "VOYAGER"
            color: "#6e95bc"
            font.pointSize: 10
            height: 35
            width: 100
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                bottom: parent.bottom
            }
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            renderType: Text.QtRendering    
        }

        Image {
            id: appIcon
            source: "../../images/saturnIcon.svg"
            fillMode: Image.PreserveAspectFit
            width: 20
            height: 20 
            anchors {
                top: parent.top
                bottom: parent.bottom
                right: appNameLabel.left
                
            }
        }

        ColorOverlay {
            id: appIconColorOverlay
            width: 20
            height: 20
            anchors.fill: appIcon
            source: appIcon
            color: "#6e95bc"
            antialiasing: false
        }

        //~~Draghandler For Dragging Frameless Window~~//
        /////////////////////////////////////////////////
        DragHandler{
            id: windowDragHandler
            onActiveChanged:    if(active){
                                mainWindow.startSystemMove()
                                topBarInternal.editMaximizeButtonWhenDragged()
                                lastWindowStatus = mainWindow.windowStatus
                                }
        }

        MouseArea {
            id: titleBarMouseArea
            anchors.fill: parent
            onDoubleClicked: {
                if(mainWindow.windowStatus == 0){
                    topBarInternal.maximizeRestore()
                    lastWindowStatus = mainWindow.windowStatus
                }
            }
        }
    }


}