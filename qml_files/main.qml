import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.2

Window {
    width: 1000
    height: 580
    visible: true
    color: "#00000000"
    title: qsTr("Voyager")

    //~~Background Rectange~~//
    ///////////////////////////
    Rectangle {
        id: background
        color: "#163758"
        border.color: "#19436c"
        border.width: 1
        anchors.fill: parent
    }

}