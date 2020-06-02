import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 640
    height: 480

    Item {
        anchors.fill: parent
        anchors.margins: 10

        TabView {
            anchors.fill: parent
            Tab {
                title: "TextField"

                Item {
                    anchors.fill: parent
                    Grid {
                        spacing: 20
                        anchors.fill: parent
                        anchors.margins: 10
                        Rectangle {
                            height: 40
                            width: 150
                            TextField {
                                id: inputId
                                anchors.fill: parent
                                placeholderText: "enter text"
                            }
                        }

                        Button {
                            height: 40
                            width: 150
                            text: "show txt"
                            onClicked: labelId.text = inputId.text
                        }

                        Rectangle {
                            height: 40
                            width: 150
                            Label {
                                id: labelId
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }
                }
            }
            Tab {
                title: "Repeater"

                Item {
                    anchors.fill: parent
                    Grid {
                        spacing: 20
                        anchors.fill: parent
                        anchors.margins: 10
                        columns: 3

                        ListModel {
                            id: fruitModel
                            ListElement { name: "Apple" }
                            ListElement { name: "Orange" }
                            ListElement { name: "Banana" }
                        }

                        Repeater {
                            width: parent.width
                            height: parent.height / 2
                            model: fruitModel
                            delegate: Rectangle {
                                height: 40
                                width: 150
                                TextField {
                                    anchors.fill: parent
                                    text: name
                                    onTextChanged: fruitModel.setProperty(index, "name", text) // update model data
                                }
                            }
                        }

                        Repeater {
                            width: parent.width
                            height: parent.height / 2
                            model: fruitModel
                            delegate: Rectangle {
                                height: 40
                                width: 150
                                Label {
                                    text: name
                                    anchors.fill: parent
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
