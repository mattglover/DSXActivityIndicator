//
//  DSXRootViewController.m
//  DSXActivityIndicator
//
//  Created by Matt Glover on 23/03/2014.
//  Copyright (c) 2014 Duchy Software Ltd. All rights reserved.
//

#import "DSXRootViewController.h"
#import "DSXActivityIndicator.h"

@interface DSXRootViewController ()
@property (nonatomic, weak) IBOutlet DSXActivityIndicator *customSpinner;
@end

@implementation DSXRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set any custom properties on customSpinner
    //    [self.customSpinner setRotationDuration:3.0];
    //    [self.customSpinner setFadeInOut:NO];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.customSpinner startAnimating];
    
    UITapGestureRecognizer *stopSpinnerTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                            action:@selector(spinnerTapped:)];
    [self.customSpinner addGestureRecognizer:stopSpinnerTapGesture];
}

- (void)spinnerTapped:(UITapGestureRecognizer *)gesture {
    
    if ([self.customSpinner isAnimating]) {
        [self.customSpinner stopAnimating];
    } else {
        [self.customSpinner startAnimating];
    }
}

@end
