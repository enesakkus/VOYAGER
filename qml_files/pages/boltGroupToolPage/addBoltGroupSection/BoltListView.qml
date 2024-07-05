import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: boltListViewRoot
    anchors.fill: parent

    // ListModel {
    //     id: boltListModel
    //     // ListElement {solutionFileId: "1"; name: "Solution 1"}
    //     // ListElement {solutionFileId: "1"; name: "Solution 1"}
    //     // ListElement {solutionFileId: "1"; name: "Solution 1"}
    //     // ListElement {solutionFileId: "1"; name: "Solution 1"}
    //     // ListElement {solutionFileId: "1"; name: "Solution 1"}
    //     // ListElement {solutionFileId: "1"; name: "Solution 1"}
    //     // ListElement {solutionFileId: "1"; name: "Solution 1"}
    //     // ListElement {solutionFileId: "1"; name: "Solution 1"}
    //     // ListElement {solutionFileId: "1"; name: "Solution 1"}
    // }

    ListView {
        id: boltListView
        anchors.fill: parent
        anchors.topMargin: 15
        anchors.bottomMargin: 15
        model: boltGroupPageBaseRectangle.boltGroupBackend.boltModel
        // model: boltListModel
        delegate: boltListElement 
        spacing: 6
        clip: true
        ScrollBar.vertical: ScrollBar {
            active: true
        }
        // Component.onCompleted: solutionFilesSelectionSectionRectangle.solutionFileListViewAccessible = solutionFilesListView
        
    }

    BoltListElement{
        id: boltListElement
    }


    // EditInputsWindow {
    //     id: editInputsWindow
    // }
}