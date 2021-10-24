import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Qt MVC")

    Component {
        id: componentCircleId
        Rectangle {
            border.color: "blue"
            border.width: 1
            height: value
            width: value
            radius: value/2
        }
    }
    Component {
        id: componentRectangleId
        Rectangle {
            border.color: "orange"
            border.width: 1
            height: value
            width: value
        }
    }

    Component {
        id: componentLoaderId
        Loader {
            property real value: val
            x: xpos
            y: ypos
            sourceComponent: type === "circle" ?
                                 componentCircleId : componentRectangleId
        }
    }

    ScrollView {
        id: scrollviewId
        anchors.fill: parent
        Repeater {
            anchors.fill: parent
            model: ShapeModel{}
            delegate: componentLoaderId
            onItemAdded: {
                // scroll area computation
                // Better solutions may be available
                if(item.x+item.width > scrollviewId.contentWidth)
                    scrollviewId.contentWidth = item.x+item.width
                if(item.y+item.height > scrollviewId.contentHeight)
                    scrollviewId.contentHeight = item.y+item.height
            }
        }
    }
}
