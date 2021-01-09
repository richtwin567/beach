import QtQuick 2.12
import QtQuick.Controls 2.4

Button{
    id: loginBtn

    readonly property Fonts fonts:Fonts{}
    readonly property PaletteColours colours: PaletteColours{}

    background: Rectangle{
        anchors.fill: parent
        color: colours.transparent
    }

    contentItem: Row{
        id: row
        spacing: 12
        Text {
            id: loginText
            text: "LOG IN"
            anchors.verticalCenter: parent.verticalCenter
            color: colours.mintCream
            font {
                pointSize: 22
                family: fonts.robotoCondensed.name
            }
        }

        Image{
            id: arrow
            anchors.verticalCenter: parent.verticalCenter
            source: "../assets/next.svg"
            sourceSize{
                height: hiddenImg.sourceSize.height*1.8
                width: hiddenImg.sourceSize.width*1.8
            }

            Image{
                id:hiddenImg
                source: parent.source
                width:0
                height:0

            }
        }
    }
}




/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
