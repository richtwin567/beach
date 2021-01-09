import QtQuick 2.12

Image{
    id: timeIndicator
    sourceSize.height: hiddenImg.sourceSize.height*1.3
    sourceSize.width: hiddenImg.sourceSize.width*1.3
    source: "../assets/moon.svg"

    Image {
      id: hiddenImg
      source: parent.source
      width: 0
      height: 0
    }

    function update(){
        const date = new Date();
        const hour = date.getHours()-12;
        source = hour>=0? "../assets/moon.svg" : "../assets/sun.svg"
    }

    Component.onCompleted: update()

    Timer{
        running: true
        repeat: true
        interval: 1000
        onTriggered: update()
    }


}


