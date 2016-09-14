import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1

Item {
    id: likertscale
    width: childrenRect.width
    height: childrenRect.height

    property string question: "I felt I was evaluated during the experiment for the quality of my work"
    property string subquestion1: ""
    property string subquestion2: ""
    property string minText: "Not at all"
    property string maxText: "Very much"

    onSubquestion1Changed: {
        if (subquestion1 === "") {
            subquestionText1.visible = false;
            subquestionItem2.visible = false;
        }
        else {
            subquestionText1.visible = true;

            if (subquestion2 != "") {
                subquestionItem2.visible = true;
            }
        }
    }

    onSubquestion2Changed: {
        if (subquestion2 === "") {
            subquestionItem2.visible = false;
            return;
        }

        if (subquestion1 != "") {
            subquestionItem2.visible = true;
        }
    }

    ColumnLayout {
        id: question
        width: 900
        spacing: 20

        Text {
            id: questionText
            color: "#ffffff"
            text: likertscale.question
            font.pixelSize: 24
        }

        Row {
            id: subquestionItem1
            anchors.right: parent.right
            anchors.rightMargin: 0
            spacing: 32

            Text {
                id: subquestionText1
                color: "#b4b4b4"
                text: likertscale.subquestion1
                font.pixelSize: 20
                visible: false
            }

            Row {
                id: row1
                spacing: 7

                Label {
                    id: minText1
                color: "#b4b4b4"
                    text: likertscale.minText
                }

                Slider {
                    id: scale
                    width: 400
                    tickmarksEnabled: true
                    minimumValue: 1
                    value: 3
                    stepSize: 1
                    maximumValue: 5
                }

                Label {
                    id: maxText1
                color: "#b4b4b4"
                    text: likertscale.maxText
                }

            }
        }

        Row {
            id: subquestionItem2
            visible: false
            anchors.right: parent.right
            anchors.rightMargin: 0
            Text {
                id: subquestionText2
                color: "#b4b4b4"
                text: likertscale.subquestion2
                font.pixelSize: 20
            }

            Row {
                id: row4
                Label {
                    id: minText2
                color: "#b4b4b4"
                    text: likertscale.minText
                }

                Slider {
                    id: scale1
                    width: 400
                    value: 3
                    stepSize: 1
                    tickmarksEnabled: true
                    minimumValue: 1
                    maximumValue: 5
                }

                Label {
                    id: maxText2
                color: "#b4b4b4"
                    text: likertscale.maxText
                }
                spacing: 7
            }
            spacing: 32
        }



    }


}

