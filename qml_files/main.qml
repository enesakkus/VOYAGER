import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.2
import "buttons/windowControl"

Window {
    id: mainWindow
    width: 1000
    height: 580
    visible: true
    color: "#00000000"
    title: qsTr("Voyager")

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

            //~~Top Bar Rectangle~~//
            /////////////////////////
            Rectangle{
                id: topBar
                height: 35
                color: "#081625"
                anchors{
                    left: parent.left
                    right: parent.right
                    top: parent.top
                    rightMargin: 0
                    leftMargin: 0
                    topMargin: 0
                }

                //~~Window Control Row~~//
                //////////////////////////
                Row{
                    id: windowControlRow
                    width: 150
                    height: 35
                    anchors{
                        right: parent.right
                        top: parent.top
                        bottom: parent.bottom
                    }
                    //~~Collapse Button~~//
                    ///////////////////////
                    Window_Control_Btn {
                        id: btnCollapse
                        btnSource: "../images/collapseBtn.svg"
                    }
                    //~~Maximize Button~~//
                    ///////////////////////                        
                    Window_Control_Btn {
                        id: btnMaximize
                        btnSource: "../images/maximizeBtn.svg"
                    }                
                    //~~Close Button~~//
                    ////////////////////
                    Window_Control_Btn {
                        id: btnClose
                    }
                }
            }
        }
    }
}