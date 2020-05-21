import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    visible: true
    width: 640
    height: 480

    // used here only to indicate image loading is going on
    BusyIndicator {
        id: busyindicatorId
        visible: backgroundImgId.status === Image.Loading ||
                 crossImgId.status === Image.Loading
        anchors.centerIn: parent
    }

    // background item
    ScrollView {
        anchors.fill: parent
        anchors.margins: 10
        clip: true
        visible: !busyindicatorId.visible
        Image {
            id: backgroundImgId
            source: "https://i.ibb.co/ZBNLvzb/andriod.jpg"
        }
    }

    // crosshair item
    Image {
        id:  crossImgId
        z: 1
        width: 100
        height: width
        visible: !busyindicatorId.visible
        source: "https://i.ibb.co/SJFTLwN/cross.png"
        anchors.centerIn: parent
    }
}
