using Toybox.Application;
using Toybox.WatchUi;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;

class DayOfWeek extends Toybox.WatchUi.Drawable {
    hidden var x;
    hidden var y;

    function initialize(options) {
        Toybox.WatchUi.Drawable.initialize(options);

        x = options[:x];
        y = options[:y];
    }

    function draw(dc) {
    	Toybox.WatchUi.Drawable.draw(dc);

        var clockTime = System.getClockTime();
        var today = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
        var dateString = Lang.format("$1$", [today.day_of_week]);

    	var color = Application.getApp().getProperty("DayOfWeekColor");

		dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, Graphics.FONT_TINY, dateString, Graphics.TEXT_JUSTIFY_RIGHT);
    }
}
