//
//  SGIndeterminateAnimationView.h
//  SaraGEO
//
//  Created by Elija McPherson-Burke on 6/19/15.
//  Copyright (c) 2015 SaraGEO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SGIndeterminateAnimationView : UIView
{
    UIImageView *iconImageView;
    NSArray *frames;
    int frameIndex;
}

- (void)startAnimating;

@end
