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
        dc.setColor(Graphics.COLOR_BLUE, Application.Properties.getValue("BackgroundColor"));
        dc.clear();
    }

}
