import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../buttons"

Component {
    id: hdf5LoadListElementDelegate

    Column {
        id: hdf5LoadListElementDelegateColumn

        width: hdf5LoadListView.width

        Rectangle{
            id: listElementBaseRectangle
            color: "#2869A8"
            height: 25
            border.color: "#6e95bc"
            border.width: 1
            radius: 9
            anchors {
                left: parent.left
                leftMargin: 10
                right: parent.right
                rightMargin: 15
            }
            Rectangle{
                id: idRectangle
                height: parent.height
                width: 100
                gradient: Gradient {
                    GradientStop {
                        position: 0.0; color: "#f7ad19"
                    }
                    GradientStop {
                        position: 0.5; color: "#f7ad19"
                    }
                    GradientStop {
                        position: 1.0; color: "#00000000"
                    }
                    orientation: Gradient.Horizontal
                }
                radius: 9
                anchors{
                    left: parent.left
                    verticalCenter: listElementBaseRectangle.verticalCenter
                }

                Image {
                    id: boltIcon
                    source: "../../../../images/BoltGroupToolImages/arrow.svg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: 50
                    sourceSize.height: 50
                    width: 25
                    height: 25
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.left
                        leftMargin: 5
                    }
                }
                ColorOverlay {
                    id: boltIconColorOverlay
                    width: 25
                    height: 25
                    anchors.fill: boltIcon
                    source: boltIcon
                    color: "#122F4B"
                    antialiasing: false
                }
            }
            TextInput{
                id: loadIdTextInput
                width: 50
                height: 25
                text: "1"
                color: "#122F4B"
                leftPadding: 5
                rightPadding: 5
                font.pointSize: 10
                anchors.left: parent.left
                anchors.leftMargin: 45
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                font.hintingPreference: Font.PreferDefaultHinting
                selectByMouse: true
                clip: true
                selectionColor: "#4f5051"
                validator: RegExpValidator {
                    regExp: /([0-9])?[0-9]+/
                }
                maximumLength: 4
            }

            Label {
                id: loadXLabel
                text: "X:"
                color: "#122F4B"
                font.pointSize: 9
                anchors {
                    left: loadIdTextInput.right
                    leftMargin: 25
                    verticalCenter: parent.verticalCenter
                }
                verticalAlignment: Text.AlignVCenter
                renderType: Text.QtRendering
            }

            TextInput{
                id: loadXCoordInput
                width: 65
                height: 25
                text: "0.00"
                color: "#abcdf2"
                leftPadding: 5
                rightPadding: 5
                font.pointSize: 9
                anchors.left: loadXLabel.right
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                font.hintingPreference: Font.PreferDefaultHinting
                selectByMouse: true
                clip: true
                selectionColor: "#4f5051"
                validator: RegExpValidator {
                    regExp: /[+-]?([0-9]*[.])?[0-9]+/
                }
                maximumLength: 10
            }


            Label {
                id: loadYLabel
                text: "Y:"
                color: "#122F4B"
                font.pointSize: 9
                anchors {
                    left : loadXCoordInput.right
                    leftMargin: 5
                    verticalCenter: parent.verticalCenter
                }
                verticalAlignment: Text.AlignVCenter
                renderType: Text.QtRendering
            }

            TextInput{
                id: loadYCoordInput
                width: 65
                height: 25
                text: "0.00"
                color: "#abcdf2"
                leftPadding: 5
                rightPadding: 5
                font.pointSize: 9
                anchors.left: loadYLabel.right
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                font.hintingPreference: Font.PreferDefaultHinting
                selectByMouse: true
                clip: true
                selectionColor: "#4f5051"
                validator: RegExpValidator {
                    regExp: /[+-]?([0-9]*[.])?[0-9]+/
                }
                maximumLength: 10
            }

            Label {
                id: loadZLabel
                text: "Z:"
                color: "#122F4B"
                font.pointSize: 9
                anchors {
                    left: loadYCoordInput.right
                    leftMargin: 5
                    verticalCenter: parent.verticalCenter
                }
                verticalAlignment: Text.AlignVCenter
                renderType: Text.QtRendering
            }

            TextInput{
                id: loadZCoordInput
                width: 65
                height: 25
                text: "0.00"
                color: "#abcdf2"
                leftPadding: 5
                rightPadding: 5
                font.pointSize: 9
                anchors.left: loadZLabel.right
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                font.hintingPreference: Font.PreferDefaultHinting
                selectByMouse: true
                clip: true
                selectionColor: "#4f5051"
                validator: RegExpValidator {
                    regExp: /[+-]?([0-9]*[.])?[0-9]+/
                }
                maximumLength: 10
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
                    left: loadZCoordInput.right
                    rightMargin: 3
                }
            }


            Label {
                id: loadXForceLabel
                text: "Fx:"
                color: "#122F4B"
                font.pointSize: 9
                anchors {
                    left: seperatorRectangle.right
                    leftMargin: 30
                    verticalCenter: parent.verticalCenter
                }
                verticalAlignment: Text.AlignVCenter
                renderType: Text.QtRendering
            }

            TextInput{
                id: loadFxInput
                width: 35
                height: 25
                text: "0.00"
                color: "#abcdf2"
                leftPadding: 5
                rightPadding: 5
                font.pointSize: 9
                anchors.left: loadXForceLabel.right
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                font.hintingPreference: Font.PreferDefaultHinting
                selectByMouse: true
                clip: true
                selectionColor: "#4f5051"
                validator: RegExpValidator {
                    regExp: /[+-]?([0-9]*[.])?[0-9]+/
                }
                maximumLength: 10
            }


            Label {
                id: loadYForceLabel
                text: "Fy:"
                color: "#122F4B"
                font.pointSize: 9
                anchors {
                    left: loadFxInput.right
                    leftMargin: 40
                    verticalCenter: parent.verticalCenter
                }
                verticalAlignment: Text.AlignVCenter
                renderType: Text.QtRendering
            }

            TextInput{
                id: loadFyInput
                width: 35
                height: 25
                text: "0.00"
                color: "#abcdf2"
                leftPadding: 5
                rightPadding: 5
                font.pointSize: 9
                anchors.left: loadYForceLabel.right
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                font.hintingPreference: Font.PreferDefaultHinting
                selectByMouse: true
                clip: true
                selectionColor: "#4f5051"
                validator: RegExpValidator {
                    regExp: /[+-]?([0-9]*[.])?[0-9]+/
                }
                maximumLength: 10
            }

            Label {
                id: loadZForceLabel
                text: "Fz:"
                color: "#122F4B"
                font.pointSize: 9
                anchors {
                    left: loadFyInput.right
                    leftMargin: 40
                    verticalCenter: parent.verticalCenter
                }
                verticalAlignment: Text.AlignVCenter
                renderType: Text.QtRendering
            }

            TextInput{
                id: loadFzInput
                width: 35
                height: 25
                text: "0.00"
                color: "#abcdf2"
                leftPadding: 5
                rightPadding: 5
                font.pointSize: 9
                anchors.left: loadZForceLabel.right
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                font.hintingPreference: Font.PreferDefaultHinting
                selectByMouse: true
                clip: true
                selectionColor: "#4f5051"
                validator: RegExpValidator {
                    regExp: /([0-9]*[.])?[0-9]+/
                }
                maximumLength: 10
            }
        }
    }
}