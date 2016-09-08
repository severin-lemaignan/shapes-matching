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

    property int count: 0

    property string logfilename: {
        window1.logfilename = "shapes_matching_log_" + starttime;
    }

    Rectangle {
        id: instructions
        color: "#000000"
        anchors.fill: parent
        visible: true

        states: [
            State {
                name: "matching"
                PropertyChanges {
                    target: shapes
                    visible: true
                }
                PropertyChanges {
                    target: instructions
                    visible: false

                }
            },
            State {
                name: "greetings"; when: window1.count == 100
                PropertyChanges {
                    target: shapes
                    visible: false
                }
                PropertyChanges {
                    target: greetings
                    visible: true

                }
            }

        ]

        Column {
            id: column1
            spacing: 150
            anchors.bottomMargin: 50
            anchors.topMargin: 50
            anchors.fill: parent
            Text {
                id: instruction_text
                width: 706
                height: 182
                text: "Click on the bottom shape that matches the top one."
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 24
                font.bold: true
                color: "#ffffff"
            }


            MouseArea {
                id: mouseArea5
                width: 423
                height: 84
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: instructions.state = "matching"

                Rectangle {
                    id: rectangle1
                    color: "#363636"
                    anchors.fill: parent

                    Text {
                        id: text1
                        color: "#ffffff"
                        text: qsTr("Press to start")
                        anchors.fill: parent
                        font.bold: false
                        font.pointSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }
    }

    Rectangle {
        id: greetings
        color: "#000000"
        anchors.fill: parent
        visible: false

        Text {
                id: greetings_text
                width: 706
                height: 182
                text: "Thank you."
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 24
                font.bold: true
                color: "#ffffff"
            }

    }

    Rectangle {
        id: shapes
        color: "#000000"
        visible: false
        anchors.fill: parent



        Image {
            id: targetimage
            property string name: "star"
            x: 544
            y: 68
            width: selectionRow.height
            height: selectionRow.height
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            source: "images/" + targetimage.name + "-yellow.png"
        }

        Row {
            id: selectionRow
            x: 112
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
    }

    function shapeClicked(shape) {

        window1.count += 1;

        var d = new Date();
        var n = d.getTime();

        var log = "";

        if (shape === targetimage.name) {
            print("Correct answer");
            log += "1,";
        } else {
            print("Incorrect answer");
            log += "0,";

        }

        print("Reaction time: " + (n - window1.starttime) + "ms");
        log += (n - window1.starttime)

        fileio.write(window1.logfilename, log);

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
