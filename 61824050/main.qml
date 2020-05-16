import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id: window
    width: 400
    height: 500
    visible: true

    ListView {
        id: blocsListView
        anchors.fill: parent
        model: BlocModel {}
        delegate: BlocDelegate {}
    }
}
