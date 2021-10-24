import QtQuick 2.15
import QtQml.Models 2.15

ListModel {
    ListElement {
        type: "circle"
        val: "100"
        xpos: 10
        ypos: 10
    }
    ListElement {
        type: "rectangle"
        val: "30"
        xpos: 100
        ypos: 100
    }
    ListElement {
        type: "circle"
        val: "150"
        xpos: 300
        ypos: 450
    }
    ListElement {
        type: "rectangle"
        val: "20"
        xpos: 500
        ypos: 200
    }
    ListElement {
        type: "circle"
        val: "25"
        xpos: 650
        ypos: 100
    }
    ListElement {
        type: "rectangle"
        val: "60"
        xpos: 600
        ypos: 200
    }
}
