using Toybox.Application;
using Toybox.WatchUi;

class Battery extends Toybox.WatchUi.Drawable {
    hidden var x;
    hidden var y;
    hidden var width;
    hidden var height;

    hidden var penWidth = 1;
    hidden var rectangleRadius = 1;

    hidden var lowBatteryLevel = 0.25;
    hidden var criticalBatteryLevel = 0.1;

    function initialize(options) {
        Toybox.WatchUi.Drawable.initialize(options);

        x = options[:x];
        y = options[:y];
        width = options[:width];
        height = options[:height];
    }

    function draw(dc) {
	    var battery = System.getSystemStats().battery / 100.0;

		var color = Graphics.COLOR_GREEN;
		if (battery <= lowBatteryLevel) {
			color = Graphics.COLOR_YELLOW;
		}
		if (battery <= criticalBatteryLevel) {
			color = Graphics.COLOR_RED;
		}

		var drawWidth = 4 + battery * (width - 8);

		dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
		dc.setPenWidth(penWidth);
		dc.drawRoundedRectangle(x, y, width, height, rectangleRadius);
		dc.drawRectangle(x + width, y + height/4, 2, height / 2);

		dc.setColor(color, Graphics.COLOR_TRANSPARENT);
		dc.fillRoundedRectangle(x + 2, y + 2, drawWidth, height - 4, rectangleRadius);
    }
}
