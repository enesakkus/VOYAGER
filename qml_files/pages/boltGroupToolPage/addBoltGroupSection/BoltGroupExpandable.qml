import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.3
import QtGraphicalEffects 1.15

Component {
    id: boltGroupExpandableDelegate

    Column {
        id: columnElement
        width: boltGroupListView.width
        spacing: 3

        property alias model: subItemRepeater.model
        property string parentsIndex

        anchors {
            top: parent.top
            topMargin: 3
        }

        Repeater {
            id: subItemRepeater
            delegate: Rectangle {
                id: subitemRectangle
                anchors {
                    left: parent.left
                    leftMargin: 30
                    // top: parent.top
                    // right: parent.right
                    // rightMargin: 1000
                }
                height: 25
                width: 700
                radius: 9
                color: "#2869A8"
                border.width: 1
                border.color: "#6e95bc"

                Rectangle {
                    id: idRectangle
                    height: parent.height
                    width: 400
                    radius: 9
                    color: "#00000000"
                    anchors{
                        left: parent.left
                        verticalCenter: subitemRectangle.verticalCenter
                    }
                    Image {
                        id: boltIcon
                        source: "../../../../images/BoltGroupToolImages/bolt.svg"
                        fillMode: Image.PreserveAspectFit
                        sourceSize.width: 50
                        sourceSize.height: 50
                        width: 20
                        height: 20 
                        anchors {
                            verticalCenter: parent.verticalCenter
                            left: parent.left
                            leftMargin: 5
                        }
                    }
                    ColorOverlay {
                        id: boltIconColorOverlay
                        width: 20
                        height: 20
                        anchors.fill: boltIcon
                        source: boltIcon
                        // color: "#6e95bc"
                        color: "#122F4B"            
                        // color: "red"
                        antialiasing: false
                    }
                    TextInput{
                        id: boltGroupNameTextInput
                        width: 50
                        height: 25
                        text: boltIdNumber
                        color: "#122F4B"
                        leftPadding: 5
                        rightPadding: 5
                        font.pointSize: 9
                        anchors.left: boltIcon.right
                        anchors.leftMargin: 10
                        readOnly: true
                        anchors.verticalCenter: parent.verticalCenter
                        verticalAlignment: Text.AlignVCenter
                        font.hintingPreference: Font.PreferDefaultHinting
                        selectByMouse: true
                        clip: true
                        selectionColor: "#4f5051"
                    }

                    Label {
                        id: boltXLabel
                        text: "X:"
                        color: "#122F4B" 
                        font.pointSize: 9
                        anchors {
                            left: boltGroupNameTextInput.right
                            leftMargin: 40
                            verticalCenter: parent.verticalCenter
                        }
                        verticalAlignment: Text.AlignVCenter
                        renderType: Text.QtRendering    
                    }

                    TextInput{
                        id: boltXCoordInput
                        width: 65
                        height: 25
                        text: boltXCoord.toFixed(2)
                        color: "#b6d9fd"
                        leftPadding: 5
                        rightPadding: 5
                        font.pointSize: 9
                        anchors.left: boltXLabel.right
                        anchors.leftMargin: 10
                        readOnly: true
                        anchors.verticalCenter: parent.verticalCenter
                        verticalAlignment: Text.AlignVCenter
                        font.hintingPreference: Font.PreferDefaultHinting
                        selectByMouse: true
                        clip: true
                       selectionColor: "#4f5051"
                    }


                    Label {
                        id: boltYLabel
                        text: "Y:"
                        color: "#122F4B" 
                        font.pointSize: 9
                        anchors {
                            left: boltXCoordInput.right
                            leftMargin: 5
                            verticalCenter: parent.verticalCenter
                        }
                        verticalAlignment: Text.AlignVCenter
                        renderType: Text.QtRendering    
                    }

                    TextInput{
                        id: boltYCoordInput
                        width: 65
                        height: 25
                        text: boltYCoord.toFixed(2)
                        color: "#b6d9fd"
                        leftPadding: 5
                        rightPadding: 5
                        font.pointSize: 9
                        anchors.left: boltYLabel.right
                        anchors.leftMargin: 10
                        readOnly: true
                        anchors.verticalCenter: parent.verticalCenter
                        verticalAlignment: Text.AlignVCenter
                        font.hintingPreference: Font.PreferDefaultHinting
                        selectByMouse: true
                        clip: true
                       selectionColor: "#4f5051"
                    }

                    Label {
                        id: boltZLabel
                        text: "Z:"
                        color: "#122F4B" 
                        font.pointSize: 9
                        anchors {
                            left: boltYCoordInput.right
                            leftMargin: 5
                            verticalCenter: parent.verticalCenter
                        }
                        verticalAlignment: Text.AlignVCenter
                        renderType: Text.QtRendering    
                    }

                    TextInput{
                        id: boltZCoordInput
                        width: 65
                        height: 25
                        text: boltZCoord.toFixed(2)
                        color: "#b6d9fd"
                        leftPadding: 5
                        rightPadding: 5
                        font.pointSize: 9
                        anchors.left: boltZLabel.right
                        anchors.leftMargin: 10
                        readOnly: true
                        anchors.verticalCenter: parent.verticalCenter
                        verticalAlignment: Text.AlignVCenter
                        font.hintingPreference: Font.PreferDefaultHinting
                        selectByMouse: true
                        clip: true
                       selectionColor: "#4f5051"

                    }


                    Rectangle {
                        id: seperatorRectangle
                        width: 2
                        color: "#b6d9fd" 
                        anchors{
                            top:parent.top
                            topMargin: 5
                            bottom: parent.bottom
                            bottomMargin: 5
                            left: boltZCoordInput.right
                            rightMargin: 3
                        }
                    }


                    Label {
                        id: boltKxLabel
                        text: "Kx:"
                        color: "#122F4B" 
                        font.pointSize: 9
                        anchors {
                            left: seperatorRectangle.right
                            leftMargin: 50
                            verticalCenter: parent.verticalCenter
                        }
                        verticalAlignment: Text.AlignVCenter
                        renderType: Text.QtRendering    
                    }

                    TextInput{
                        id: boltKxInput
                        width: 35
                        height: 25
                        text: boltKx.toFixed(1)
                        color: "#b6d9fd"
                        leftPadding: 5
                        rightPadding: 5
                        font.pointSize: 9
                        anchors.left: boltKxLabel.right
                        anchors.leftMargin: 5
                        readOnly: true
                        anchors.verticalCenter: parent.verticalCenter
                        verticalAlignment: Text.AlignVCenter
                        font.hintingPreference: Font.PreferDefaultHinting
                        selectByMouse: true
                        clip: true
                       selectionColor: "#4f5051"
                    }


                    Label {
                        id: boltKyLabel
                        text: "Ky:"
                        color: "#122F4B" 
                        font.pointSize: 9
                        anchors {
                            left: boltKxInput.right
                            leftMargin: 10
                            verticalCenter: parent.verticalCenter
                        }
                        verticalAlignment: Text.AlignVCenter
                        renderType: Text.QtRendering    
                    }

                    TextInput{
                        id: boltKyInput
                        width: 35
                        height: 25
                        text: boltKy.toFixed(1)
                        color: "#b6d9fd"
                        leftPadding: 5
                        rightPadding: 5
                        font.pointSize: 9
                        anchors.left: boltKyLabel.right
                        anchors.leftMargin: 5
                        readOnly: true
                        anchors.verticalCenter: parent.verticalCenter
                        verticalAlignment: Text.AlignVCenter
                        font.hintingPreference: Font.PreferDefaultHinting
                        selectByMouse: true
                        clip: true
                        selectionColor: "#4f5051"
                    }

                    Label {
                        id: boltKzLabel
                        text: "Kz:"
                        color: "#122F4B" 
                        font.pointSize: 9
                        anchors {
                            left: boltKyInput.right
                            leftMargin: 10
                            verticalCenter: parent.verticalCenter
                        }
                        verticalAlignment: Text.AlignVCenter
                        renderType: Text.QtRendering    
                    }

                    TextInput{
                        id: boltKzInput
                        width: 35
                        height: 25
                        text: boltKz.toFixed(1)
                        color: "#b6d9fd"
                        leftPadding: 5
                        rightPadding: 5
                        font.pointSize: 9
                        anchors.left: boltKzLabel.right
                        anchors.leftMargin: 5
                        readOnly: true
                        anchors.verticalCenter: parent.verticalCenter
                        verticalAlignment: Text.AlignVCenter
                        font.hintingPreference: Font.PreferDefaultHinting
                        selectByMouse: true
                        clip: true
                        selectionColor: "#4f5051"
                    }
                }
            }
        }
    }
}