import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: directLoadListViewRoot
    anchors.fill: parent

    ListModel {
        id: directLoadListModel
        ListElement {solutionFileId: "1"; name: "Solution 1"}
        ListElement {solutionFileId: "1"; name: "Solution 1"}
        ListElement {solutionFileId: "1"; name: "Solution 1"}
        ListElement {solutionFileId: "1"; name: "Solution 1"}
        ListElement {solutionFileId: "1"; name: "Solution 1"}
        ListElement {solutionFileId: "1"; name: "Solution 1"}
        ListElement {solutionFileId: "1"; name: "Solution 1"}
        ListElement {solutionFileId: "1"; name: "Solution 1"}
        ListElement {solutionFileId: "1"; name: "Solution 1"}
    }

    ListView {
        id: directLoadListView
        anchors.fill: parent
        anchors.topMargin: 15
        anchors.bottomMargin: 15
        model: boltGroupPageBaseRectangle.boltGroupBackend.directLoadModel
        // model: directLoadListModel
        delegate: directLoadListElement 
        spacing: 6
        clip: true
        ScrollBar.vertical: ScrollBar {
            active: true
        }
        // Component.onCompleted: solutionFilesSelectionSectionRectangle.solutionFileListViewAccessible = solutionFilesListView
        
    }

    DirectLoadListElement{
        id: directLoadListElement
    }
}