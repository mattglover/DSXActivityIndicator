//
//  DSXRootViewController.m
//  DSXActivityIndicator
//
//  Created by Matt Glover on 23/03/2014.
//  Copyright (c) 2014 Duchy Software Ltd. All rights reserved.
//

#import "DSXRootViewController.h"
#import "DSXActivityIndicator.h"

@implementation DSXRootViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    int index = 0;
    
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[DSXActivityIndicator class]]) {
            
            DSXActivityIndicator *spinner = (DSXActivityIndicator *)subview;
            
            // Set any custom properties on customSpinner
            //    [spinner setRotationDuration:3.0];
            //    [spinner setFadeInOut:NO];
            
            [spinner startAnimating];
            
            UITapGestureRecognizer *stopSpinnerTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(spinnerTapped:)];
            [spinner addGestureRecognizer:stopSpinnerTapGesture];
            
            ++index;
        }
    }
}

- (void)spinnerTapped:(UITapGestureRecognizer *)gesture {
    
    DSXActivityIndicator *spinner = (DSXActivityIndicator *)gesture.view;
    
    if ([spinner isAnimating]) {
        [spinner stopAnimating];
    } else {
        [spinner startAnimating];
    }
}

@end
