import QtQuick 2.12

QtObject{
    readonly property FontLoader b612mono: FontLoader{
        id: b612mono
        source: "../assets/B612Mono-Regular.ttf"
    }

    readonly property FontLoader robotoCondensed: FontLoader{
        id: robotoCondensed
        source: "../assets/RobotoCondensed-Regular.ttf"
    }

}
