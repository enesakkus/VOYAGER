import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../buttons"
    
//~~Bolt Group Section~~//
//////////////////////////
Rectangle {
    id: boltGroupSectionRectangle
    color: "#122F4B"
    height: (parent.height - 250) / 2
    radius: 10
    z:1
    anchors {
        top: addLoadSection.bottom
        topMargin: 25
        left: parent.left
        leftMargin: 15
        right: parent.right
        rightMargin: 15
    }
    Label {
        height: 10
        width: 10
        text: "BOLT GROUPS"
        font.pointSize: 11
        color: "#d3e6f3"
        anchors {
            left: boltGroupSectionRectangle.left
            leftMargin: 12
            top: boltGroupSectionRectangle.top
            topMargin: 8
        }
    }
    //~~Bolt Group Add New Bolt Group Button~~//
    ////////////////////////////////////////////
    BoltGroupToolAddNewBtn {
        id: addNewBoltGroupBtn
        property url boltGroupToolAddNewImage: "../../../../images/BoltGroupToolImages/add_new.svg"
        anchors {
            right: parent.right
            rightMargin: 25
            top: parent.top
            topMargin: 5
        }
        //~~Load Bolt Group Input Window~~//
        ////////////////////////////////////
        Loader {
            id: boltGroupInputWindowLoader
            active: false
            source: "BoltGroupInputWindow.qml"
            // Component.onCompleted: boltGroupInputPopUpLoaderAccessible = boltGroupInputWindowLoader
        }
        onClicked: boltGroupInputWindowLoader.active = true
    }
    //~~Bolt Group Section Bolt Group List View Rectangle~~//
    /////////////////////////////////////////////////////////
    Rectangle {
        id: boltGroupListViewBaseRectangle
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
        BoltGroupListView{
            id: boltGroupListView
        }
    }
    //~~Bolt Group Section Rectangle Shadow~~//
    ///////////////////////////////////////////
    Rectangle {
    id: boltGroupSectionRectangleShadow
    color: "#3282D0"
    radius: 11
    height: 50
    z: -1
    anchors {
        top: boltGroupSectionRectangle.top
        topMargin: -2
        left: boltGroupSectionRectangle.left
        leftMargin: 1
        right: boltGroupSectionRectangle.right
        rightMargin: 1
        }
    }
}
