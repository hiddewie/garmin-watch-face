using Toybox.WatchUi;
using Toybox.Application;
using Toybox.Graphics;

class Background extends WatchUi.Drawable {

    function initialize() {
        var dictionary = {
            :identifier => "Background"
        };

        Drawable.initialize(dictionary);
    }

    function draw(dc) {
        // Set the background color then call to clear the screen
//        System.println(Application.getApp().getProperty("BackgroundColor"));
        dc.setColor(Graphics.COLOR_BLUE, Application.getApp().getProperty("BackgroundColor"));
        dc.clear();
    }

}
