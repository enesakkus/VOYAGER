import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: hdf5LoadListViewRoot
    anchors.fill: parent

    ListModel {
        id: hdf5LoadListModel
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
        id: hdf5LoadListView
        anchors.fill: parent
        anchors.topMargin: 15
        anchors.bottomMargin: 15
        model: boltGroupPageBaseRectangle.boltGroupBackend.hdf5LoadModel
        // model: hdf5LoadListModel
        delegate: hdf5LoadListElement 
        spacing: 6
        clip: true
        ScrollBar.vertical: ScrollBar {
            active: true
        }
        // Component.onCompleted: solutionFilesSelectionSectionRectangle.solutionFileListViewAccessible = solutionFilesListView
        
    }

    Hdf5LoadListElement{
        id: hdf5LoadListElement
    }
}