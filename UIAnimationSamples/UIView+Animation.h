//
//  UIView+Animation.h
//  UIAnimationSamples
//
//  Created by 古山 健司 on 2013/09/15.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)
- (void)moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option;
- (void)downUnder:(float)secs option:(UIViewAnimationOptions)option;
- (void)addSubviewWithZoomInAnimaition:(UIView *)view duration:(float)secs option:(UIViewAnimationOptions)option;
- (void)removeWithZoomOutAnimation:(float)secs option:(UIViewAnimationOptions)option;
@end
