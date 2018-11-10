using Toybox.Application;
using Toybox.WatchUi;
using Toybox.ActivityMonitor;

class Move extends Toybox.WatchUi.Drawable {

   	hidden var penWidth = 6;
    hidden var availableDegrees = 130;

    function initialize(options) {
        Toybox.WatchUi.Drawable.initialize(options);
    }

    function draw(dc) {
		var info = ActivityMonitor.getInfo();

		if (info != null && info.moveBarLevel != null) {
			var level = info.moveBarLevel;

			var drawFirst = (level >= 1);
			var drawSecond = (level >= 2);
			var drawThird = (level >= 3);
			var drawFourth = (level >= 4);
			var drawFifth = (level == 5);

			dc.setPenWidth(penWidth);

			if (drawFirst) {
				dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
				dc.drawArc(108, 90, 109 - 5, Graphics.ARC_COUNTER_CLOCKWISE, -65, -1);
			}
			if (drawSecond) {
				dc.setColor(Graphics.COLOR_YELLOW, Graphics.COLOR_TRANSPARENT);
				dc.drawArc(108, 90, 109 - 5, Graphics.ARC_COUNTER_CLOCKWISE, 1, 14);
			}
			if (drawThird) {
				dc.setColor(Graphics.COLOR_YELLOW, Graphics.COLOR_TRANSPARENT);
				dc.drawArc(108, 90, 109 - 5, Graphics.ARC_COUNTER_CLOCKWISE, 16, 29);
			}
			if (drawFourth) {
				dc.setColor(Graphics.COLOR_YELLOW, Graphics.COLOR_TRANSPARENT);
				dc.drawArc(108, 90, 109 - 5, Graphics.ARC_COUNTER_CLOCKWISE, 31, 44);
			}
			if (drawFifth) {
				dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
				dc.drawArc(108, 90, 109 - 5, Graphics.ARC_COUNTER_CLOCKWISE, 46, 65);
			}
		}
    }
}
