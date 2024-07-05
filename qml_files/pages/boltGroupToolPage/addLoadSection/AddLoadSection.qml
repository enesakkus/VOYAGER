import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../buttons"

//~~Load Section~~//
////////////////////
Rectangle {
    id: loadSectionRectangle
    color: "#122F4B"
    height: (parent.height - 250) / 2
    radius: 10
    z:1
    anchors {
        top: parent.top
        topMargin: 25
        left: parent.left
        leftMargin: 15
        right: parent.right
        rightMargin: 15
    }
    Label {
        height: 10
        width: 10
        text: "LOADS"
        font.pointSize: 11
        color: "#d3e6f3"
        anchors {
            left: loadSectionRectangle.left
            leftMargin: 12
            top: loadSectionRectangle.top
            topMargin: 8
        }
    }
    //~~Load Section Add Load Button~~//
    ////////////////////////////////////
    BoltGroupToolAddNewBtn {
        id: addNewLoadBtn
        property url boltGroupToolAddNewImage: "../../../../images/BoltGroupToolImages/add_new.svg"
        anchors {
            right: parent.right
            rightMargin: 25
            top: parent.top
            topMargin: 5
        }
        //~~Load Load Input Window~~//
        ////////////////////////////////////
        Loader {
            id: loadInputWindowLoader
            active: false
            source: "LoadInputWindow.qml"
            // Component.onCompleted: boltGroupInputPopUpLoaderAccessible = boltGroupInputWindowLoader
        }
        onClicked: loadInputWindowLoader.active = true
    }
    //~~Loads Section Load List View Rectangle~~//
    //////////////////////////////////////////////
    Rectangle {
        id: loadListViewBaseRectangle
        color: "#264360"
        radius: 8
        clip: true
        anchors {
            left: parent.left
            leftMargin: 10
            right: parent.right
            rightMargin: 10
            top: parent.top
            topMargin: 40
            bottom: parent.bottom
            bottomMargin: 10
        }
        // BoltGroupListView{
        //     id: boltGroupListView
        // }
    }
    //~~Bolt Group Section Rectangle Shadow~~//
    ///////////////////////////////////////////
    Rectangle {
    id: loadSectionRectangleShadow
    color: "#3282D0"
    radius: 11
    height: 50
    z: -1
    anchors {
        top: loadSectionRectangle.top
        topMargin: -2
        left: loadSectionRectangle.left
        leftMargin: 1
        right: loadSectionRectangle.right
        rightMargin: 1
        }
    }
}
