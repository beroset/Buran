import QtQuick 2.4
import QtQuick.Controls 2.15
import Qt.labs.settings 1.0
import Qt.labs.platform
Item {
    Rectangle {
        color: "#FFFFFF"
        opacity: 0.8
        radius: 8
        anchors.fill: parent
        anchors.margins: 18
        Flickable {
            anchors.fill: parent
            anchors.margins: 8
            Settings {
                id: settings
                property alias uiStyle: uiSwitch.position
                property alias uiAccentColor: colorDialog.color
            }
            Column {
                Row {
                    Switch { //The switch between Mobile and desktop UI
                        id: uiSwitch
                    }
                    Label {
                        text: "Enable the mobile UI"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                //TODO: add an adjustment to the number of columns in the menubar. The two values should be independent for mobile and desktop.
                Button {
                    onPressed: {
                        colorDialog.visible = true
                    }
                    text: qsTr("pick UI accent colour")
                }
                ColorDialog {
                    id: colorDialog
                    title: "Please choose a color"
                    onAccepted: {
                        visible = false
                    }
                    onRejected: {
                        visible = false
                    }
                    //Component.onCompleted: visible = false
                }

                Button {
                    text: "reload UI"
                    onClicked: reloadUI()
                }
            }
        }
    }
}
