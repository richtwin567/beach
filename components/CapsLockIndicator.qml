import QtQuick 2.0

Image {
    id: capslockindicator
    source: "../assets/caps_lock.svg"
    opacity:0
    sourceSize.height: hidden.sourceSize.height*1.5
    sourceSize.width: hidden.sourceSize.width*1.5

    Image {
        id: hidden
        source: parent.source
        width:0
        height:0
    }

    states: [
        State {
            name: "on"
            when: keyboard.capsLock

            PropertyChanges {
                target: capslockindicator
                opacity: 1
            }
        }
    ]
}
