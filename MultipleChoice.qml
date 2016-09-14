import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1

Item {
    id: multiplechoice
    width: childrenRect.width
    height: childrenRect.height

    property string question: "My question"
    property string answer1: "Answer 1"
    property string answer2: "Answer 2"
    property string answer3: "Answer 3"
    property string answer4: "Answer 4"

    property bool answered: choiceGroup.current !== null

    property int result: {if(choiceGroup.current) {result = choiceGroup.current.objectName;} else {result = "";}}

    ColumnLayout {
        id: question
        width: 1800
        spacing: 50

        Text {
            id: questionText
            color: "#ffffff"
            text: multiplechoice.question
            font.pixelSize: 50
        }
        ExclusiveGroup { id: choiceGroup }
        RowLayout {
            spacing: 10

            Text {
                color: "#b4b4b4"
                text: multiplechoice.answer1
                font.pixelSize: 40
            }

            RadioButton {
                id: answer1
                exclusiveGroup: choiceGroup
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
                text: multiplechoice.answer2
                font.pixelSize: 40
            }

            RadioButton {
                id: answer2
                exclusiveGroup: choiceGroup
                style: answer1.style
            }

            Text {
                color: "#b4b4b4"
                text: multiplechoice.answer3
                font.pixelSize: 40
            }

            RadioButton {
                id: answer3
                exclusiveGroup: choiceGroup
                                style: answer1.style
            }

            Text {
                color: "#b4b4b4"
                text: multiplechoice.answer4
                font.pixelSize: 40
            }

            RadioButton {
                id: answer4
                exclusiveGroup: choiceGroup
                                style: answer1.style
            }

        }



    }


}

