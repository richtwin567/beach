import QtQuick 2.12

Row{

    Text{
        id:hour
        readonly property PaletteColours colours: PaletteColours{}
        readonly property Fonts fonts: Fonts{}

        color: colours.white
        font{
            family: fonts.b612mono.name
            pointSize:45
            capitalization: Font.AllUppercase
        }

        function update(){
            const date = new Date();
            text = Qt.formatTime(date, "hh");
        }

    }

    Text{
        id:minute
        readonly property PaletteColours colours: PaletteColours{}
        readonly property Fonts fonts: Fonts{}

        color: colours.blizzardBlue
        font{
            family: fonts.b612mono.name
            pointSize:45
            capitalization: Font.AllUppercase
        }

        function update(){
            const date = new Date();
            text = Qt.formatTime(date, "mm");
        }
    }

    Timer{
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            minute.update();
            hour.update();
        }
    }

    Component.onCompleted: {
        minute.update();
        hour.update();
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
