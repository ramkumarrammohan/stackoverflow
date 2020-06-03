import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

ApplicationWindow {
    id: applicationWindow
    visible: true;
    width: 640
    height: 480

    ComboBox {
        id: comboboxId
        width: parent.width / 2
        height: 50
        model: ListModel {
            ListElement { name: "One"; fill: "red"; ischecked: true }
            ListElement { name: "Two"; fill: "green"; ischecked: false }
            ListElement { name: "Three"; fill: "blue"; ischecked: false }
        }
        delegate: Item {
            width: parent.width
            height: 50
            Row {
                spacing: 5
                anchors.fill: parent
                anchors.margins: 5
                CheckBox {
                    id: checkboxId
                    height: parent.height
                    width: height
                    onPressed: checked = !checked
                    onCheckedChanged: {
                        if(checked)
                        {
                            listmodelId.append({ "name": name, "fill": fill })
                        }
                    }
                }
                Label {
                    text: name
                    width: parent.width - checkboxId.width
                    height: parent.height
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                }
            }
        }
    }

    ListModel {
        id: listmodelId
    }

    ListView {
        width: parent.width / 2
        height: parent.height
        anchors.left: comboboxId.right
        model: listmodelId
        delegate: Item {
            height: 50
            width: parent.width
            Rectangle {
                anchors.fill: parent
                color: fill
                Text {
                    anchors.centerIn: parent
                    text: name
                }
            }
        }
        onCountChanged: console.log(count)
    }
}
