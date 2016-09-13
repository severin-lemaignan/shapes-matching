import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

Rectangle {
    id: window1
    width:1200
    height:800

    color: "#000000"
    visible: true


    property double starttime: 0

    property int count: 0

    property string logfilename: ""

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

            PropertyChanges {
                target: targetBackground
                x: 0
                y: 44
                width: parent.width
                height: selectionRow.height + 40
                color: "#2b2b2b"
                anchors.topMargin: 0
                anchors.rightMargin: 1000
                anchors.leftMargin: 330
                opacity: 1
            }

            PropertyChanges {
                target: selectionColumn
                anchors.topMargin: 40
            }
        },
        State {
            name: "greetings"
            PropertyChanges {
                target: shapes
                visible: false
            }
            PropertyChanges {
                target: greetings
                spacing: 10
                visible: true

            }

            PropertyChanges {
                target: greetings_text
                text: "Thank you for your participation!"
            }

            PropertyChanges {
                target: instructions
                visible: false
            }

            PropertyChanges {
                target: greetings_text1
                text: "You can now return the tablet to the experimenter."
                font.bold: false
            }
        },
        State {
            name: "shapeinstructions"

            PropertyChanges {
                target: shapes
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
            }

            PropertyChanges {
                target: instruction_text
                height: 80
                text: "You will next be shown shapes"
            }

            PropertyChanges {
                target: instruction_text1
                height: 91
                text: "Click the image with the same shape as the model, but a different colour"
            }

            PropertyChanges {
                target: continueButton
                text: qsTr("Start")
            }

            PropertyChanges {
                target: instructions_image
                width: 300
                height: 300
                visible: true
                source: "images/shape_matching_example.png"
            }


        },
        State {
            name: "endtext"
            PropertyChanges {
                target: shapes
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
            }

            PropertyChanges {
                target: instruction_text
                height: 80
                text: "You will next be shown shapes"
                visible: false
            }

            PropertyChanges {
                target: instruction_text1
                height: 91
                text: "Click the picture with the same shape but a different colour"
                visible: false
            }

            PropertyChanges {
                target: continueButton
                text: qsTr("Continue")
            }
        },
        State {
            name: "questionaire"

            PropertyChanges {
                target: instructions
                visible: false
            }

            PropertyChanges {
                target: questions
                visible: true
            }

            PropertyChanges {
                target: question1
                visible: true
            }

            PropertyChanges {
                target: question2
                visible: true
            }

            PropertyChanges {
                target: question3
                visible: true
            }

            PropertyChanges {
                target: question4
                visible: true
            }

            PropertyChanges {
                target: agequestion
                visible: true
            }

            PropertyChanges {
                target: genderquestion
                visible: true
            }

            PropertyChanges {
                target: nextquestionsButton
                anchors.rightMargin: 0
            }
        },
        State {
            name: "questionaire2"

            PropertyChanges {
                target: instructions
                visible: false
            }

            PropertyChanges {
                target: question5
                visible: true
            }

            PropertyChanges {
                target: question6
                visible: true
            }

            PropertyChanges {
                target: questions
                visible: true
            }

            PropertyChanges {
                target: question7
                visible: true
            }

            PropertyChanges {
                target: question8
                visible: true
            }

        },
        State {
            name: "textquestions"; when: window1.count == 10
            PropertyChanges {
                target: instructions
                visible: false
            }

            PropertyChanges {
                target: questions
                visible: true
            }

            PropertyChanges {
                target: question1
                visible: false
            }

            PropertyChanges {
                target: question2
                visible: false
            }

            PropertyChanges {
                target: question3
                visible: false
            }

            PropertyChanges {
                target: question4
                visible: false
            }

            PropertyChanges {
                target: agequestion
                visible: false
            }

            PropertyChanges {
                target: genderquestion
                visible: false
            }

            PropertyChanges {
                target: nextquestionsButton
                anchors.rightMargin: 0
            }

            PropertyChanges {
                target: textquestion1
                visible: true
            }

            PropertyChanges {
                target: textquestion2
                visible: true
            }

            PropertyChanges {
                target: textquestion3
                visible: true
            }

            PropertyChanges {
                target: textquestion4
                visible: true
            }
        }

    ]

    Rectangle {
        id: instructions
        color: "#000000"
        anchors.fill: parent
        visible: true


        Column {
            id: column1
            spacing: 20
            anchors.bottomMargin: 50
            anchors.topMargin: 50
            anchors.fill: parent
            Text {
                id: instruction_text
                width: 706
                height: 182
                text: "Welcome!"
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 24
                font.bold: true
                color: "#ffffff"
            }


            Text {
                id: instruction_text1
                width: 706
                height: 182
                color: "#ffffff"
                text: "You will first listen to a short text"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 24
            }

            Image {
                id: instructions_image
                width: 100
                height: 100
                visible: false
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
                source: "qrc:/qtquickplugin/images/template_image.png"
            }

            Button {
                id: continueButton
                width: 300
                text: qsTr("Listen")
                anchors.horizontalCenter: parent.horizontalCenter
                style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 50
                        text: continueButton.text
                    }
                }

                onClicked: {
                    if (window1.state == "") {
                        window1.state ="endtext";
                        return;
                    }

                    if (window1.state == "endtext") {
                        window1.state ="shapeinstructions";
                        return;
                    }

                    if (window1.state == "shapeinstructions") {
                        var date = new Date();
                        window1.starttime = date.getTime();
                        window1.logfilename = "shapes_matching_log_" + window1.starttime;
                        window1.state = "matching";
                    }
                    randomizeShapes();
                }
            }





        }
    }

    Column {
        id: greetings
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false

        Text {
            id: greetings_text
            width: 706
            height: 182
            text: "Thank you."
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 24
            font.bold: true
            color: "#ffffff"
        }

        Text {
            id: greetings_text1
            width: 706
            height: 182
            color: "#ffffff"
            text: "Thank you."
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 24
        }

    }

    Rectangle {
        id: shapes
        color: "#000000"
        visible: false
        anchors.fill: parent



        Rectangle {
            id: targetBackground
            width: 200
            height: 200
            color: "#ffffff"
            opacity: 0


            Image {
                id: targetimage
                property string name: "star"
                property string color: "yellow"
                width: selectionRow.height
                height: selectionRow.height
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "images/" + targetimage.name + "-" + color + ".png"
            }
        }

        Column {
            id: selectionColumn
            width: 200
            height: 400
            anchors.top: targetBackground.bottom
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
                    onClicked: shapeClicked(shape1.name, shape1.color)
                }
                Shape {
                    id: shape2
                    onClicked: shapeClicked(shape2.name, shape2.color)
                }
                Shape {
                    id: shape3
                    onClicked: shapeClicked(shape3.name, shape3.color)
                }
                Shape {
                    id: shape4
                    onClicked: shapeClicked(shape4.name, shape4.color)
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
                    onClicked: shapeClicked(shape5.name, shape5.color)
                }
                Shape {
                    id: shape6
                    onClicked: shapeClicked(shape6.name, shape6.color)
                }
                Shape {
                    id: shape7
                    onClicked: shapeClicked(shape7.name, shape7.color)
                }
                Shape {
                    id: shape8
                    onClicked: shapeClicked(shape8.name, shape8.color)
                }
            }
        }


    }

    Column {
        id: questions
        y: 191
        spacing: 60
        width: childrenRect.width
        height: childrenRect.height
        anchors.verticalCenter: parent.verticalCenter
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter

          MultipleChoice {
            id: textquestion1
            visible: false
            question: "What is the age of the capitain?"
            answer1: "12"
            answer2: "13"
            answer3: "126"
            answer4: "55"
        }
       MultipleChoice {
            id: textquestion2
            visible: false
            question: "What is the age of the capitain?"
            answer1: "12"
            answer2: "13"
            answer3: "126"
            answer4: "55"
        }
       MultipleChoice {
            id: textquestion3
            visible: false
            question: "What is the age of the capitain?"
            answer1: "12"
            answer2: "13"
            answer3: "126"
            answer4: "55"
        }
        MultipleChoice {
            id: textquestion4
            visible: false
            question: "What is the age of the capitain?"
            answer1: "12"
            answer2: "13"
            answer3: "126"
            answer4: "55"
        }

        Column {
            id: genderquestion
            width: 900
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 12

            Text {
                color: "#ffffff"
                text: "I am a"
                font.pixelSize: 24
            }

            Row {
                id: row1
                width: childrenRect.width
                height: childrenRect.height
                spacing: 10
                anchors.left: parent.left
                anchors.leftMargin: 50
                ExclusiveGroup { id: tabPositionGroup }
                Text {
                    color: "#b4b4b4"
                    text: "Female"
                    font.pixelSize: 20
                }

                RadioButton {
                    id: isFemale
                    checked: true
                    exclusiveGroup: tabPositionGroup
                }
                Text {
                    color: "#b4b4b4"
                    text: "Male"
                    font.pixelSize: 24
                }

                RadioButton {
                    id: isMale
                    exclusiveGroup: tabPositionGroup
                }
            }
        }

        Column {
            id: agequestion
            width: 900
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 12

            Text {
                color: "#ffffff"
                text: "My age"
                font.pixelSize: 24
            }

            SpinBox {
                id: age
                anchors.left: parent.left
                anchors.leftMargin: 50
                value: 25
                minimumValue: 15
                style: SpinBoxStyle{
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 20
                        border.color: "gray"
                        radius: 2
                    }
                }
            }

        }

        LikertScale {
            id: question1
            visible: false
            question: "I felt I was evaluated during the experiment for the quality of my work"
        }

        LikertScale {
            id: question2
            visible: false
            question: "I felt I was being evaluated for the speed of my work during the shape-matching task"
        }

        LikertScale {
            id: question3
            visible: false
            question: "I felt I was being watched"
        }

        LikertScale {
            id: question4
            visible: false
            question: "I found the robot/observer to be distracting"
        }

        LikertScale {
            id: question5
            visible: false
            question: "How important did you feel it was for you to do well in the experiment"
        }

        LikertScale {
            id: question6
            visible: false
            question: "How difficult was"
            subquestion1: "the shape-matching task:"
            subquestion2: "answering the questions on the text:"
            minText: "Easy"
            maxText: "Difficult"
        }

        LikertScale {
            id: question7
            visible: false
            question: "How well do you think you performed on"
            subquestion1: "the shape-matching task:"
            subquestion2: "answering the questions on the text:"
            minText: "Not well"
            maxText: "Very well"
        }

        LikertScale {
            id: question8
            visible: false
            question: "How much did you enjoy"
            subquestion1: "the shape-matching task:"
            subquestion2: "answering the questions on the text:"
        }

        Button {
            id: nextquestionsButton
            text: qsTr("Continue")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                if (window1.state === "textquestions") {
                    window1.state = "questionaire";
                    return;
                }
                if (window1.state === "questionaire") {
                    window1.state = "questionaire2";
                    return;
                }

                if (window1.state === "questionaire2") {
                    window1.state = "greetings";
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

        //shape1.color  = possiblepairs[0][0];
        //shape1.name  = possiblepairs[0][1];

        //shape2.color = possiblepairs[1][0];
        //shape2.name = possiblepairs[1][1];

        //shape3.color = possiblepairs[2][0];
        //shape3.name = possiblepairs[2][1];

        //shape4.color = possiblepairs[3][0];
        //shape4.name = possiblepairs[3][1];

        //shape5.color = possiblepairs[4][0];
        //shape5.name = possiblepairs[4][1];

        //shape6.color = possiblepairs[5][0];
        //shape6.name = possiblepairs[5][1];

        //shape7.color = possiblepairs[6][0];
        //shape7.name = possiblepairs[6][1];

        //shape8.color = possiblepairs[7][0];
        //shape8.name = possiblepairs[7][1];


        //targetimage.name = newSymbolTarget;
        //targetimage.color = newColorTarget;



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
