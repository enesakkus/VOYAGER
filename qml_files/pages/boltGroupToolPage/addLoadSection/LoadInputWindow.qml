import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../buttons"

Window {
    id: loadInputWindow

    flags: Qt.Window | Qt.FramelessWindowHint
    modality: Qt.ApplicationModal
    width: 800
    height: 400
    color: "#00000000"
    visible: true

    onClosing: loadInputWindowLoader.active = false

    // property string loadNameStr: loadNameTextInput.text

    Rectangle{
        id: loadInputWindowBackground
        color: "#0f263d"
        border.color: "#19436c"
        border.width: 1
        anchors.fill: parent

        Rectangle{

            id: loadInputWindowContainer
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
                    id: loadInputWindowTitleBarRectangle
                    height: 35
                    color: "#00000000"
                    anchors {
                        left: parent.left
                        right: parent.right
                        top: parent.top
                    }
                    Label {
                        id: loadInputWindowAppNameLabel
                        text: "| Create New Load"
                        color: "#6e95bc"
                        font.pointSize: 10
                        height: 35
                        width: 150
                        anchors {
                            left: loadInputWindowTitleBarAppIcon.right
                            leftMargin: 10
                            top: parent.top
                            bottom: parent.bottom
                        }
                        // horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        renderType: Text.QtRendering    
                    }

                    Image {
                        id: loadInputWindowTitleBarAppIcon
                        source: "../../../../images/saturnIcon.svg"
                        fillMode: Image.PreserveAspectFit
                        width: 20
                        height: 20 
                        anchors {
                            top: parent.top
                            bottom: parent.bottom
                            // right: loadInputWindowAppNameLabel.left
                            left: parent.left
                            leftMargin: 10
                            
                        }
                    }

                    ColorOverlay {
                        id: loadInputWindowTitleBarAppIconColorOverlay
                        width: 20
                        height: 20
                        anchors.fill: loadInputWindowTitleBarAppIcon
                        source: loadInputWindowTitleBarAppIcon
                        color: "#6e95bc"
                        antialiasing: false
                    }
                    DragHandler{
                        id: loadInputWindowDragHandler
                        onActiveChanged:    if(active){
                                            loadInputWindow.startSystemMove()
                                            }
                    }
                }
            }          



            Rectangle {
                id: loadSectionRectangle
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

                Rectangle {
                    id: loadStackViewRootRectangle
                    anchors {
                        top: parent.top
                        topMargin: 10
                        left: parent.left
                        leftMargin: 10
                        right: parent.right
                        rightMargin: 10
                        bottom: parent.bottom
                        bottomMargin: 10
                    }
                    color: "#00000000"
                    radius: 8

                    LoadEntryMethodButton {
                        id: directLoadEntryBtn
                        property string directLoadEntryBtnLabelText: "Direct Load Input"
                        width: 150
                        height: 30

                        anchors {
                            left: parent.left
                            // rightMargin: 25
                            top: parent.top
                            // topMargin: 15
                        }
                        onClicked: {
                            loadStackView.pop("DirectLoadInput.qml")
                            directLoadEntryBtn.enabled = false
                            fromSolutionLoadEntryBtn.enabled = true
                        }
                    }

                    LoadEntryMethodButton {
                        id: fromSolutionLoadEntryBtn
                        property string directLoadEntryBtnLabelText: "Hdf5 Load Input"
                        width: 150
                        height: 30

                        anchors {
                            left: directLoadEntryBtn.right
                            leftMargin: 3
                            top: parent.top
                            // topMargin: 15
                        }
                        onClicked: {
                            loadStackView.push("Hdf5LoadInput.qml")
                            fromSolutionLoadEntryBtn.enabled = false
                            directLoadEntryBtn.enabled = true
                        }
                    }

                    //~~Bolt Group Add New Bolt From Tabular Button~~//
                    ///////////////////////////////////////////////////
                    BoltGroupToolAddNewBtn {
                        id: addNewLoadFromTabularBtn
                        anchors {
                            right: addNewLoadBtn.left
                            rightMargin: 3
                            top: parent.top
                            // topMargin: 8
                        }
                        property url boltGroupToolAddNewImage: "../../../../images/BoltGroupToolImages/excel.svg"
                        //~~Tabular Load Input Window~~//
                        /////////////////////////////////
                        Loader {
                            id: tabularLoadInputWindowLoader
                            active: false
                            source: "TabularLoadInputWindow.qml"
                            // Component.onCompleted: boltGroupInputPopUpLoaderAccessible = boltGroupInputWindowLoader
                        }
                        onClicked: {
                            loadStackView.visible = false
                            tabularLoadStackView.visible = true
                        } 
                    }

                    //~~Bolt Group Add New Bolt Button~~//
                    //////////////////////////////////////
                    BoltGroupToolAddNewBtn {
                        id: addNewLoadBtn
                        anchors {
                            right: parent.right
                            rightMargin: 25
                            top: parent.top
                            // topMargin: 8
                        }
                        property url boltGroupToolAddNewImage: "../../../../images/BoltGroupToolImages/add_new3.svg"
                        onPressed:{
                            boltGroupPageBaseRectangle.boltGroupBackend.directLoadModel.appendDirectLoad()
                            boltGroupPageBaseRectangle.boltGroupBackend.hdf5LoadModel.appendhdf5Load()
                        }
                    }

                    StackView {
                        id: loadStackView
                        clip: true
                        initialItem: "DirectLoadInput.qml"
                        visible: true
                        anchors {
                            left: loadStackViewRootRectangle.left
                            // leftMargin: 10
                            right: loadStackViewRootRectangle.right
                            // rightMargin: 10
                            top: directLoadEntryBtn.bottom
                            topMargin: 3
                            bottom: loadStackViewRootRectangle.bottom
                            // bottomMargin: 50
                        }
                    }

                    StackView {
                        id: tabularLoadStackView
                        clip: true
                        initialItem: "TabularDirectLoadInput.qml"
                        visible: false
                        anchors {
                            left: loadStackViewRootRectangle.left
                            // leftMargin: 10
                            right: loadStackViewRootRectangle.right
                            // rightMargin: 10
                            top: directLoadEntryBtn.bottom
                            topMargin: 3
                            bottom: loadStackViewRootRectangle.bottom
                            // bottomMargin: 50
                        }
                    }
                }
            }
            //~~Load Section Rectangle Shadow~~//
            /////////////////////////////////////
            Rectangle {
                id: loadSectionRectangleShadow
                color: "#3282D0"
                radius: 11
                height: 50
                z: -1
                anchors {
                    top: loadSectionRectangle.top
                    topMargin: -2
                    left: loadSectionRectangle.left
                    leftMargin: 1
                    right: loadSectionRectangle.right
                    rightMargin: 1
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
                // onClicked: {
                //     boltGroupPageBaseRectangle.boltGroupBackend.boltGroupModel.appendBoltGroup(loadNameStr, boltGroupPageBaseRectangle.boltGroupBackend.boltModel)
                //     boltGroupPageBaseRectangle.boltGroupBackend.boltModel.resetBoltListModel()
                //     loadInputWindow.close()
                // }
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
                    loadInputWindow.close()
                    // boltGroupPageBaseRectangle.boltGroupBackend.boltModel.resetBoltListModel()
                }                    
            }        
        }
    }
}