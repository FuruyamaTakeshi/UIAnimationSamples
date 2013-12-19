//
//  AnimationCurvePicker.m
//  UIAnimationSamples
//
//  Created by 古山 健司 on 2013/09/15.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "AnimationCurvePicker.h"

@implementation AnimationCurvePicker
+ (id)newAnimationCurvePicker:(id)pickDelegate
{
    UINib *nib = [UINib nibWithNibName:@"AnimationCurviePicker" bundle:nil];
    NSArray *nibArray = [nib instantiateWithOwner:self options:nil];
    AnimationCurvePicker *me = [nibArray objectAtIndex:0];
    me.animationList.delegate = pickDelegate;
    me.animationList.dataSource = pickDelegate;
    return me;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc {
    [_animationList release];
    [super dealloc];
}
@end
