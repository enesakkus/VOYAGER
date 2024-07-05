import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../buttons"

Window {
    id: boltGroupInputWindow

    flags: Qt.Window | Qt.FramelessWindowHint
    modality: Qt.ApplicationModal
    width: 800
    height: 400
    color: "#00000000"
    visible: true

    onClosing: boltGroupInputWindowLoader.active = false

    property string boltGroupNameStr: boltGroupNameTextInput.text

    Rectangle{
        id: boltGroupInputWindowBackground
        color: "#0f263d"
        border.color: "#19436c"
        border.width: 1
        anchors.fill: parent

        Rectangle{

            id: boltGroupInputWindowContainer
            color: "#00000000"
            anchors.fill: parent
            anchors {
                topMargin: 1
                bottomMargin: 1
                leftMargin: 1
                rightMargin: 1
            }
            //~~Input Window Top Bar~~//
            ////////////////////////////
            Rectangle {
                id: inputWindowTopBar
                color: "#081625"
                height: 35
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                }
                //~~Title Bar~~//
                /////////////////
                Rectangle {
                    id: boltGroupInputWindowTitleBarRectangle
                    height: 35
                    color: "#00000000"
                    anchors {
                        left: parent.left
                        right: parent.right
                        top: parent.top
                    }
                    Label {
                        id: boltGroupInputWindowAppNameLabel
                        text: "| Create New Bolt Group"
                        color: "#6e95bc"
                        font.pointSize: 10
                        height: 35
                        width: 200
                        anchors {
                            left: parent.left
                            leftMargin: 30
                            top: parent.top
                            bottom: parent.bottom
                        }
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        renderType: Text.QtRendering    
                    }

                    Image {
                        id: boltGroupInputWindowTitleBarAppIcon
                        source: "../../../../images/saturnIcon.svg"
                        fillMode: Image.PreserveAspectFit
                        width: 20
                        height: 20 
                        anchors {
                            top: parent.top
                            bottom: parent.bottom
                            right: boltGroupInputWindowAppNameLabel.left
                            
                        }
                    }

                    ColorOverlay {
                        id: boltGroupInputWindowTitleBarAppIconColorOverlay
                        width: 20
                        height: 20
                        anchors.fill: boltGroupInputWindowTitleBarAppIcon
                        source: boltGroupInputWindowTitleBarAppIcon
                        color: "#6e95bc"
                        antialiasing: false
                    }
                    DragHandler{
                        id: boltGroupInputWindowDragHandler
                        onActiveChanged:    if(active){
                                            boltGroupInputWindow.startSystemMove()
                                            // topBarInternal.editMaximizeButtonWhenDragged()
                                            // lastWindowStatus = mainWindow.windowStatus
                                            }
                    }
                }
            }
            
            Rectangle {
                id: boltSectionRectangle
                color: "#122F4B"
                radius: 8
                anchors {
                    left: parent.left
                    leftMargin: 15
                    right: parent.right
                    rightMargin: 15
                    bottom: parent.bottom
                    bottomMargin: 60
                    top: inputWindowTopBar.bottom
                    topMargin: 15

                }
                Rectangle{
                    id: boltGroupNameTextInputBorder
                    height: 80
                    width: 150
                    // color: "#00000000"
                    color: "#264360"                        
                    radius: 5
                    // border.width: 1
                    // border.color: "#6e95bc"
                    anchors {
                        left: boltSectionRectangle.left
                        leftMargin: 10
                        top: boltSectionRectangle.top
                        topMargin: 8
                    }
                    MouseArea{
                        height: 30
                        anchors {
                            top: parent.top
                            left: parent.left
                            right: parent.right
                        }
                        cursorShape: Qt.IBeamCursor
                        TextInput{
                            id: boltGroupNameTextInput
                            text: "Bolt Group #1"
                            color: "#6e95bc"
                            leftPadding: 5
                            rightPadding: 5
                            font.pointSize: 9.5
                            anchors.fill: parent
                            anchors.leftMargin: 15
                            verticalAlignment: Text.AlignVCenter
                            font.hintingPreference: Font.PreferDefaultHinting
                            selectByMouse: true
                            clip: true
                            // onFocusChanged: console.log("Focus Changed")
                            selectionColor: "#4f5051"
                            // font.underline: true
                        }
                    }

                }
                TextEdit {
                    height: 10
                    width: 350
                    text: "| Bolt Group CG: X: 1000.00, Y: 1000.00, Z: 1000.00"
                    color: "#3a5a7b"
                    font.pointSize: 9
                    readOnly: true
                    selectByMouse: true
                    selectionColor: "#4f5051"
                    anchors {
                        right: boltSectionRectangle.right
                        rightMargin: 20
                        bottom: boltSectionRectangle.bottom
                        bottomMargin: 20
                        // horizontalCenter: parent.horizontalCenter
                    }
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    renderType: Text.QtRendering
                }

                //~~Bolt Group Add New Bolt Button~~//
                //////////////////////////////////////
                BoltGroupToolAddNewBtn {
                    id: addNewBoltBtn
                    anchors {
                        right: parent.right
                        rightMargin: 25
                        top: parent.top
                        topMargin: 8
                    }
                    property url boltGroupToolAddNewImage: "../../../../images/BoltGroupToolImages/add_new3.svg"
                    onPressed:{
                        boltGroupPageBaseRectangle.boltGroupBackend.boltModel.appendBolt()
                    }
                }
                //~~Bolt List View Rectangle~~//
                ////////////////////////////////
                Rectangle {
                    id: boltListViewBaseRectangle
                    color: "#264360"
                    radius: 8
                    clip: true
                    anchors {
                        left: boltSectionRectangle.left
                        leftMargin: 10
                        right: boltSectionRectangle.right
                        rightMargin: 10
                        top: boltSectionRectangle.top
                        topMargin: 40
                        bottom: boltSectionRectangle.bottom
                        bottomMargin: 50
                    }
                    BoltListView{
                        
                    }
                    // Component.onCompleted : boltListViewBaseRectangleAccessible = boltListViewBaseRectangle
                }
                //~~Bolt Section Rectangle Shadow~~//
                /////////////////////////////////////
                Rectangle {
                    id: boltListViewBaseRectangleShadow
                    color: "#3282D0"
                    radius: 11
                    height: 50
                    z: -1
                    anchors {
                        top: boltSectionRectangle.top
                        topMargin: -2
                        left: boltSectionRectangle.left
                        leftMargin: 1
                        right: boltSectionRectangle.right
                        rightMargin: 1
                        }
                }
            }
            

            BoltInputApprovalButton {
                id: boltInputWindowApprovalBtn
                property string boltInputWindowApprovalBtnLabelText: "Apply"
                width: 100
                height: 30

                anchors {
                    right: parent.right
                    rightMargin: 25
                    bottom: parent.bottom
                    bottomMargin: 15
                }
                onClicked: {
                    boltGroupPageBaseRectangle.boltGroupBackend.boltGroupModel.appendBoltGroup(boltGroupNameStr, boltGroupPageBaseRectangle.boltGroupBackend.boltModel)
                    boltGroupPageBaseRectangle.boltGroupBackend.boltModel.resetBoltListModel()
                    boltGroupInputWindow.close()
                }
            }
            BoltInputApprovalButton {
                property string boltInputWindowApprovalBtnLabelText: "Cancel"
                btnDefaultColor: "#112c47"
                btnMouseOverColor: "#38638f"
                width: 100
                height: 30

                anchors {
                    right: boltInputWindowApprovalBtn.left
                    rightMargin: 10
                    bottom: parent.bottom
                    bottomMargin: 15
                }
                onClicked: {
                    boltGroupInputWindow.close()
                    boltGroupPageBaseRectangle.boltGroupBackend.boltModel.resetBoltListModel()
                }                    
            }

        
        
        
        
        
        
        
        
        
        
        
        
        }
    }
}