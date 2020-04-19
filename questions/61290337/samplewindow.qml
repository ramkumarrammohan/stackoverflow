import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480

    MouseArea {
        anchors.fill: parent
        onClicked: backend.changeWindow()
    }

    Text {
        text: qsTr("sample window")
        anchors.centerIn: parent
    }
}
