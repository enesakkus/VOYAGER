import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "buttons"
import "addBoltGroupSection"
import "addLoadSection"

Rectangle {
    id: boltGroupPageBaseRectangle

    objectName: "bolt_group_base_object"

    property QtObject boltGroupBackend

    anchors.fill: parent
    color: "#0f263d"

    AddBoltGroupSection{
        id: addBoltGroupSection
    }

    AddLoadSection {
        id: addLoadSection
    }
    

    Connections {
        target: boltGroupBackend

        function onPrintToStatusBar(stringText){
            appContainer.statusBarMessage = stringText
        }
    }

}