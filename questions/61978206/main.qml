import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    id: window
    width: 640
    height: 480
    visible: true

    Drawer {
        id: drawer
        width: 0.4 * window.width
        height: window.height
        closePolicy: Popup.NoAutoClose
        modal: false
    }

    Button {
        text: drawer.visible ? "close" : "open"
        anchors.centerIn: parent
        onClicked: {
            drawer.visible = !drawer.visible
        }
    }
}
