import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../buttons"
import Qt.labs.qmlmodels 1.0

Item {
    TableModel {
        id: tableModelDummyModel
        TableModelColumn { display: "name" }
        TableModelColumn { display: "color" }

        rows: [{"name": "cat", "color": "black"},
                {"name": "dog", "color": "brown"},
                {"name": "bird", "color": "white"},
                {"name": "bird", "color": "white"},
                {"name": "bird", "color": "white"},
                {"name": "bird", "color": "white"},
                {"name": "bird", "color": "white"},
                {"name": "bird", "color": "white"}]
    }


    TableView {
        id: directLoadTableView
        anchors.fill: parent
        columnSpacing: 1
        rowSpacing: 1
        clip: true
        model: tableModelDummyModel

        delegate: Rectangle {
            implicitWidth: 100
            implicitHeight: 50
            border.width: 1

            Text {
                text: display
                anchors.centerIn: parent
            }
        }
    }
}