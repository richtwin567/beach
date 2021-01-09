import QtQuick 2.12

Column{
    id: column

    readonly property PaletteColours colours: PaletteColours{}

    property real lineLength
    property real gridHeight
    spacing: 10

    Rectangle{
        id: firstLine
        height: lineLength
        width: 6
        color: colours.blizzardBlue
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle{
        id: ring

        radius: 35
        anchors.horizontalCenter: parent.horizontalCenter
        width: 50
        height :50
        border{
            color: colours.white
            width: 6
        }
        color: colours.transparent

        TimeOfDayIndicator{
            anchors.centerIn: ring
        }

    }

    Rectangle{
        width: 6
        height: 15
        color: colours.blizzardBlue
        anchors.horizontalCenter: parent.horizontalCenter
    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
