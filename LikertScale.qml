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

    property int result: scale.value
    property int result2: scale1.value

    function reset() {
        scale1.value = 3;
        scale.value = 3;
    }

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
        width: 1800
        spacing: 50

        Text {
            id: questionText
            color: "#ffffff"
            text: likertscale.question
            font.pixelSize: 50
        }

        Row {
            id: subquestionItem1
            anchors.right: parent.right
            anchors.rightMargin: 0
            spacing: 100

            Text {
                id: subquestionText1
                color: "#b4b4b4"
                text: likertscale.subquestion1
                font.pixelSize: 40
                visible: false
            }

            Row {
                id: row1
                spacing: 20

                Text {
                    id: minText1
                    color: "#b4b4b4"
                    text: likertscale.minText
                    font.pixelSize: 30
                }

                Slider {
                    id: scale
                    width: 800
                    tickmarksEnabled: true
                    minimumValue: 1
                    value: 3
                    stepSize: 1
                    maximumValue: 5
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
                        tickmarks: Repeater {
                            id: repeater
                            model: control.stepSize > 0 ? 1 + (control.maximumValue - control.minimumValue) / control.stepSize : 0
                            width: control.width
                            height: control.height
                            Rectangle {
                                color: "#999"
                                width: 16 ; height: width; radius: width/2
                                y: control.height - 10
                                x: (repeater.width/(repeater.count - 1) * index) - radius
                                opacity: control.enabled ? 1 : 0.6
                            }
                        }
                    }

                }

                Text {
                    id: maxText1
                    color: "#b4b4b4"
                    text: likertscale.maxText
                    font.pixelSize: 30
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
                font.pixelSize: 40
            }

            Row {
                id: row4
                Text {
                    id: minText2
                    color: "#b4b4b4"
                    text: likertscale.minText
                    font.pixelSize: 30
                }

                Slider {
                    id: scale1
                    width: 800
                    value: 3
                    stepSize: 1
                    tickmarksEnabled: true
                    minimumValue: 1
                    maximumValue: 5
                    style: scale.style
                }

                Text {
                    id: maxText2
                    color: "#b4b4b4"
                    text: likertscale.maxText
                    font.pixelSize: 30
                }
                spacing: 20
            }
            spacing: 100
        }



    }


}

