import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: boltGroupListViewRoot
    anchors.fill: parent

    // ListModel {
    //     id: boltListModel
    //     ListElement {solutionFileId: "1"; name: "Solution 1"}
    //     ListElement {solutionFileId: "1"; name: "Solution 1"}
    //     ListElement {solutionFileId: "1"; name: "Solution 1"}
    //     ListElement {solutionFileId: "1"; name: "Solution 1"}
    //     ListElement {solutionFileId: "1"; name: "Solution 1"}
    //     ListElement {solutionFileId: "1"; name: "Solution 1"}
    //     ListElement {solutionFileId: "1"; name: "Solution 1"}
    //     ListElement {solutionFileId: "1"; name: "Solution 1"}
    //     ListElement {solutionFileId: "1"; name: "Solution 1"}
    // }

    ListView {
        id: boltGroupListView
        anchors.fill: parent
        anchors.topMargin: 15
        anchors.bottomMargin: 15
        model: boltGroupPageBaseRectangle.boltGroupBackend.boltGroupModel
        delegate: boltGroupListElement 
        spacing: 6
        clip: true
        ScrollBar.vertical: ScrollBar {
            active: true
        }
        // Component.onCompleted: solutionFilesSelectionSectionRectangle.solutionFileListViewAccessible = solutionFilesListView
        
    }

    BoltGroupListElement{
        id: boltGroupListElement
    }

    BoltGroupExpandable{
        id: boltGroupExpandable
    }
}