import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Item {
    id: baseItemOnMainPage

    //property url gridViewUrl: "mainPageGridView/MainPageGridView.qml"
    anchors.fill: parent
    StackView {
        id: mainPageStackView
        anchors.fill: parent
        initialItem: "mainPageGridView/MainPageGridView.qml"
    }
}