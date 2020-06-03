import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

import SortFilter 1.0

Window {
    id: rootId
    width: 320
    height: 568
    visible: true

    SortFilterProxy {
        id: sortFilterProxyModelId
        sourceModel: fruitModel
        sortRole: Qt.DisplayRole
        searchString: ""
        sortOrder: Qt.AscendingOrder
    }

    ListModel {
        id: fruitModel
        ListElement { name: "Apple" }
        ListElement { name: "Orange" }
        ListElement { name: "Banana" }
    }

    Column {
        anchors.fill: parent

        TextField {
            id: searchIpId
            height: 40
            width: parent.width
            focus: true
            placeholderText: "Enter search text"
            onTextChanged: sortFilterProxyModelId.searchString = text

            Button {
                id: sortButtonId
                height: parent.height - 10
                width: 60
                text: "sort"
                anchors.rightMargin: 10
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    // call proxy
                    if(sortFilterProxyModelId.sortOrder === Qt.AscendingOrder)
                        sortFilterProxyModelId.sortOrder = Qt.DescendingOrder
                    else
                        sortFilterProxyModelId.sortOrder = Qt.AscendingOrder
                    searchIpId.forceActiveFocus()
                }
            }
        }

        ListView {
            width: parent.width
            height: parent.height - searchIpId.height
            model: sortFilterProxyModelId // change to proxy output
            delegate: Rectangle {
                width: parent.width
                height: 40
                color: index % 2 == 0 ? "white" : "#C0C0C0"
                Label {
                    anchors.fill: parent
                    anchors.margins: 10
                    text: name
                }
            }
        }
    }
}
