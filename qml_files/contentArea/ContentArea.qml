import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../buttons/leftMenu"

Rectangle {
    id: contentAreaRectangle
    property url mainPageUrl: "../pages/mainPage/MainPage.qml"
    property url boltGroupPageUrl: "../pages/boltGroupToolPage/BoltGroupToolPageMain.qml"
    
    color: "#0f263d"
    anchors {
        top: navigationInfoBarInMain.bottom
        bottom: parent.bottom
        left: leftMenuBarExpandableInMain.right
        right: parent.right
    }

    Loader {
        id: mainPageLoader
        anchors.fill: parent
        source: mainPageUrl
        visible: contentRectangle.isMainPageVisible
    }

    Loader {
        id: boltGroupToolPageLoader
        anchors.fill: parent
        source: boltGroupPageUrl
        visible: contentRectangle.isBoltGroupToolPageVisible
    }
}