import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../buttons"

Component {
    id: boltListElementDelegate

    Rectangle{
        id: listElementBaseRectangle

        property string parentsIndex: model.index

        color: "#2869A8"
        height: 25
        border.color: "#6e95bc"
        border.width: 1
        radius: 9
        anchors {
            left: boltListView.contentItem.left
            leftMargin: 10
            right: boltListView.contentItem.right
            rightMargin: 15
        }

        Rectangle{
            id: idRectangle
            height: 25
            width: 100
            // color: "#12C56A"
            gradient: Gradient {
                GradientStop {
                    position: 0.0; color: "#12C56A"
                }
                GradientStop {
                    position: 0.5; color: "#12C56A"
                }
                GradientStop {
                    position: 1.0; color: "#00000000"
                }
                orientation: Gradient.Horizontal
            }
            radius: 9
            anchors{
                left: parent.left
                // leftMargin: 15
                verticalCenter: listElementBaseRectangle.verticalCenter
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
            anchors.left: parent.left
            anchors.leftMargin: 35
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            font.hintingPreference: Font.PreferDefaultHinting
            selectByMouse: true
            clip: true
            // onFocusChanged: console.log("Focus Changed")
            // Component.onCompleted: boltGroupInputWindowContainer.boltGroupNameTextInputAccessible = boltGroupNameTextInput
            selectionColor: "#4f5051"
            validator: RegExpValidator {
                regExp: /([0-9])?[0-9]+/
            }
            maximumLength: 4
            onEditingFinished: {
                boltGroupPageBaseRectangle.boltGroupBackend.boltModel.editBoltParameters(parentsIndex,
                                                                                        "boltIdNumber", boltGroupNameTextInput.text)
            }
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
            // horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            renderType: Text.QtRendering
        }

        TextInput{
            id: boltXCoordInput
            width: 65
            height: 25
            text: boltXCoord.toFixed(2)
            color: "#abcdf2"
            leftPadding: 5
            rightPadding: 5
            font.pointSize: 9
            anchors.left: boltXLabel.right
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            font.hintingPreference: Font.PreferDefaultHinting
            selectByMouse: true
            clip: true
            // onFocusChanged: console.log("Focus Changed")
            // Component.onCompleted: boltGroupInputWindowContainer.boltGroupNameTextInputAccessible = boltGroupNameTextInput
            selectionColor: "#4f5051"
            validator: RegExpValidator {
                regExp: /[+-]?([0-9]*[.])?[0-9]+/
            }
            maximumLength: 10
            onEditingFinished: {
                boltGroupPageBaseRectangle.boltGroupBackend.boltModel.editBoltParameters(parentsIndex,
                                                                                        "boltXCoord", boltXCoordInput.text)
            }
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
            // horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            renderType: Text.QtRendering
        }

        TextInput{
            id: boltYCoordInput
            width: 65
            height: 25
            text: boltYCoord.toFixed(2)
            color: "#abcdf2"
            leftPadding: 5
            rightPadding: 5
            font.pointSize: 9
            anchors.left: boltYLabel.right
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            font.hintingPreference: Font.PreferDefaultHinting
            selectByMouse: true
            clip: true
            // onFocusChanged: console.log("Focus Changed")
            // Component.onCompleted: boltGroupInputWindowContainer.boltGroupNameTextInputAccessible = boltGroupNameTextInput
            selectionColor: "#4f5051"
            validator: RegExpValidator {
                regExp: /[+-]?([0-9]*[.])?[0-9]+/
            }
            maximumLength: 10
            onEditingFinished: {
                boltGroupPageBaseRectangle.boltGroupBackend.boltModel.editBoltParameters(parentsIndex,
                                                                                        "boltYCoord", boltYCoordInput.text)
            }
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
            // horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            renderType: Text.QtRendering
        }

        TextInput{
            id: boltZCoordInput
            width: 65
            height: 25
            text: boltZCoord.toFixed(2)
            color: "#abcdf2"
            leftPadding: 5
            rightPadding: 5
            font.pointSize: 9
            anchors.left: boltZLabel.right
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            font.hintingPreference: Font.PreferDefaultHinting
            selectByMouse: true
            clip: true
            // onFocusChanged: console.log("Focus Changed")
            // Component.onCompleted: boltGroupInputWindowContainer.boltGroupNameTextInputAccessible = boltGroupNameTextInput
            selectionColor: "#4f5051"
            validator: RegExpValidator {
                regExp: /[+-]?([0-9]*[.])?[0-9]+/
            }
            maximumLength: 10
            onEditingFinished: {
                boltGroupPageBaseRectangle.boltGroupBackend.boltModel.editBoltParameters(parentsIndex,
                                                                                        "boltZCoord", boltZCoordInput.text)
            }
        }


        Rectangle {
            id: seperatorRectangle
            width: 2
            color: "#6e95bc"
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
            // horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            renderType: Text.QtRendering
        }

        TextInput{
            id: boltKxInput
            width: 35
            height: 25
            text: boltKx.toFixed(1)
            color: "#abcdf2"
            leftPadding: 5
            rightPadding: 5
            font.pointSize: 9
            anchors.left: boltKxLabel.right
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            font.hintingPreference: Font.PreferDefaultHinting
            selectByMouse: true
            clip: true
            // onFocusChanged: console.log("Focus Changed")
            // Component.onCompleted: boltGroupInputWindowContainer.boltGroupNameTextInputAccessible = boltGroupNameTextInput
            selectionColor: "#4f5051"
            validator: RegExpValidator {
                regExp: /[+-]?([0-9]*[.])?[0-9]+/
            }
            maximumLength: 10
            onEditingFinished: {
                boltGroupPageBaseRectangle.boltGroupBackend.boltModel.editBoltParameters(parentsIndex,
                                                                                        "boltKx", boltKxInput.text)
            }
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
            // horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            renderType: Text.QtRendering
        }

        TextInput{
            id: boltKyInput
            width: 35
            height: 25
            text: boltKy.toFixed(1)
            color: "#abcdf2"
            leftPadding: 5
            rightPadding: 5
            font.pointSize: 9
            anchors.left: boltKyLabel.right
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            font.hintingPreference: Font.PreferDefaultHinting
            selectByMouse: true
            clip: true
            // onFocusChanged: console.log("Focus Changed")
            // Component.onCompleted: boltGroupInputWindowContainer.boltGroupNameTextInputAccessible = boltGroupNameTextInput
            selectionColor: "#4f5051"
            validator: RegExpValidator {
                regExp: /[+-]?([0-9]*[.])?[0-9]+/
            }
            maximumLength: 10
            onEditingFinished: {
                boltGroupPageBaseRectangle.boltGroupBackend.boltModel.editBoltParameters(parentsIndex,
                                                                                        "boltKy", boltKyInput.text)
            }
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
            // horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            renderType: Text.QtRendering
        }

        TextInput{
            id: boltKzInput
            width: 35
            height: 25
            text: boltKz.toFixed(1)
            color: "#abcdf2"
            leftPadding: 5
            rightPadding: 5
            font.pointSize: 9
            anchors.left: boltKzLabel.right
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            font.hintingPreference: Font.PreferDefaultHinting
            selectByMouse: true
            clip: true
            // onFocusChanged: console.log("Focus Changed")
            // Component.onCompleted: boltGroupInputWindowContainer.boltGroupNameTextInputAccessible = boltGroupNameTextInput
            selectionColor: "#4f5051"
            validator: RegExpValidator {
                regExp: /([0-9]*[.])?[0-9]+/
            }
            maximumLength: 10
            onEditingFinished: {
                boltGroupPageBaseRectangle.boltGroupBackend.boltModel.editBoltParameters(parentsIndex,
                                                                                        "boltKz", boltKzInput.text)
            }
        }


        BoltGroupToolDeleteBtn {
            id: deleteBolt
            width: 20
            height: 20
            anchors {
                right: parent.right
                rightMargin: 15
                verticalCenter: parent.verticalCenter
                // horizontalCenter: parent.horizontalCenter
            }
            property url boltGroupToolAddNewImage: "../../../../images/BoltGroupToolImages/delete.svg"

            onClicked: {
                boltGroupPageBaseRectangle.boltGroupBackend.boltModel.deleteBolt(model.index)
            }
        }

    }
}
