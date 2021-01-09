import QtQuick 2.12
import QtQuick.Controls 2.4

TextField{
    id: passwordInput

    readonly property Fonts fonts: Fonts{}
    readonly property PaletteColours colours: PaletteColours{}

    property bool loginFailed

    passwordMaskDelay: 500
    passwordCharacter: "•"
    echoMode: TextInput.Password
    placeholderText: "Password"
    placeholderTextColor: colours.maximumBlueGreen
    color: colours.middleGreyBrown

    font{
        family: fonts.robotoCondensed.name
        pointSize: 18
    }

    states: [
        State {
            name: "focus"
            when: passwordInput.activeFocus && !passwordInput.loginFailed

            PropertyChanges {
                target: bg
                color: colours.mintCream
            }
        },
        State {
            name: "incorrect"
            when: passwordInput.loginFailed

            PropertyChanges {
                target: bg
                color: colours.chinaRoseRed
            }
        }
    ]

    transitions: [

           Transition {
               id: transition
               reversible: true
               from: "*"
               to: "*"

               ColorAnimation {
                   target: bg
                   duration: 100
               }

           }
       ]

    background: Rectangle{
        id: bg
        anchors.fill: parent
        color: colours.blizzardBlue
        border.color: colours.transparent
    }



}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
