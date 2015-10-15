# UCTransitWidgets

[![CI Status](http://img.shields.io/travis/UrbanCompass/UCTransitWidgets.svg?style=flat)](https://travis-ci.org/UrbanCompass/UCTransitWidgets)
[![Version](https://img.shields.io/cocoapods/v/UCTransitWidgets.svg?style=flat)](http://cocoadocs.org/docsets/UCTransitWidgets)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/UCTransitWidgets.svg?style=flat)](http://cocoadocs.org/docsets/UCTransitWidgets)
[![Platform](https://img.shields.io/cocoapods/p/UCTransitWidgets.svg?style=flat)](http://cocoadocs.org/docsets/UCTransitWidgets)

## What is it

A small library to display resolution-independent, intelligently-scaled transit icons.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```shell
$ git clone https://github.com/UrbanCompass/UCTransitWidgets.git
$ cd Example
$ pod install
```

To display a transit icon, create a UCTransitLine, and then use it to create a UCTransitIconView. For example, to display an icon for the NYC subway 6 Express line:

```objc
UCTransitLine *line = [[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"6X"];
UCTransitIconView *iconView = [[UCTransitIconView alloc] initWithLine:line];
```

Note that UCTransitIconView may display a different line after instantiation:

```objc
[iconView setLine:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"A"]];
```

## Requirements

Cocoapods is required to install dependencies for this project.

```shell
$ sudo gem install cocoapods
```

## Installation

UCTransitWidgets is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "UCTransitWidgets"

## Author

Jerry Wong, jerry@compass.com

James Paolantonio, jamesp@compass.com

## License

UCTransitWidgets is available under the MIT license. See the LICENSE file for more info.
