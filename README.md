DSXActivityIndicator
====================

## Description
DSXActivityIndicator is simple UIView subclass that copies the behaviour of a UIActivityIndicatorView, with a couple of subtle customisation options  
* Adjust the rotation duration
* Set whether the indicator should fade when start/stop animating
* Different image style

As with UIActivityIndicatorView the color of the indicator can be controlled by setting the tint color on the DSXActivityIndicator.  

## Screenshot
![screenshot](https://raw.githubusercontent.com/mattglover/DSXActivityIndicator/master/Screenshot/screenshot.png "Screenshot - Multiple DSXActivityIndicators")

## Usage

To add an instance of DSXActivityIndicator as a subView :
```objc
DSXActivityIndicator *spinner = [DSXActivityIndicator alloc] init];
[self.view addSubview:spinner];
```

### Properties
Customize the behaviour of the DSXActivityIndicator
```objc
[spinner setRotationDuration:5.0]; // defaults to 1.0
```
```objc
[spinner setFadeInOut:NO]; // defaults to YES
```

### Methods
Start / Stop DSXActivityIndicator animating
```objc
[spinner startAnimating];
```
```objc
[spinner stopAnimating];
```

Check current animating state of DSXActivityIndicator
```objc
BOOL isAnimating = [spinner isAnimating];
```

Change tintColor DSXActivityIndicator (UIView)
```objc
[spinner setTintColor:[UIColor yellowColor]];
```

## Known Limitations / TODO
* Provide convenience initialiser i.e. `+ (instanceType)indicator`
* Rename to DSXActivityIndicatorView
* Currently restricted to 40pt x 40pt asset
* Unable to provide own asset
* Reverse animation
* Delegate to listen for user interactions

## About
This simple exercise was a means to practice Cocoapods techniques whilst also sharing _something_ that others might find useful.  
  
Please feel free to use for any purpose.  
I would love to hear from you, especially if you use DSXActivityIndicator in any of your projects.  
  
Enjoy :D
