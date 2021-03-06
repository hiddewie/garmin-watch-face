using Toybox.Application;
using Toybox.WatchUi;

class App extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state) {
    }

    function onStop(state) {
    }

    function getInitialView() {
        return [new WatchFaceView()];
    }

    function onSettingsChanged() {
        WatchUi.requestUpdate();
    }

}