import QtQuick 2.12
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0

Item{
    Image {
        id: backgroundImage
        anchors.fill: parent
        source: Qt.resolvedUrl("../assets/beach.jpg")
        fillMode: Image.PreserveAspectCrop
        z: -5
    }

    LinearGradient {
        id: mask
        anchors.fill: backgroundImage
        gradient: Gradient {
            GradientStop { position: 0.6; color: "#ffffffff" }
            GradientStop { position: 0.9; color: "#00ffffff" }
        }
        start: Qt.point(0, 0)
        end: Qt.point(parent.width*0.7, 0)
        visible: false
    }

    MaskedBlur {
        anchors.fill: backgroundImage
        source: backgroundImage
        maskSource: mask
        radius: 12
        samples: 20
    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
