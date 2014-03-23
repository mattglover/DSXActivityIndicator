//
//  DSXActivityIndicator.h
//  CustomActivitySpinner
//
//  Created by Matt Glover on 23/03/2014.
//  Copyright (c) 2014 Duchy Software Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSXActivityIndicator : UIView

@property (nonatomic, assign) NSTimeInterval rotationDuration;
@property (nonatomic, assign, getter = shouldFadeInOut) BOOL fadeInOut;

@property (nonatomic, assign, readonly, getter = isAnimating) BOOL animating;

- (void)startAnimating;
- (void)stopAnimating;

@end
