using Toybox.Application;
using Toybox.WatchUi;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;

class DayOfMonth extends Toybox.WatchUi.Drawable {
    hidden var x;
    hidden var y;
    hidden var color;

    function initialize(options as Toybox.Lang.Dictionary) {
        Toybox.WatchUi.Drawable.initialize(options);

    	color = Application.Properties.getValue("DayOfMonthColor");

        x = options[:x];
        y = options[:y];
    }

    function draw(dc) {
    	Toybox.WatchUi.Drawable.draw(dc);

        var today = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
        var dateString = Lang.format("$1$", [today.day]);

		dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, Graphics.FONT_TINY, dateString, Graphics.TEXT_JUSTIFY_LEFT);
    }
}
