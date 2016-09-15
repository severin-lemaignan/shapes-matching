import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Layouts 1.1
import QtMultimedia 5.5

Rectangle {
    id: window1
    width:1200
    height:800

    color: "#000000"
    visible: true


    property double starttime: 0

    property int count: 0

    property string logfilename: ""
    property string qlogfilename: ""

    property int seed: 1

    onCountChanged: {
        if (count == 75) {
            giveupButton.visible = true;
        }

        if (count >= 200) {
            var date = new Date();
            questions.starttimeTestQuestions = date.getTime();
            state = "textquestions";
        }
    }

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

            PropertyChanges {
                target: button1
                text: qsTr("Give up")
                visible: true
            }

            PropertyChanges {
                target: giveupButton
                anchors.rightMargin: 125
                visible: false
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

            PropertyChanges {
                target: restartHiddenButton
                visible:true

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
                text: "Next, you will be shown shapes"
            }

            PropertyChanges {
                target: instruction_text1
                height: 91
                text: "Tap the picture with the same shape but a different colour than the target"
            }

            PropertyChanges {
                target: continueButton
                text: qsTr("Start")
            }

            PropertyChanges {
                target: instructions_image
                visible: true
            }


        },
        State {
            name: "endtext"


            PropertyChanges {
                target: instruction_text
                visible: false
            }

            PropertyChanges {
                target: instruction_text1
                visible: false
            }

            PropertyChanges {
                target: continueButton
                text: qsTr("Continue")
                visible:false
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
            name: "textquestions"
            PropertyChanges {
                target: instructions
                visible: false
            }

            PropertyChanges {
                target: questions
                visible: true
            }

            PropertyChanges {
                target: nextquestionsButton
                opacity: 0.0

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

        },
        State {
            name: "textquestions2"
            PropertyChanges {
                target: instructions
                visible: false
            }
            PropertyChanges {
                target: nextquestionsButton
                opacity: 0.0

            }

            PropertyChanges {
                target: questions
                visible: true
            }

            PropertyChanges {
                target: textquestion5
                visible: true
            }
            PropertyChanges {
                target: textquestion6
                visible: true
            }
            PropertyChanges {
                target: textquestion7
                visible: true
            }
            PropertyChanges {
                target: textquestion8
                visible: true
            }
        }

    ]

    MouseArea {
        id: restartHiddenButton
        width: 100
        height: 100
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false
        onClicked: window1.state = ""

        Rectangle {
            id: rectangle1
            color: "#000"
            anchors.fill: parent
        }
    }

    Rectangle {
        id: instructions
        color: "#000000"
        anchors.fill: parent
        visible: true


        ColumnLayout {
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
                text: "You will first listen to a short text about the history of Australia"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 24
            }

            Image {
                id: instructions_image
                width: 300
                height: 300
                source: "images/shape_matching_example.png"
                visible: false
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Audio {
                id: audiostory
                source: "audio/story.mp3"
                //onPlaying: {continueButton.visible = true;}
                onStopped: {continueButton.visible = true;}
                volume: 0.7
            }

            Button {
                id: continueButton
                width: 400
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
                        initializeActivity();
                        window1.state ="endtext";
                        audiostory.play();
                        return;
                    }

                    if (window1.state == "endtext") {
                        window1.state ="shapeinstructions";
                        audiostory.stop();
                        return;
                    }

                    if (window1.state == "shapeinstructions") {
                        var date = new Date();
                        shapes.starttime = date.getTime();
                        shapes.prevtime = shapes.starttime;
                        window1.state = "matching";
                    }
                    randomizeShapes();
                }
            }





        }
    }

    ColumnLayout {
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

        property double starttime: 0
        property double prevtime: 0



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

            Button {
                id: giveupButton
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 40
                width:400
                text: "Give up"
                style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 30
                        text: giveupButton.text
                    }
                }
                onClicked: {
                    var date = new Date();
                    questions.starttimeTestQuestions = date.getTime();
                    window1.state = "textquestions"
                }
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

    ColumnLayout {
        id: questions
        y: 191
        spacing: 80
        width: childrenRect.width
        height: childrenRect.height
        anchors.verticalCenter: parent.verticalCenter
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter

        property bool firstBlockAnswered: textquestion1.answered && textquestion2.answered && textquestion3.answered && textquestion4.answered

        onFirstBlockAnsweredChanged: {
            if (window1.state === "textquestions") {
                nextquestionsButton.opacity = (firstBlockAnswered ? 1.0 : 0.0);
            }
        }
        property bool secondBlockAnswered: textquestion5.answered &&
                           textquestion6.answered && textquestion7.answered &&
                           textquestion8.answered

        onSecondBlockAnsweredChanged: {
            if (window1.state === "textquestions2") {
                nextquestionsButton.opacity = (secondBlockAnswered ? 1.0 : 0.0);
            }
        }

        property double starttimeTestQuestions: 0
        property double starttimeQuestionaire: 0

        MultipleChoice {
            id: textquestion1
            visible: false
            question: "What was the name of Australia before the European invasion? "
            answer1: "New Britain"
            answer2: "New Holland"
            answer3: "Oceania"
            answer4: "New York"
        }
        MultipleChoice {
            id: textquestion2
            visible: false
            question: "How many people were initially transferred by ships to Australia?"
            answer1: "1000"
            answer2: "1500"
            answer3: "2000"
            answer4: "2500"
        }
        MultipleChoice {
            id: textquestion3
            visible: false
            question: "What was the ratio between men and women in the early 1800s? "
            answer1: "5 to 1"
            answer2: "5 to 2"
            answer3: "5 to 3"
            answer4: "5 to 4"
        }
        MultipleChoice {
            id: textquestion4
            visible: false
            question: "What was the name of the captain who sailed to Australia and claimed it as Britain?"
            answer1: "Captain Jack Blackman"
            answer2: "Captain Billy Murdoch"
            answer3: "Captain James Cook"
            answer4: "Captain Matthew Freeman"


        }
        MultipleChoice {
            id: textquestion5
            visible: false
            question: "Which year did the first fleet of 11 ships arrived at Australia?"
            answer1: "1731"
            answer2: "1771"
            answer3: "1782"
            answer4: "1788"

        }
        MultipleChoice {
            id: textquestion6
            visible: false
            question: "What news attracted more British migrants? "
            answer1: "Free land"
            answer2: "Plentiful work"
            answer3: "Good weather"
            answer4: "Rewards"

        }
        MultipleChoice {
            id: textquestion7
            visible: false
            question: "Which port was used to settle Melbourne?"
            answer1: "Port of Eden"
            answer2: "Port Phillip Bay"
            answer3: "Port Batemans Bay"
            answer4: "Coffs Harbour"

        }
        MultipleChoice {
            id: textquestion8
            visible: false
            question: "Which century did Europeans sail first for Australia?"
            answer1: "14th"
            answer2: "15th"
            answer3: "16th"
            answer4: "17th"

        }

        Column {
            id: genderquestion
            width: 900
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 12

            property string gender: isFemale.checked ? "female" : "male"

            Text {
                color: "#ffffff"
                text: "I am a"
                font.pixelSize: 50
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
                    font.pixelSize: 40
                }

                RadioButton {
                    id: isFemale
                    checked: true
                    exclusiveGroup: tabPositionGroup
                    style: RadioButtonStyle {
                        indicator: Rectangle {
                            width: 60
                            height: width
                            radius: width/2
                            color: "#fff"
                            Rectangle {
                                anchors.fill:parent
                                visible: control.checked
                                color: "#555"
                                width:parent.width - 8
                                radius:width/2
                                height:width
                                anchors.margins: 4
                            }
                        }
                    }
                }
                Text {
                    color: "#b4b4b4"
                    text: "Male"
                    font.pixelSize: 40
                }

                RadioButton {
                    id: isMale
                    exclusiveGroup: tabPositionGroup
                    style: isFemale.style
                }
            }
        }

        Column {
            id: agequestion
            width: 900
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 12

            property int age: age.value

            function reset(){
                age.value = 25;
            }

            Text {
                id: blah
                color: "#ffffff"
                text: "My age"
                font.pixelSize: 50
            }
            Row {
                spacing:40
                Slider {
                    id: age
                    width: 1000
                    tickmarksEnabled: false
                    minimumValue: 15
                    value: 25
                    stepSize: 1
                    maximumValue: 75
                    style: SliderStyle {
                        handle: Rectangle {
                            width: 60
                            height: width
                            radius: width/2
                            color: "#fff"
                        }
                        groove: Rectangle {
                            color: "#777"
                            width: parent.width
                            height:10
                        }
                    }

                }

                Text {
                    text: age.value
                    color: "#aaa"
                    font.pixelSize: 40
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
            question: "I felt it was important to do well in the experiment"
        }

        LikertScale {
            id: question6
            visible: false
            question: "How difficult was..."
            subquestion1: "the shape-matching task?"
            subquestion2: "answering the questions on the text?"
            minText: "Easy"
            maxText: "Difficult"
        }

        LikertScale {
            id: question7
            visible: false
            question: "I felt I performed well on..."
            subquestion1: "the shape-matching task:"
            subquestion2: "answering the questions on the text:"
            minText: "Not well"
            maxText: "Very well"
        }

        LikertScale {
            id: question8
            visible: false
            question: "I enjoyed..."
            subquestion1: "the shape-matching task:"
            subquestion2: "answering the questions on the text:"
        }

        Button {
            id: nextquestionsButton
            opacity:1.0
            text: qsTr("Continue")
            anchors.horizontalCenter: parent.horizontalCenter
            style: ButtonStyle {
                label: Text {
                    renderType: Text.NativeRendering
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 30
                    text: nextquestionsButton.text
                }
            }
            onClicked: {
                if (window1.state === "textquestions") {
                    window1.state = "textquestions2";
                    return;
                }
                if (window1.state === "textquestions2") {
                    window1.state = "questionaire";
                    var date = new Date();
                    questions.starttimeQuestionaire = date.getTime();
                    return;
                }
                if (window1.state === "questionaire") {
                    window1.state = "questionaire2";
                    return;
                }

                if (window1.state === "questionaire2") {
                    saveQuestions();
                    window1.state = "greetings";  
                }
            }
        }
    }



    function initializeActivity() {

        window1.seed = 1;
        window1.count = 0;
        textquestion1.reset();
        textquestion2.reset();
        textquestion3.reset();
        textquestion4.reset();
        textquestion5.reset();
        textquestion6.reset();
        textquestion7.reset();
        textquestion8.reset();
        agequestion.reset();
        question1.reset();
        question2.reset();
        question3.reset();
        question4.reset();
        question5.reset();
        question6.reset();
        question7.reset();
        question8.reset();

        var date = new Date();
        window1.starttime = date.getTime();
        window1.logfilename = window1.starttime + "_shapes_matching_log.csv";
        window1.qlogfilename = window1.starttime + "_questions_log.csv";
        fileio.write(window1.logfilename, "shape_matching_round,correct_match,reaction_time")
        fileio.write(window1.qlogfilename, "starttime,start_shape_matching,start_text_questions,tq1,tq2,tq3,tq4,tq5,tq6,tq7,tq8,start_questionaire,gender,age,q1,q2,q3,q4,q5,q61,q62,q71,q72,q81,q82,endtime");
    }

    function saveQuestions() {
        var date = new Date();
        var log = new Array(window1.starttime,
                    shapes.starttime,
                    questions.starttimeTestQuestions,
                    textquestion1.result,
                    textquestion2.result,
                    textquestion3.result,
                    textquestion4.result,
                    textquestion5.result,
                    textquestion6.result,
                    textquestion7.result,
                    textquestion8.result,
                    questions.starttimeQuestionaire,
                    genderquestion.gender,
                    agequestion.age,
                    question1.result,
                    question2.result,
                    question3.result,
                    question4.result,
                    question5.result,
                    question6.result,
                    question6.result2,
                    question7.result,
                    question7.result2,
                    question8.result,
                    question8.result2,
                    date.getTime());

        print("Questions results:");
        print(log.join(","));

        fileio.write(window1.qlogfilename, log.join(","));
    }

    function shapeClicked(shape, color) {

        window1.count += 1;

        var d = new Date();
        var n = d.getTime();

        var log = window1.count + ",";

        if (shape === targetimage.name && color !== targetimage.color) {
            print("Correct answer");
            log += "1,";
        } else {
            print("Incorrect answer");
            log += "0,";

        }

        print("Reaction time: " + (n - shapes.prevtime) + "ms");
        log += (n - shapes.prevtime)

        log += ",,,,,,,,,,,,,,,,,,,,,,"
        fileio.write(window1.logfilename, log);

        shapes.prevtime = n;

        randomizeShapes();

    }

    function randomizeShapes() {

        var colors = ["white", "green", "purple", "red", "blue", "yellow"];
        var symbols = ["cross", "square", "circle", "star","cross", "square", "circle", "star"];

        var newSymbolTarget = symbols[Math.floor(random()*symbols.length)];
        var newColorTarget = colors[Math.floor(random()*colors.length)];

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

    // use custom random generator that is seedable
    // taken from http://stackoverflow.com/questions/521295/javascript-random-seeds
    function random() {
        var x = Math.sin(window1.seed++) * 10000;
        return x - Math.floor(x);
    }

    function getRandom(list,differentFrom) {

        var elem = list[Math.floor(random()*list.length)];


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
            randomIndex = Math.floor(random() * currentIndex);
            currentIndex -= 1;

            // And swap it with the current element.
            temporaryValue = array[currentIndex];
            array[currentIndex] = array[randomIndex];
            array[randomIndex] = temporaryValue;
        }

        return array;
    }
}
