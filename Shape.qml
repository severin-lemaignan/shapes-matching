import QtQuick 2.0

MouseArea {
    property string name: "circle"
    property string color: "purple"
    width: parent.height
    height: parent.height

    Image {
        anchors.fill: parent
        source: "images/" + parent.name + "-" + parent.color + ".png"
    }
    onClicked: shapeClicked(name, color)
}

