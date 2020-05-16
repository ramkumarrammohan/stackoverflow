import QtQuick 2.9
import QtQuick.Controls 2.2

Column {
    width: parent.width

    Repeater {
        model: blocs
        delegate: Rectangle {
            height: 40
            width: parent.width
            color: rectcolor
        }
    }
}
