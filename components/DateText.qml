import QtQuick 2.12

Text{
    readonly property PaletteColours colours: PaletteColours{}
    readonly property Fonts fonts: Fonts{}

    color: colours.blizzardBlue
    font{
        family: fonts.b612mono.name
        pointSize:18
        capitalization: Font.AllUppercase
    }

    function update(){
        const date = new Date();
        text = Qt.formatDate(date, "MMM dd");
    }

    Timer{
        interval: 1000
        running: true
        repeat: true
        onTriggered: update()
    }

    Component.onCompleted: update()
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
