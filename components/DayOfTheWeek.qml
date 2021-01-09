import QtQuick 2.12
Item{
    id: element
    readonly property PaletteColours colours: PaletteColours{}
    readonly property Fonts fonts: Fonts{}
    width: longday.width
    height:longday.height


    Text {
        id: longday
        text: "WEDNESDAY"
        font{
            family: fonts.b612mono.name
            pointSize: 45
            capitalization: Font.AllUppercase
        }
        color: colours.transparent
    }

    Text{
        id:visibleDay

        color: colours.white
        anchors.right: longday.right
        anchors.rightMargin: 0
        font{
            family: fonts.b612mono.name
            pointSize: 45
            capitalization: Font.AllUppercase
        }

        function update(){
            const date = new Date();
            text = Qt.formatDate(date, "dddd");
        }
    }

    Timer{
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            visibleDay.update();
        }
    }

    Component.onCompleted:{
        visibleDay.update();
    }

}

