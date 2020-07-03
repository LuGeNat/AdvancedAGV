# Advanced AGV

Repository for the Advanced AGV prototype app on iOS

## Installation of the app under macOS

Required Software: XCode, required packages: [CocoaPods](https://cocoapods.org)

In Terminal, you need to run:

* `cd desiredDirectory`
* `git clone git@github.com:LuGeNat/AdvancedAGV.git`
* `pod install`
* `open advanced-agv_prototype-app.xcworkspace`
* Press `Cmd` + `r` to run the project in simulator

## Python script for test data

The test data file used in our video on a virtualized raspberry pi can be run in terminal:
Required Software: Python3, pip, [Pyrebase](https://github.com/thisbejim/Pyrebase)

So in Terminal, please run:

* `pip install pyrebase`
* `python3 send_data_to_agv_database.py``
