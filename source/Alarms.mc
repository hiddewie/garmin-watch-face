using Toybox.Application;
using Toybox.WatchUi;

class Alarms extends Toybox.WatchUi.Drawable {
    hidden var x;
    hidden var y;
    hidden var color;

    hidden var alarm;

    function initialize(options) {
        Toybox.WatchUi.Drawable.initialize(options);

        x = options[:x];
        y = options[:y];
        color = options[:color];

        alarm = new WatchUi.Bitmap({
            :rezId => Rez.Drawables.alarm,
            :locX => x,
            :locY => y
        });

    }

    function draw(dc) {
    	var alarms = System.getDeviceSettings().alarmCount;

		dc.setColor(color, Graphics.COLOR_TRANSPARENT);
		if (alarms >= 1) {
			alarm.draw(dc);

			if (alarms >= 2) {
				dc.drawText(x + 18, y - 2, Graphics.FONT_TINY, alarms, Graphics.TEXT_JUSTIFY_LEFT);
			}
		}
    }
}
