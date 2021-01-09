import QtQuick 2.12
import QtQuick.Controls 2.4

ComboBox{
    id: userComboBox

    readonly property Fonts fonts: Fonts{}
    readonly property PaletteColours colours: PaletteColours{}

    property string selectedUser: userComboBox.currentText.toLocaleLowerCase()

    model: userModel
    currentIndex: userModel.lastIndex
    textRole:"name"
    font{
        pointSize: 18
        family: fonts.robotoCondensed.name
    }

    popup:  Popup {
        x: userComboBox.width+1
        width: userComboBox.width
        padding: 0

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: userComboBox.popup.visible ? userComboBox.delegateModel : null
            currentIndex: userComboBox.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator { }
        }

    }

    delegate: ItemDelegate{
        width: parent.width

        contentItem: Text {
            id: userDelegate
            text: model.name
            font.capitalization: Font.Capitalize
            font.family: fonts.robotoCondensed.name
            color: colours.maximumBlueGreen
            font.pointSize: 18
        }

        background: Rectangle{
            anchors.fill: parent
            color: colours.white
            border.width: 0
            border.color: colours.transparent
        }
    }

    background: Rectangle{
        anchors.fill: parent
        color: colours.mintCream
    }

    contentItem: Text {
        id: userSelected
        text: userComboBox.displayText
        leftPadding: 8
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignLeft
        font.capitalization: Font.Capitalize
        font.family: fonts.robotoCondensed.name
        color: colours.middleGreyBrown
        font.pointSize: 18
    }

    indicator: Canvas{
        width:16
        height: 28
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 5
        contextType: "2d"
        onPaint: {
            context.reset();
            context.beginPath();
            context.moveTo(0, 0);
            context.lineTo((width-4), (height-4)/2);
            context.lineTo(0, height-4);
            context.strokeStyle=colours.middleGreyBrown;
            context.lineWidth = 3
            context.stroke();
        }
    }

    onCurrentIndexChanged: {
        selectedUser = currentText.toLowerCase();
    }

    onCurrentTextChanged: {
        selectedUser = currentText.toLowerCase();
    }

    Component.onCompleted: {
        selectedUser = userComboBox.currentText.toLowerCase();
    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
