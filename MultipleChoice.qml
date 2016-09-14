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

    ColumnLayout {
        id: question
        width: 900
        spacing: 12

        Text {
            id: questionText
            color: "#ffffff"
            text: multiplechoice.question
            font.pixelSize: 24
        }
        ExclusiveGroup { id: choiceGroup }
        RowLayout {
            spacing: 10

            Text {
                color: "#b4b4b4"
                text: multiplechoice.answer1
                font.pixelSize: 20
            }

            RadioButton {
                id: answer1
                exclusiveGroup: choiceGroup
            }
            Text {
                color: "#b4b4b4"
                text: multiplechoice.answer2
                font.pixelSize: 20
            }

            RadioButton {
                id: answer2
                exclusiveGroup: choiceGroup
            }

            Text {
                color: "#b4b4b4"
                text: multiplechoice.answer3
                font.pixelSize: 20
            }

            RadioButton {
                id: answer3
                exclusiveGroup: choiceGroup
            }

            Text {
                color: "#b4b4b4"
                text: multiplechoice.answer4
                font.pixelSize: 20
            }

            RadioButton {
                id: answer4
                exclusiveGroup: choiceGroup
            }

        }



    }


}

