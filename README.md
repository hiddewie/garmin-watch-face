
# Garmin Watchface

![Screenshot](documentation/Watch.jpg)

This project creates a watch face using a base-12 hour and minute notation.

Features:
- Base 12 hour and minute notation
- Alarm (icon for one alarm, number for more than one alarm)
- Battery
- Steps as part of goal
- Move indicator
- Day of week and day of month


### Explanation of base-12 notation

The numbers:

0-2
![0](documentation/0.JPG)
![1](documentation/1.JPG)
![2](documentation/2.JPG)

3-5
![3](documentation/3.JPG)
![4](documentation/4.JPG)
![5](documentation/5.JPG)

6-8
![6](documentation/6.JPG)
![7](documentation/7.JPG)
![8](documentation/8.JPG)

9-11
![9](documentation/9.JPG)
![10](documentation/10.JPG)
![11](documentation/11.JPG)

##### Hour

The hour notation is two times 12 hours. The first twelve hours are the values 0-11 (base 10), while the last 
12 hours have a dot inside the number.

##### Minute

The minute notation increases the value every five minutes. Every minute a dot is added. First on top, then on
the right, then on the bottom and finally on the left.


#### Example

![Example](documentation/Example.JPG)

The screenshot shows a time of 14:22 in decimal time. (2 hours after 12 o'clock, and 4×5 + 2 minutes).