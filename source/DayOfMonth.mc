using Toybox.Application;
using Toybox.WatchUi;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;

class DayOfMonth extends Toybox.WatchUi.Drawable {
    hidden var x;
    hidden var y;
    hidden var color;

    function initialize(options) {
        Toybox.WatchUi.Drawable.initialize(options);

        x = options[:x];
        y = options[:y];
        color = options[:color];
    }

    function draw(dc) {
    	Toybox.WatchUi.Drawable.draw(dc);

        var clockTime = System.getClockTime();
        var today = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
        var dateString = Lang.format("$1$", [today.day]);

		dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, Graphics.FONT_TINY, dateString, Graphics.TEXT_JUSTIFY_LEFT);
    }
}
