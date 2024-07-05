import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Item {
    id: baseItemOnMainPageGridView
    ListModel {
        id: gridViewComponentListModel
        ListElement {name: "BOLT GROUP TOOL"; page: "boltGroupToolPageLoader"; imageSource: "../../../../images/boltGroupToolIcon.svg"}
    }

    GridView {
        id: gridViewComponent
        anchors.fill: parent
        anchors {
            topMargin: 50
            bottomMargin: 50
            leftMargin: 50
            rightMargin: 50
        }
        model: gridViewComponentListModel
        cellHeight: 200
        cellWidth: 200

        delegate: Rectangle {
            id: gridViewDelegateRectangle

            QtObject {
                id: gridViewDelegateRectangleInternal

                property var dynamicColor: if(mouseArea.containsPress){
                                mouseArea.onClicked ? "#1F579C" : "#113056"
                            }else{
                                mouseArea.containsMouse ? "#18457C" : "#113056"
                            }
            }

            width: 150
            height: 150
            color: gridViewDelegateRectangleInternal.dynamicColor
            radius: 5

            Text {
                color: "#6e95bc"
                text: name
                anchors.fill: parent
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignBottom
            }

            MouseArea{
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                acceptedButtons: Qt.LeftButton
                onClicked: {
                            if(name == "BOLT GROUP TOOL"){
                                contentRectangle.isMainPageVisible = false
                                contentRectangle.isBoltGroupToolPageVisible = true
                                contentRectangle.navigationString = "| BOLT GROUP TOOL v1.0"
                            }
                }
            }
            
            Image {
                id: moduleImage
                sourceSize.width: 100
                sourceSize.height: 100
                anchors.fill: parent
                source: imageSource
                anchors.topMargin: 10
                anchors.rightMargin: 25
                anchors.bottomMargin: 35
                anchors.leftMargin: 25
            }

            ColorOverlay{
                anchors.fill: moduleImage
                source: moduleImage
                color: "#081625"
            }
        }
    }
}