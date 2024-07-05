import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: boltInputApplyBtn

    property color btnDefaultColor: "#21568A"
    property color btnMouseOverColor: "#53A4F4"
    property color btnMouseClickedColor: "#1C4E83"


    QtObject{
        id: internalDeleteSolutionFile

        property var dynamicColor: if(boltInputApplyBtn.down){
                                        boltInputApplyBtn.down ? btnMouseClickedColor : btnDefaultColor
                                    }else{
                                        boltInputApplyBtn.hovered ? btnMouseOverColor : btnDefaultColor
                                    }

    }

    background: Rectangle {
        color: internalDeleteSolutionFile.dynamicColor
        anchors.fill: parent
        radius: 5

        Label {
            text: directLoadEntryBtnLabelText
            font.pointSize: 9
            anchors.fill: parent
            color: "#d3e6f3"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            renderType: Text.QtRendering    

        }
    }
}