using Toybox.Application;
using Toybox.WatchUi;

class Twelve extends Toybox.WatchUi.Drawable {
    hidden var x;
    hidden var y;
    hidden var type;

   	hidden var fontHeight = 100 + 12;
   	hidden var smallFontHeight = 48 + 8;
   	hidden var fontWidth = 40;

   	var font, fontNumber, fontNumberSmall;

    function initialize(options) {
        Toybox.WatchUi.Drawable.initialize(options);
		fontNumber = Toybox.WatchUi.loadResource(Rez.Fonts.PragmataPro_number);
		fontNumberSmall = Toybox.WatchUi.loadResource(Rez.Fonts.PragmataPro_number_small);

        x = options[:x];
        y = options[:y];
        type = options[:type];
    }

    function draw(dc) {
		var color = (type == :hour ?
			Application.getApp().getProperty("HourColor") :
			Application.getApp().getProperty("MinuteColor"));

        var clockTime = System.getClockTime();
		var largeValue = (type == :hour ? (clockTime.hour % 12) : (clockTime.min / 5));
		var smallValue = (type == :minute ? clockTime.min % 5 : clockTime.hour / 12);

        dc.setColor(color, Graphics.COLOR_TRANSPARENT);

		if (0 <= largeValue && largeValue <= 9) {
			dc.drawText(type == :minute ? x : x, y + height/2 - fontHeight/2, fontNumber, largeValue.toString(), Graphics.TEXT_JUSTIFY_CENTER);
		} else if (largeValue <= 12) {
        	dc.drawText(type == :minute ? x : x, y + height/2 - fontHeight/2, fontNumber, largeValue == 10 ? "↊" : "↋", Graphics.TEXT_JUSTIFY_CENTER);
		}

		dc.drawText(x + (type == :minute ? 1 : -1) * fontWidth, y + height/2 - smallFontHeight/2, fontNumberSmall, smallValue.toString(), Graphics.TEXT_JUSTIFY_CENTER);
    }
}
