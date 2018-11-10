using Toybox.Application;
using Toybox.WatchUi;

class Twelve extends Toybox.WatchUi.Drawable {
    hidden var x;
    hidden var y;
    hidden var width;
    hidden var height;
    hidden var type;

   	hidden var penWidth = 4;
   	hidden var dotPenWidth = 6;
   	hidden var rectangleRadius = 2;
   	hidden var dotSpacing = 4;

    function initialize(options) {
        Toybox.WatchUi.Drawable.initialize(options);

        x = options[:x];
        y = options[:y];
        width = options[:width];
        height = options[:height];
        type = options[:type];
    }

    function draw(dc) {
		var color = (type == :hour ?
			Application.getApp().getProperty("HourColor") :
			Application.getApp().getProperty("MinuteColor"));

   		dc.setPenWidth(penWidth);
        dc.setColor(color, color);

        var clockTime = System.getClockTime();
		var value = (type == :hour ? (clockTime.hour % 12) : (clockTime.min / 5));

        var drawTop = (value == 0 || value == 1 || value == 2 || value == 8 || value == 10 || value == 11);
        var drawRight = (value == 1 || value == 2 || value == 3 || value == 4 || value == 5 || value == 11);
        var drawBottom = (value == 2 || value == 4 || value == 5 || value == 6 || value == 7 || value == 8);
        var drawLeft = (value == 5 || value == 7 || value == 8 || value == 9 || value == 10 || value == 11);

        var drawCenterDot = (type == :hour && (clockTime.hour / 12 > 0));

        var drawTopDot = (type == :minute && (clockTime.min % 5 >= 1));
        var drawRightDot = (type == :minute && (clockTime.min % 5 >= 2));
        var drawBottomDot = (type == :minute && (clockTime.min % 5 >= 3));
        var drawLeftDot = (type == :minute && (clockTime.min % 5 == 4));

        if (drawTop) {
        	dc.drawRoundedRectangle(x, y, width, penWidth, rectangleRadius);
        }
        if (drawRight) {
        	dc.drawRoundedRectangle(x + width - penWidth, y, penWidth, height, rectangleRadius);
        }
        if (drawBottom) {
        	dc.drawRoundedRectangle(x, y + height - penWidth, width, penWidth, rectangleRadius);
        }
        if (drawLeft) {
        	dc.drawRoundedRectangle(x, y, penWidth, height, rectangleRadius);
        }

   		dc.setPenWidth(dotPenWidth);
        if (drawCenterDot) {
        	dc.drawCircle(x + width/2, y + height/2, 0);
        }

        if (drawTopDot) {
        	dc.drawCircle(x + width/2, y - dotPenWidth - dotSpacing, 0);
        }
        if (drawRightDot) {
        	dc.drawCircle(x + width + dotPenWidth + dotSpacing - (dotPenWidth - penWidth), y + height/2, 0);
        }
        if (drawBottomDot) {
        	dc.drawCircle(x + width/2, y + height + dotPenWidth + dotSpacing- (dotPenWidth - penWidth), 0);
        }
        if (drawLeftDot) {
        	dc.drawCircle(x - dotPenWidth - dotSpacing, y + height/2, 0);
        }
    }
}
