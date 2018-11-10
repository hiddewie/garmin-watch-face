using Toybox.Application;
using Toybox.WatchUi;
using Toybox.ActivityMonitor;

class Steps extends Toybox.WatchUi.Drawable {

   	hidden var penWidth = 6;
    hidden var availableDegrees = 130;

    function initialize(options) {
        Toybox.WatchUi.Drawable.initialize(options);
    }

    function draw(dc) {
		var info = ActivityMonitor.getInfo();

		if (info != null && info.steps != null && info.stepGoal != null && info.stepGoal > 0) {
			var steps = info.steps;
			var goal = info.stepGoal;
			var x = steps.toFloat() / goal;

			dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_TRANSPARENT);
			dc.setPenWidth(penWidth);
			dc.drawArc(108, 90, 109 - 5, Graphics.ARC_CLOCKWISE, -115 + 1, -115 - (availableDegrees * x));
		}
    }
}
