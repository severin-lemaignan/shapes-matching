import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    id: window1
    visibility: "FullScreen"
    width: 1280
    height: 768
    color: "#000000"
    title: "Shape Matching"
    visible: true

    property double starttime: {
        var date = new Date();
        window1.starttime = date.getTime();
    }

    Image {
        id: targetimage
        property string name: "star"
        x: 590
        y: 68
        width: selectionRow.height
        height: selectionRow.height
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        source: "images/" + targetimage.name + "-yellow.png"
    }

    Row {
        id: selectionRow
        x: 44
        y: 426
        width: height * 4 + (height/2)*3
        height: window1.height/4
        spacing: height/2
        anchors.horizontalCenter: parent.horizontalCenter

        MouseArea {
            id: mouseArea1
        property string name: "circle"
            width: parent.height
            height: parent.height

            Image {
                id: image1
                anchors.fill: parent
                source: "images/" + parent.name + ".png"
            }
            onClicked: shapeClicked(name)
        }

        MouseArea {
            id: mouseArea2
        property string name: "cross"
            width: parent.height
            height: parent.height

            Image {
                id: image2
                anchors.fill: parent
                source: "images/" + parent.name + ".png"
            }
            onClicked: shapeClicked(name)
        }

        MouseArea {
            id: mouseArea3
        property string name: "square"
            width: parent.height
            height: parent.height

            Image {
                id: image3
                anchors.fill: parent
                source: "images/" + parent.name + ".png"
            }
            onClicked: shapeClicked(name)
        }

        MouseArea {
            id: mouseArea4
        property string name: "star"
            width: parent.height
            height: parent.height

            Image {
                id: image4
                anchors.fill: parent
                source: "images/" + parent.name + ".png"
            }

            onClicked: shapeClicked(name)
        }
    }

    function shapeClicked(shape) {
        var d = new Date();
        var n = d.getTime();

        if (shape == targetimage.name) {
            print("Correct answer");
         } else {
            print("Incorrect answer");

        }

        print("Reaction time: " + (n - window1.starttime) + "ms");
        window1.starttime = n;



        var symbols = ["cross", "square", "circle", "star"];

        var newtarget = symbols[Math.floor(Math.random()*symbols.length)];

        shuffle(symbols);
        mouseArea1.name = symbols[0];
        mouseArea2.name = symbols[1];
        mouseArea3.name = symbols[2];
        mouseArea4.name = symbols[3];


        targetimage.name = newtarget;



    }

    // taken from http://stackoverflow.com/questions/2450954/how-to-randomize-shuffle-a-javascript-array
    function shuffle(array) {
      var currentIndex = array.length, temporaryValue, randomIndex;

      // While there remain elements to shuffle...
      while (0 !== currentIndex) {

        // Pick a remaining element...
        randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex -= 1;

        // And swap it with the current element.
        temporaryValue = array[currentIndex];
        array[currentIndex] = array[randomIndex];
        array[randomIndex] = temporaryValue;
      }

      return array;
    }
}
