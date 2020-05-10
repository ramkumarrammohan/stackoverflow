import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    visible: true
    width: 640
    height: 480

    Column {
        spacing: 0
        anchors.fill: parent
        Item {
            width: parent.width
            height: parent.height * 0.4
            Image {
                anchors.fill: parent
                anchors.margins: 10
                source: "https://lh4.googleusercontent.com/proxy/cITVCAj9KJ5Hfwd5iuNDhzdB2pSrMQv2rzTl-vvg23he2qdCisZBG-MzV35y_r2zijC9X4QOpda9eHzr_hA"
            }
        }
        ListView {
            id: listviewId
            width: parent.width
            height: parent.height * 0.6
            model: 10
            spacing: 5
            clip: true
            highlightRangeMode: ListView.StrictlyEnforceRange // NOTE: property that solved the issue

            delegate: Rectangle {
                id: delegateId
                width: parent.width
                height: 50
                color: index % 2 == 0 ? "lightsteelblue" : "steelblue"
                Row {
                    spacing: 25
                    anchors.centerIn: parent
                    Label {
                        text: qsTr("%1").arg(index)
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    ComboBox {
                        anchors.verticalCenter: parent.verticalCenter
                        model: ["a", "b", "c"]
                    }
                }
            }
        }
    }
}
