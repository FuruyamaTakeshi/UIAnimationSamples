//
//  FTViewController.h
//  UIAnimationSamples
//
//  Created by 古山 健司 on 2013/09/15.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationCurvePicker.h"

@interface FTViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *curveList;
    int selectedCurveIndex;
    UIView *pickerView;
}

@end