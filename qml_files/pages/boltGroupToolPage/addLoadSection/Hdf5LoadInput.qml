import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../buttons"

Item {
    Rectangle {
        id: directLoadInputBaseRectangle
        anchors.fill: parent
        color: "#264360"
        radius: 8

        Hdf5LoadListView {
            id: hdf5LoadListView
        }
    }
}