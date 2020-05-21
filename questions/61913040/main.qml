import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

Window {
    visible: true
    width: 640
    height: 480

    Component {
        id: swipeviewComponentId
        Item {
            id: itemId
            Rectangle {
                id: rectangleId
                anchors.fill: parent
                anchors.margins: 10
                radius: 10
            }
            DropShadow {
                anchors.fill: source
                horizontalOffset: 3
                verticalOffset: 3
                radius: 8.0
                samples: 17
                color: "#80000000"
                source: rectangleId
            }
        }
    }

    Column {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        SwipeView {
            id: swipeViewId
            width: parent.width
            height: parent.height - addButtonId.height - (2 * parent.spacing) - pageIndicatorId.height
        }

        PageIndicator {
            id: pageIndicatorId
            currentIndex: swipeViewId.currentIndex
            count: swipeViewId.count
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            id: addButtonId
            width: parent.width
            height: 40
            text: "Add item"
            onClicked: {
                swipeViewId.addItem(swipeviewComponentId.createObject(swipeViewId,
                                                                      {height: swipeViewId.height, width: swipeViewId.width}))
                swipeViewId.incrementCurrentIndex()
            }
        }
    }
}
