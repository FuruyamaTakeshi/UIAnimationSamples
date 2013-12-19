//
//  UIView+Animation.m
//  UIAnimationSamples
//
//  Created by 古山 健司 on 2013/09/15.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)
- (void)moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option
{
    [UIView animateWithDuration:secs delay:0.0 options:option animations:^{
        float rad;
        if (destination.y > self.frame.origin.y) {
            rad = M_PI;
        } else {
            rad = 0;
        }
        self.frame = CGRectMake(destination.x, destination.y, self.frame.size.width, self.frame.size.height);
        self.transform = CGAffineTransformMakeRotation(rad);
    }completion:nil];
}

- (void)downUnder:(float)secs option:(UIViewAnimationOptions)option
{
    [UIView animateWithDuration:secs delay:0.0 options:option animations:^{
        self.transform = CGAffineTransformRotate(self.transform, M_PI);
    }completion:^(BOOL finished) {
        NSLog(@"");
    }];
}

- (void)addSubviewWithZoomInAnimaition:(UIView *)view duration:(float)secs option:(UIViewAnimationOptions)option
{
    CGAffineTransform trans = CGAffineTransformScale(view.transform, 0.01, 0.01);
    view.transform = trans;
    [self addSubview:view];
    [UIView animateWithDuration:secs delay:0.0 options:option animations:^{
        view.transform = CGAffineTransformScale(view.transform, 100.0, 100.0);
    }completion:nil];
}

- (void)removeWithZoomOutAnimation:(float)secs option:(UIViewAnimationOptions)option
{
    [UIView animateWithDuration:secs delay:0.0 options:option animations:^{
        self.transform = CGAffineTransformScale(self.transform, 0.01, 0.01);
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
