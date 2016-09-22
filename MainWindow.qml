import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2


Rectangle {
    id: window1
    width:1200
    height:800

    color: "#000000"
    visible: true


    property double starttime: 0

    property int nextAnswer: 0
    property int lastAttempt: 0
    property string nextQuestion: ""

    property int count: 0
    property int nb_demo_rounds: 3
    property int nb_expe_rounds: 25

    property int allowedTime: 5 * 60
    property int remainingTime: 0

    property int goodAnswers: 0
    property double amountPerAnswer: 0.2
    property var answers: []
    property var answersResponseTimes: []
    property var dialogDismissResponseTimes: []



    property string logfilename: ""

    property int seed: 1

    property bool demoDone: false

    Component.onCompleted: {
            initializeActivity();
    }

    MouseArea {
            id: restartHiddenButton
            width: 100
            height: 100
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            visible: false
            onClicked: initializeActivity()

            Rectangle {
                    id: hiddenButtonRectangle
                    color: "#000"
                    anchors.fill: parent
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
                    font.pointSize: 50
                    font.bold: true
                    color: "#ffffff"
            }

            Text {
                    id: greetings_text1
                    width: 706
                    height: 182
                    color: "#ffffff"
                    text: "You can now return the tablet to the experimenter."
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.WordWrap
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 24
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

            property double starttimeTestQuestions: 0
            property double starttimeQuestionaire: 0


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
                            id: agelabel
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
                                                    radius: height/2
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
                    question: "How often did you look at the answer?"
                    minText: "Never"
                    maxText: "Always"

            }
            LikertScale {
                    id: question3
                    visible: false
                    question: "I felt I was being watched"
            }

            LikertScale {
                    id: question4
                    visible: false
                    question: "I found the observer to be distracting"
            }

            LikertScale {
                    id: question5
                    visible: false
                    question: "I felt it was important to do well in the experiment"
            }

            LikertScale {
                    id: question6
                    visible: false
                    question: "I found the activity..."
                    minText: "Easy"
                    maxText: "Difficult"
            }

            LikertScale {
                    id: question7
                    visible: false
                    question: "I felt I performed..."
                    minText: "Not well"
                    maxText: "Very well"
            }

            LikertScale {
                    id: question8
                    visible: false
                    question: "I enjoyed the activity..."
            }

            LikertScale {
                    id: familiaquestion
                    visible: false
                    question: "I am familiar with human-like robots..."
                    minText: "Not at all"
                    maxText: "Very familiar"
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
                            if (window1.state === "questionaire1") {
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

    ColumnLayout {
            id: instructions
            width: childrenRect.width
            height: childrenRect.height
            spacing: 50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Text {
                    id: text1
                    color: "#ffffff"
                    text: qsTr("Welcome")
                    font.bold: true
                    font.pixelSize: 50
            }

            Text {
                    id: sumtext
                    color: "#ffffff"
                    text: nextQuestion + " = ?"
                    font.bold: true
                    font.pixelSize: 50
                    visible: false
            }

            TextField {
                    id: answer
                    width: 300
                    visible: false
                    Layout.fillWidth: true
                    font.pointSize: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: qsTr("Your answer")

                    property double answerStartTime: 0

                    validator: IntValidator {bottom: 100; top: 999;}
                    onAccepted: {
                            window1.lastAttempt = text;

                            var date = new Date();

                            var responseTime = date.getTime() - answerStartTime;

                            if (text === nextAnswer.toString()) goodAnswers++;

                            window1.count += 1;

                            if (!window1.demoDone) {

                                    if (window1.count >= window1.nb_demo_rounds) {
                                            window1.count = 0;
                                            window1.demoDone = true;
                                            window1.state = ""

                                    } else {
                                            messageDialog.open();
                                    }
                            } else {

                                    // store whether the answer is correct or not
                                    if (text === nextAnswer.toString()) {
                                            answers.push(true);
                                    }
                                    else {
                                            answers.push(false);
                                    }
                                    // Store the response time
                                    answersResponseTimes.push(responseTime);

                                    if (window1.count >= window1.nb_expe_rounds) {
                                            window1.state = "tooquicktext"
                                    } else if (window1.remainingTime <= 0) {
                                            window1.state = "endtext"
                                    } else {
                                            answerStartTime = date.getTime();
                                            messageDialog.popupTime = answerStartTime;
                                            messageDialog.open();
                                    }
                            }

                            generateQuestion();
                            text="";
                    }
            }

            Button {
                    id: nextButton
                    text: qsTr("Start")
                    Layout.fillWidth: true
                    style: ButtonStyle {
                            label: Text {
                                    renderType: Text.NativeRendering
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pointSize: 30
                                    text: nextButton.text
                            }
                    }

                    onClicked: {

                            var date = new Date();
                            generateQuestion();

                            if (window1.state === "") {
                                    window1.state="question";
                                    if(demoDone) {
                                            window1.remainingTime = window1.allowedTime;
                                            window1.goodAnswers = 0;
                                            answer.answerStartTime = date.getTime();
                                            messageDialog.popupTime=answer.answerStartTime;
                                    }
                                    timer.restart();
                                    messageDialog.open();

                            }
                            if (window1.state === "endtext" || window1.state === "tooquicktext") {
                                window1.state="questionaire1";
                            }


                    }
            }

            Timer {
                    id: timer
                    interval: 1000; running: false; repeat: true;
                    onTriggered: remainingTime -= 1
            }

            MessageDialog {
                    id: messageDialog
                    property double popupTime: 0
                    title: "[PlymAssess2-debug]"
                    text: "[debug] generated next question " + nextQuestion + "\n[debug] last attempt " + window1.lastAttempt + "\n[debug] expect answ " + nextAnswer + "\n[debug] remain time " + window1.remainingTime
                    onAccepted: {
                        if(window1.demoDone) {
                                var date = new Date();
                                window1.dialogDismissResponseTimes.push(date.getTime()-popupTime);
                                console.log("Reaction time to dismiss the debug dialog: " + (date.getTime()-popupTime) + "ms")
                        }
                        close();
                    }
                    icon: StandardIcon.Information
                    standardButtons: StandardButton.Ok

                    visible: false
            }
    }

    Rectangle {
            id: timerZone
            width: childrenRect.width
            height: 200
            color: "#000000"
            visible: false
            anchors.right: parent.right

            Text {
                    id: timertext
                    color: "#ffffff"
                    text: pad(Math.floor(remainingTime/60),2) + ":" + pad(remainingTime % 60,2) + " left, you've earned £" + (goodAnswers * amountPerAnswer).toFixed(2) + " so far"
                    font.pixelSize: 50
            }
    }
    states: [
            State {
                    name: "question"

                    PropertyChanges {
                            target: answer
                            width: 350
                            visible: true
                    }

                    PropertyChanges {
                            target: nextButton
                            visible: false
                    }

                    PropertyChanges {
                            target: text1
                            visible: false
                    }

                    PropertyChanges {
                            target: sumtext
                            visible: true
                    }

                    PropertyChanges {
                            target: timerZone
                            visible: true
                    }

            },
            State {
                    name: "questionaire1"
                    PropertyChanges {
                            target: answer
                            visible: true
                    }

                    PropertyChanges {
                            target: nextButton
                            visible: false
                    }

                    PropertyChanges {
                            target: instructions
                            visible: false
                    }

                    PropertyChanges {
                            target: questions
                            visible: true
                    }

                    PropertyChanges {
                            target: genderquestion
                            visible: true
                    }

                    PropertyChanges {
                            target: agequestion
                            visible: true
                    }

                    PropertyChanges {
                            target: question1
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
            },
            State {
                    name: "questionaire2"
                    PropertyChanges {
                            target: answer
                            visible: true
                    }

                    PropertyChanges {
                            target: nextButton
                            visible: false
                    }

                    PropertyChanges {
                            target: instructions
                            visible: false
                    }

                    PropertyChanges {
                            target: questions
                            visible: true
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
                            target: question7
                            visible: true
                    }

                    PropertyChanges {
                            target: question8
                            visible: true
                    }
            },
            State {
                    name: "greetings"
                    PropertyChanges {
                            target: greetings
                            visible: true
                    }
                    PropertyChanges {
                            target: restartHiddenButton
                            visible: true
                    }
                    PropertyChanges {
                            target: instructions
                            visible: false
                    }
        },
        State {
            name: "endtext"

            PropertyChanges {
                target: nextButton
                visible: false
            }

            PropertyChanges {
                target: text1
                text: qsTr("Well done! You've earned  £" + (window1.goodAnswers * window1.amountPerAnswer).toFixed(2))
            }

            PropertyChanges {
                target: instructions
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 1
            }
        },
        State {
            name: "tooquicktext"
            PropertyChanges {
                target: nextButton
                visible: false
            }

            PropertyChanges {
                target: text1
                text: qsTr("You've reached the maximum of 25 questions in less than 5 minutes! Well done!")
            }

            PropertyChanges {
                target: instructions
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 1
            }
        }
    ]



    function initializeActivity() {

            print("Initializing the activity...")
            window1.nextAnswer=0;
            window1.lastAttempt = 0;
            window1.nextQuestion="";
            window1.remainingTime=window1.allowedTime;
            window1.goodAnswers=0;
            window1.count = 0;
            window1.demoDone = false;
            window1.answers = [];
            window1.answersResponseTimes = [];
            window1.dialogDismissResponseTimes = [];

            window1.seed = 1;

            agequestion.reset();
            question1.reset();
            question3.reset();
            question4.reset();
            question5.reset();
            question6.reset();
            question7.reset();
            question8.reset();
            familiaquestion.reset();

            window1.state = "";

            var date = new Date();
            window1.starttime = date.getTime();
            window1.logfilename = window1.starttime + "_social_presence_log.csv";
            var headers = "starttime,"
            for(var i = 0; i < window1.nb_expe_rounds; i++) {
                headers += "q" + i + ",response_time" + i + ",dialog_dismiss_response_time" + i + ",";
            }
            headers += "gender,age,q1,q2,q3,q4,q5,q6,q7,familiarity,endtime";
            fileio.write(window1.logfilename, headers);

            print("Activity and logs initialized.")
    }

    function generateQuestion() {


            var res=0;
            var question;

            var questions = [
                        ["412 + 167 + 204", 783],
                        ["309 + 272 + 105", 686],
                        ["629 + 203 + 166", 998],
                        ["212 + 207 + 322", 741],
                        ["599 + 103 + 106", 808],
                        ["478 + 222 + 367", 857],
                        ["352 + 424 + 109", 895],
                        ["283 + 206 + 202", 590],
                        ["313 + 479 + 205", 997],
                        ["701 + 119 + 168", 988],
                        ["442 + 102 + 427", 971],
                        ["139 + 323 + 519", 981],
                        ["353 + 472 + 164", 989],
                        ["101 + 493 + 175", 769],
                        ["317 + 338 + 229", 884],
                        ["110 + 204 + 559", 873],
                        ["327 + 215 + 104", 646],
                        ["571 + 109 + 113", 793],
                        ["362 + 315 + 252", 929],
                        ["111 + 213 + 395", 719],
                        ["617 + 154 + 216", 987],
                        ["536 + 246 + 116", 898],
                        ["263 + 317 + 419", 999],
                        ["714 + 127 + 148", 989],
                        ["355 + 438 + 106", 899],
                        ["443 + 272 + 103", 818],
                        ["338 + 218 + 330", 886],
                        ["111 + 231 + 129", 471]
                             ]
            //while (res < 100 || res > 999) {
            //        res = Math.floor(random() * 400) + 100;
            //        question = res.toString() + " ";


            //        for (var i = 0; i < 2; i++) {

            //                var value = Math.floor(random() * 400) + 100;

            //                if (random() > 0.5) {

            //                        res = res + value;
            //                        question += "+ ";
            //                }
            //                else {
            //                        res = res - value;
            //                        question += "- ";


            //                }

            //                question += value.toString() + " ";


            //        }
            //}

            //window1.nextAnswer = res;
            //window1.nextQuestion = question;

            var index = window1.count;
            if (window1.demoDone) {index += 3;}

            if (index > window1.nb_expe_rounds) {return;}

            window1.nextAnswer = questions[index][1];
            window1.nextQuestion = questions[index][0];
    }

    function saveQuestions() {
            var date = new Date();

            var log = [window1.starttime];
            for(var i = 0; i < window1.nb_expe_rounds; i++) {
                log.push(window1.answers[i]);
                log.push(window1.answersResponseTimes[i]);
                log.push(window1.dialogDismissResponseTimes[i]);
            }

            log.push(genderquestion.gender,
                     agequestion.age,
                     question1.result,
                     question3.result,
                     question4.result,
                     question5.result,
                     question6.result,
                     question7.result,
                     question8.result,
                     familiaquestion.result,
                     date.getTime());

            print("Questions results:");
            print(log.join(","));

            fileio.write(window1.logfilename, log.join(","));
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

    // taken from http://stackoverflow.com/questions/10073699/pad-a-number-with-leading-zeros-in-javascript#10073788
    function pad(n, width, z) {
            z = z || '0';
            n = n + '';
            return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
    }
}
