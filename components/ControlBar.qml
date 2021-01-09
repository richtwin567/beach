import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.4

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

GridLayout {
    id: controlBtns

    readonly property Fonts fonts: Fonts{}
    readonly property PaletteColours colours: PaletteColours{}
    columnSpacing: 18
    rowSpacing: 10
    columns: 2
    rows: 3
    layoutDirection: Qt.RightToLeft
    flow: GridLayout.TopToBottom

    //spacing: 0

    Repeater{
        id: repeater
        Layout.alignment: Qt.AlignTop | Qt.AlignVCenter
        Layout.fillHeight: true
        Layout.fillWidth: true
        model: SystemControlsModel{}

        RoundButton{
            id: roundButton
            display: config.ShowSystemControlButtonLabels==="true"? AbstractButton.TextUnderIcon : AbstractButton.IconOnly
            icon.source: Qt.resolvedUrl(model.pathToIcon)
            icon.width: 35
            icon.height: 35
            icon.color: colours.blizzardBlue
            background: Rectangle {
                height: 30
                color: colours.transparent
                radius: 15
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                border.color: colours.transparent
                width: 30
            }
            Keys.onReturnPressed: clicked()
            Keys.onEnterPressed: clicked()
            onClicked: {
                if(model.name=== "Shutdown"){
                    sddm.powerOff();
                }
                if(model.name==="Restart"){
                    sddm.reboot();
                }
                if(model.name==="Suspend"){
                    sddm.suspend();
                }
                if(model.name==="Hibernate"){
                    sddm.hibernate();
                }
                if(model.name==="Hybrid Sleep"){
                    sddm.hybridSleep();
                }
            }

            Component.onCompleted: {
                if( config.ShowSystemControlButtonLabels==="true"){
                    Qt.createQmlObject(
                                "import QtQuick 2.12; Text {
                id: btnLabel;
                text: model.name;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.bottom: parent.bottom;
                anchors.bottomMargin: -btnLabel.height;
                font.family: fonts.robotoCondensed.name;
                font.pointSize: 11;
                color: colours.blizzardBlue;
            }",
                                roundButton
                                );
                }
            }
        }
    }
}


