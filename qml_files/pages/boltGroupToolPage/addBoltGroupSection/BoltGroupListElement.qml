import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../buttons"

Component {
    id: boltListElementDelegate

    Column {
        id: boltListElementDelegateColumn
        width: boltGroupListView.width

        property bool isCollapsed: true

        Rectangle{
            id: listElementBaseRectangle
            color: "#2869A8"
            height: 30
            // width: 720
            // border.color: "#122F4B"
            border.color: "#6e95bc"
            border.width: 1
            radius: 9
            anchors {
                // left: boltGroupListView.contentItem.left
                left: parent.left
                leftMargin: 10
                // right: boltGroupListView.contentItem.right
                right: parent.right
                rightMargin: 15
            }
            Rectangle {
                    id: greenRectangle
                    // height: 25
                    width: 100
                    // color: "#12C56A"
                    gradient: Gradient {
                        GradientStop {
                            position: 0.0; color: "#12C56A"
                        }
                        // GradientStop {
                        //     position: 0.5; color: "#12C56A"
                        // }
                        GradientStop {
                            position: 1.0; color: "#00000000"
                        }
                        orientation: Gradient.Horizontal
                    }
                    radius: 9
                    anchors{
                        top: parent.top
                        topMargin: 1
                        bottom: parent.bottom
                        bottomMargin: 1
                        left: parent.left
                        // leftMargin: 15
                        // verticalCenter: listElementBaseRectangle.verticalCenter
                    }
                    Button {
                        id: bolgGroupExpandBtn
                        width: parent.height
                        height: parent.height
                        anchors {
                            left: parent.left
                            verticalCenter: parent.verticalCenter
                        }
                        onClicked:{
                            isCollapsed = !isCollapsed
                        }
                        background: Rectangle {
                            id: bolgGroupExpandBtnBg
                            radius: 8
                            color: "#00000000"
                            Image {
                                id: collapsedArrow
                                source: "../../../../images/downArrowBtn.svg"
                                fillMode: Image.PreserveAspectFit
                                sourceSize.width: 50
                                sourceSize.height: 50
                                width: 15
                                height: 15
                                anchors {
                                    verticalCenter: bolgGroupExpandBtnBg.verticalCenter
                                    horizontalCenter: bolgGroupExpandBtnBg.horizontalCenter
                                    // left: parent.left
                                    // leftMargin: 5
                                }
                                rotation: isCollapsed ? 270 : 0
                            }
                            ColorOverlay {
                                id: collapsedArrowColorOverlay
                                width: 15
                                height: 15
                                anchors.fill: collapsedArrow
                                source: collapsedArrow
                                color: "#122F4B"            
                                antialiasing: false
                                rotation: isCollapsed ? 270 : 0
                            }
                        }
                    }
                    Image {
                        id: boltIcon
                        source: "../../../../images/BoltGroupToolImages/boltGroup.svg"
                        fillMode: Image.PreserveAspectFit
                        sourceSize.width: 50
                        sourceSize.height: 50
                        width: 30
                        height: 30
                        anchors {
                            verticalCenter: parent.verticalCenter
                            left: bolgGroupExpandBtn.right
                            leftMargin: 5
                        }
                    }
                    ColorOverlay {
                        id: boltIconColorOverlay
                        width: 30
                        height: 30
                        anchors.fill: boltIcon
                        source: boltIcon
                        color: "#122F4B"            
                        antialiasing: false
                    }

                    Label {
                        id: boltGroupNameLabel
                        text: boltGroupName
                        color: "#081625" 
                        font.pointSize: 9
                        anchors {
                            left: boltIcon.right
                            leftMargin: 30
                            verticalCenter: parent.verticalCenter
                        }
                        verticalAlignment: Text.AlignVCenter
                        renderType: Text.QtRendering    
                    }
            }
            BoltGroupToolDeleteBtn {
                id: deleteBoltGroup
                anchors {
                    right: parent.right
                    rightMargin: 25
                    verticalCenter: parent.verticalCenter
                    // horizontalCenter: parent.horizontalCenter
                }
                property url boltGroupToolAddNewImage: "../../../../images/BoltGroupToolImages/delete.svg"
                onClicked:{
                    boltGroupPageBaseRectangle.boltGroupBackend.boltGroupModel.deleteBoltGroup(model.index)
                }
            }
        }

        Loader {
            id: subItemLoader
            visible: !isCollapsed
            // visible: true
            property var subItemModel: subItems
            sourceComponent: isCollapsed ? null : boltGroupExpandable
            // sourceComponent: boltGroupExpandable
            onStatusChanged: {
                if(status == Loader.Ready) {
                    item.model = subItemModel
                    item.parentsIndex = model.index
                }
            }
        }
    }
}
