//
//  AnimationCurvePicker.h
//  UIAnimationSamples
//
//  Created by 古山 健司 on 2013/09/15.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationCurvePicker : UIView
@property (retain, nonatomic) IBOutlet UITableView *animationList;

+ (id)newAnimationCurvePicker:(id)pickDelegate;
@end
