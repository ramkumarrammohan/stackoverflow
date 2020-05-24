import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

Window {
    id: window
    visible: true
    minimumWidth: 380
    minimumHeight: 400
    width: 800
    height: 650
    title: qsTr("")
    color: "#00000000"

    Rectangle {
        id: sideBarParent
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        width: 260

        property bool closed: true
        state: "open"
        clip: true

        states: [
            State {
                name: "closed"
                PropertyChanges {
                    target: sideBarParent;
                    width: 80
                }
                PropertyChanges {
                    target: searchParent
                    anchors.rightMargin: 8

                }
                PropertyChanges {
                    target: addParent
                    opacity: 0
                }
                PropertyChanges {
                    target: addText
                    color: "#00000000"
                }

            },

            State {
                name: "open"
                PropertyChanges {
                    target: sideBarParent;
                    width: 250
                }
                PropertyChanges {
                    target: addParent
                    opacity: 1

                }
                PropertyChanges {
                    target: addParent
                    opacity: 1

                }
                PropertyChanges {
                    target: addText
                    color: "#000000"
                }


            }
        ]

        transitions: Transition {
            PropertyAnimation {
                property: "width";
                easing.type: Easing.InOutQuad
            }

            PropertyAnimation {
                property: "opacity";
                easing.type: Easing.InOutQuad
            }

            PropertyAnimation {
                property: "anchors.leftMargin";
                easing.type: Easing.InOutQuad
            }
        }

        Item {
            height: parent.height
            width: transparentContainer.width
            Image {
                id: transparentContainer
                height: parent.height
                fillMode: Image.PreserveAspectCrop
                source: "imgs/sideback.jpeg"
                smooth: true
            }
            FastBlur {
                anchors.fill: transparentContainer
                source: transparentContainer
                radius: 8
            }
        }

        Item {
            id: sideBarContent
            anchors.fill: parent

            Item {
                id: humburgerMenuContainer
                width: 25
                height: 25
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 18

                Image {
                    y: 14
                    width: 25
                    height: 25
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    source: "imgs/menu.png"
                    anchors.topMargin: 8

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            sideBarParent.closed = !sideBarParent.closed;

                            if (sideBarParent.closed) {
                                sideBarParent.state = "closed"
                            } else {
                                sideBarParent.state = "open"
                            }
                        }
                    }
                }
            }

            Item {
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.topMargin: 25

                Item {
                    id: row
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 60


                    Item {
                        id: searchParent
                        width: 26
                        anchors.leftMargin: 8
                        anchors.rightMargin: 60
                        height: 35
                        anchors.margins: 8
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top

                        TextField {
                            id: searchTextField
                            text: ""
                            //                            font.kerning: false
                            renderType: Text.NativeRendering
                            placeholderText: "Search..."
                            //                            placeholderTextColor: "#CCCCCC"
                            anchors.fill: parent

                            background: Rectangle {
                                anchors.fill: parent
                                radius: 16
                                color: "#E9EDF2"

                            }
                        }
                    }


                    Rectangle {
                        id: addParent
                        anchors.top: searchParent.top
                        anchors.left: searchParent.right
                        anchors.right: parent.right
                        anchors.rightMargin: 12
                        anchors.leftMargin: 12
                        width: 35
                        height: 35
                        radius: 30
                        anchors.topMargin: 0
                        color: "#E9EDF2"

                        Text {
                            id: addText
                            color: "#cc0000"
                            text: qsTr("+")
                            anchors.rightMargin: 0
                            anchors.bottomMargin: 2
                            anchors.leftMargin: 0
                            anchors.topMargin: -2
                            font.pixelSize: 25
                            font.bold: false
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            anchors.fill: parent
                        }

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                console.log("Add pressed");
                            }
                        }
                    }
                }



                Item {
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 60
                    anchors.topMargin: 60
                    clip: true

                    ListView {
                        id: profileList
                        anchors.fill: parent
                        currentIndex: 0
                        model: [{}, {}, {}, {}, {}, {}]

                        delegate: Rectangle {
                            id: rectangle
                            radius: 0
                            border.width: 0
                            anchors.rightMargin: 0
                            anchors.leftMargin: 0
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.margins: 6
                            color: profileList.currentIndex === index ? "#80ffffff" : "#00ffffff"
                            height: 60

                            state: sideBarParent.state

                            transitions: Transition {
                                PropertyAnimation {
                                    property: "anchors.leftMargin";
                                    easing.type: Easing.InOutQuad
                                }
                                PropertyAnimation {
                                    property: "color";
                                    easing.type: Easing.InOutQuad
                                }
                            }

                            states: [
                                State {
                                    name: "closed"
                                    PropertyChanges {
                                        target: profilePicContainer
                                        anchors.leftMargin: 18
                                    }
                                    PropertyChanges {
                                        target: profileImage
                                        anchors.leftMargin: 18
                                    }
                                    PropertyChanges {
                                        target: profileName
                                        color: "#00000000"
                                    }
                                    PropertyChanges {
                                        target: lastMessage
                                        color: "#00000000"
                                    }
                                },

                                State {
                                    name: "open"
                                    PropertyChanges {
                                        target: profilePicContainer
                                        anchors.leftMargin: 8
                                    }
                                    PropertyChanges {
                                        target: profileImage
                                        anchors.leftMargin: 8
                                    }
                                    PropertyChanges {
                                        target: profileName
                                        color: "#ffffff"
                                    }
                                    PropertyChanges {
                                        target: lastMessage
                                        color: "#ffffff"
                                    }
                                }
                            ]

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    profileList.currentIndex = index;
                                }
                            }

                            Rectangle {
                                id: profilePicContainer
                                width: 45
                                height: 45
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                radius: 50
                            }

                            Image {
                                id: profileImage
                                source: "imgs/profilePic.png"
                                width: 45
                                height: 45
                                fillMode: Image.PreserveAspectCrop
                                layer.enabled: true
                                layer.effect: OpacityMask {
                                    maskSource: profilePicContainer
                                }
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                            }


                            Text {
                                id: profileName
                                anchors.top: parent.top
                                anchors.topMargin: 10
                                anchors.left: profilePicContainer.right
                                anchors.leftMargin: 10
                                text: "Hello there"
                                font.weight: Font.Bold
                                font.pixelSize: 16
                                color: "#ffffff"

                            }

                            Text {
                                id: lastMessage
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 12
                                anchors.left: profileName.left
                                anchors.leftMargin: 0
                                text: "Hello there"
                                font.pixelSize: 10
                                color: "#ffffff"

                            }
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        id: contentContainer
        color: "#ffffff"
        anchors.left: sideBarParent.right
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        Rectangle {
            id: headerContainer
            height: 60
            color: "#ffffff"
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            layer.enabled: true
            layer.effect: DropShadow {
                id: dropShadow
                anchors.fill: parent
                color: "#000000"
                horizontalOffset: 0
                verticalOffset: -1
                samples: 16
                cached: true
                source: headerContainer
            }

            Text {
                id: element
                text: qsTr("Hello there")
                font.weight: Font.Medium
                fontSizeMode: Text.FixedSize
                verticalAlignment: Text.AlignVCenter
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 25
                font.pixelSize: 18
            }

            Image {
                id: videoCall
                x: 458
                width: 60
                anchors.top: parent.top
                anchors.topMargin: 15
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 15
                anchors.right: parent.right
                anchors.rightMargin: 5
                source: "imgs/camera-de-video.png"
                fillMode: Image.PreserveAspectFit

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                }
            }

            Image {
                id: audioCall
                x: 430
                y: 0
                width: 60
                anchors.bottomMargin: 17
                anchors.top: parent.top
                anchors.rightMargin: 5
                anchors.bottom: parent.bottom
                source: "imgs/ligar.png"
                anchors.right: videoCall.left
                anchors.topMargin: 17
                fillMode: Image.PreserveAspectFit

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
    }
}
