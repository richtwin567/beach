import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import "components"

Item{
    id: container

    readonly property PaletteColours colours: PaletteColours{}

    property bool loginFailed

    Background{
        anchors.fill: parent
    }



    GridLayout {
        id: grid
        anchors.left: parent.left
        anchors.leftMargin: 15
        flow: GridLayout.TopToBottom
        layoutDirection: Qt.LeftToRight
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        rowSpacing: 5
        columnSpacing: 8
        rows: 6
        columns: 3

        DayOfTheWeek {
            id: dayOfTheWeek
        }

        ControlBar {
            id: controlBar
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.rowSpan: 4
        }

        Rectangle{
            height: 50
            color: colours.transparent
            width: 0
        }

        Separator {
            id: separator
            Layout.rowSpan: 6
            lineLength: dayOfTheWeek.height + controlBar.height
            gridHeight: grid.height
        }

        TimeText {
            id: timeText
        }

        DateText {
            id: dateText
        }

        UserChooser {
            id: userChooser
            Layout.fillWidth: true
            Layout.preferredWidth: timeText.width*1.5
            Layout.preferredHeight: passwordInput.height
        }

        Row{
            id: row
            Layout.preferredHeight: passwordInput.height
            Layout.preferredWidth: passwordInput.width
            PasswordInput {
                id: passwordInput
                Layout.fillWidth: true
                width: timeText.width*1.5
                loginFailed: container.loginFailed
                Keys.onEnterPressed: container.login()
                Keys.onReturnPressed: container.login()
            }
            CapsLockIndicator{
                id:capsindicator
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        LoginButton {
            id: loginButton
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            onClicked: container.login();
            Keys.onEnterPressed: container.login();
            Keys.onReturnPressed: container.login();
        }
    }

    function login(){
        var user = userChooser.selectedUser
        var pass = passwordInput.text;

        sddm.login(user,pass,sessionModel.lastIndex);
    }

    Connections {
        target: sddm
        onLoginSucceeded: {
        }
        onLoginFailed: {
            container.loginFailed = true
            if(resetError.running){
                resetError.stop();
                resetError.start();
            }else{
                resetError.start();
            }
        }
    }

    Timer {
        id: resetError
        interval: 4000
        onTriggered: container.loginFailed = false
        running: false
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
