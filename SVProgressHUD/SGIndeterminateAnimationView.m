//
//  SGIndeterminateAnimationView.m
//  SaraGEO
//
//  Created by Elija McPherson-Burke on 6/19/15.
//  Copyright (c) 2015 SaraGEO. All rights reserved.
//

#import "SGIndeterminateAnimationView.h"

@implementation SGIndeterminateAnimationView

- (void)showNextFrame
{
    iconImageView.image = [UIImage imageNamed:frames[frameIndex]];
    frameIndex = ( frameIndex + 1 ) % frames.count;
    
    CGRect frame = self.frame;
    frame.origin.x = CGRectGetMaxX( frame );
    iconImageView.frame = frame;
    
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGRect frame = iconImageView.frame;
        frame.origin.x = 0;
        iconImageView.frame = frame;
    } completion:^(BOOL finished) {
        if( finished )
        {
            [UIView animateWithDuration:0.2 delay:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
                CGRect frame = iconImageView.frame;
                frame.origin.x = -CGRectGetWidth( frame );
                iconImageView.frame = frame;
            } completion:^(BOOL finished) {
                if( finished )
                    [self showNextFrame];
            }];
        }
    }];
}

- (void)startAnimating
{
    frames = @[@"indeterminate_pin", @"indeterminate_globe", @"indeterminate_mountain", @"indeterminate_map"];
    frameIndex = 0;
    
    CGRect frame = self.frame;
    frame.origin.x = CGRectGetMaxX( frame );
    iconImageView = [[UIImageView alloc] initWithFrame:frame];
    iconImageView.contentMode = UIViewContentModeCenter;
    [self addSubview:iconImageView];
    
    [self showNextFrame];
}

@end
