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
		var showSteps = Application.getApp().getProperty("ShowSteps");
		if (!showSteps) {
			return;
		}

		var info = ActivityMonitor.getInfo();

		if (info != null && info.steps != null && info.stepGoal != null && info.stepGoal > 0) {
			var steps = info.steps;
			var goal = info.stepGoal;
			var x = steps.toFloat() / goal;
			if (x > 1.0) {
				x = 1.0;
			}

    		var color = Application.getApp().getProperty("StepsColor");
			dc.setColor(color, Graphics.COLOR_TRANSPARENT);

			dc.setPenWidth(penWidth);
			dc.drawArc(108, 90, 109 - 5, Graphics.ARC_CLOCKWISE, -115 + 1, -115 - (availableDegrees * x));
		}
    }
}
