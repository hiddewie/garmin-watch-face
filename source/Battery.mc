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

    function initialize(options as Toybox.Lang.Dictionary) {
        Toybox.WatchUi.Drawable.initialize(options);

        x = options[:x];
        y = options[:y];
        width = options[:width];
        height = options[:height];
    }

    function draw(dc) {
		var showBattery = Application.Properties.getValue("ShowBattery");
		if (!showBattery) {
			return;
		}

		var stats = System.getSystemStats();
	    var battery = stats.battery / 100.0;
		var charging = stats.charging;

		var color = Graphics.COLOR_GREEN;
		if (battery <= lowBatteryLevel) {
			color = Graphics.COLOR_YELLOW;
		}
		if (battery <= criticalBatteryLevel) {
			color = Graphics.COLOR_RED;
		}
		if (charging) {
			color = Graphics.COLOR_BLUE;
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
