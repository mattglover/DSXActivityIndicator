//
//  DSXActivityIndicator.m
//  CustomActivitySpinner
//
//  Created by Matt Glover on 23/03/2014.
//  Copyright (c) 2014 Duchy Software Ltd. All rights reserved.
//

#import "DSXActivityIndicator.h"

static NSString * const indicatorImageFilename = @"ResourceBundle.bundle/spinnerTemplate.png";

static const CGRect defaultBounds = {{0,0},{40,40}};
static NSTimeInterval const defaultRotationDuration = 1.0;

@interface DSXActivityIndicator ()
@property (nonatomic, strong) UIImageView *indicatorImageView;
@end

@implementation DSXActivityIndicator

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, defaultBounds.size.width, defaultBounds.size.height)];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setBounds:CGRectMake(0, 0, defaultBounds.size.width, defaultBounds.size.height)];
    [self setup];
}

- (void)setup {
    
    self.rotationDuration = defaultRotationDuration;
    self.fadeInOut = YES;
    
    UIImage *spinnerImage = [[self spinnerImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.indicatorImageView = [[UIImageView alloc] initWithImage:spinnerImage];
    [self addSubview:self.indicatorImageView];
}

- (void)startAnimating {
    [[self.indicatorImageView layer] addAnimation:[self spinAnimation] forKey:@"spinAnimation"];
    _animating = YES;
    
    [UIView animateWithDuration:[self fadeInOutAnimationDuration]
                     animations:^{
                         [self.indicatorImageView setAlpha:1.0f];
                     }];
}

- (void)stopAnimating {
    [UIView animateWithDuration:[self fadeInOutAnimationDuration]
                     animations:^{
                         [self.indicatorImageView setAlpha:0.0f];
                     }
                     completion:^(BOOL finished) {
                         [self.indicatorImageView.layer removeAllAnimations];
                         _animating = NO;
                     }];
}

- (NSTimeInterval)fadeInOutAnimationDuration {
    return self.shouldFadeInOut ? 0.3 : 0.0;
}

- (CABasicAnimation *)spinAnimation {
    
    CABasicAnimation *spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    spinAnimation.fromValue     = [NSNumber numberWithFloat : M_PI * 0.0];
    spinAnimation.byValue       = [NSNumber numberWithFloat : M_PI * 2.0];
    spinAnimation.duration      = self.rotationDuration;
    spinAnimation.repeatCount   = HUGE_VALF;
    
    return spinAnimation;
}

- (UIImage *)spinnerImage {
    UIImage *image = [UIImage imageNamed:indicatorImageFilename];
    return image;
}

@end
