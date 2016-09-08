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


    property double starttime: 0

    property int count: 0

    property string logfilename: ""

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
                onClicked: {
                    var date = new Date();
                    window1.starttime = date.getTime();
                    window1.logfilename = "shapes_matching_log_" + window1.starttime;
                    instructions.state = "matching";
                    randomizeShapes();
                }

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
            property string color: "yellow"
            x: 544
            width: selectionRow.height
            height: selectionRow.height
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            source: "images/" + targetimage.name + "-" + color + ".png"
        }

        Column {
            id: selectionColumn
            width: 200
            height: 400
            anchors.top: targetimage.bottom
            anchors.topMargin: 150
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: selectionRow.spacing

            Row {
                id: selectionRow
                width: height * 4 + (height/2)*3
                height: window1.height/5
                spacing: height/2
                anchors.horizontalCenter: parent.horizontalCenter

                Shape {
                    id: shape1
                }
                Shape {
                    id: shape2
                }
                Shape {
                    id: shape3
                }
                Shape {
                    id: shape4
                }
            }
            Row {
                id: selectionRow2
                width: height * 4 + (height/2)*3
                height: selectionRow.height
                spacing: height/2
                anchors.horizontalCenter: parent.horizontalCenter

                Shape {
                    id: shape5
                }
                Shape {
                    id: shape6
                }
                Shape {
                    id: shape7
                }
                Shape {
                    id: shape8
                }
            }
        }

    }

    function shapeClicked(shape, color) {

        window1.count += 1;

        var d = new Date();
        var n = d.getTime();

        var log = "";

        if (shape === targetimage.name && color !== targetimage.color) {
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

        randomizeShapes();

        }

   function randomizeShapes() {

        var colors = ["white", "green", "purple", "red", "blue", "yellow"];
        var symbols = ["cross", "square", "circle", "star","cross", "square", "circle", "star"];

        var newSymbolTarget = symbols[Math.floor(Math.random()*symbols.length)];
        var newColorTarget = colors[Math.floor(Math.random()*colors.length)];

        var possiblepairs = [[newColorTarget, newSymbolTarget],
                             [getRandom(colors, newColorTarget), newSymbolTarget]
                            ]

        // The remaining symbols are all symbols except the new target symbol
        var remainingPossibleSymbols = symbols;
        remainingPossibleSymbols.splice(remainingPossibleSymbols.indexOf(newSymbolTarget),1);
        remainingPossibleSymbols.splice(remainingPossibleSymbols.indexOf(newSymbolTarget),1);

        shuffle(remainingPossibleSymbols);
        shuffle(colors);

        for (var i = 0; i < 6; i++) {
            possiblepairs.push([colors[i], remainingPossibleSymbols[i]]);
        }

        shuffle(possiblepairs)

        shape1.color  = possiblepairs[0][0];
        shape1.name  = possiblepairs[0][1];

        shape2.color = possiblepairs[1][0];
        shape2.name = possiblepairs[1][1];

        shape3.color = possiblepairs[2][0];
        shape3.name = possiblepairs[2][1];

        shape4.color = possiblepairs[3][0];
        shape4.name = possiblepairs[3][1];

        shape5.color = possiblepairs[4][0];
        shape5.name = possiblepairs[4][1];

        shape6.color = possiblepairs[5][0];
        shape6.name = possiblepairs[5][1];

        shape7.color = possiblepairs[6][0];
        shape7.name = possiblepairs[6][1];

        shape8.color = possiblepairs[7][0];
        shape8.name = possiblepairs[7][1];


        targetimage.name = newSymbolTarget;
        targetimage.color = newColorTarget;



    }

    function getRandom(list,differentFrom) {

        var elem = list[Math.floor(Math.random()*list.length)];


        if (typeof differentFrom === 'undefined') return elem;

        if (elem === differentFrom) return getRandom(list, differentFrom);

        return elem;
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
