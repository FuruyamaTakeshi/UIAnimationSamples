//
//  FTViewController.m
//  UIAnimationSamples
//
//  Created by 古山 健司 on 2013/09/15.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTViewController.h"
#import "UIView+Animation.h"

@interface FTViewController ()
@property (retain, nonatomic) IBOutlet UIButton *movingButton;

@property (retain, nonatomic) IBOutlet UIButton *buttonDownUnder;
- (IBAction)btnDownUnderDidPush:(id)sender;


- (IBAction)btnMoveTo:(id)sender;
- (IBAction)btnZoom:(id)sender;

@end

@implementation FTViewController

static int curveValues[] = {
    UIViewAnimationOptionCurveEaseInOut,
    UIViewAnimationOptionCurveEaseIn,
    UIViewAnimationOptionCurveEaseOut,
    UIViewAnimationOptionCurveLinear
};

- (void)viewDidLoad
{
    [super viewDidLoad];
    curveList = [[NSMutableArray alloc] initWithObjects:@"EaseInOut", @"EaseIn", @"EaseOut", @"Linear", nil];
    selectedCurveIndex = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_movingButton release];
    [_buttonDownUnder release];
    [super dealloc];
}

#pragma mark - animation actions
- (IBAction)btnDownUnderDidPush:(id)sender {
    UIButton *button = (UIButton *)sender;
    [button downUnder:1.0 option:0];
}

- (IBAction)btnMoveTo:(id)sender {
    UIButton *button = (UIButton *)sender;
    [self.movingButton moveTo:CGPointMake(button.center.x - (self.movingButton.frame.size.width/2), button.frame.origin.y - (self.movingButton.frame.size.height + 5.0)) duration:1.0 option:0];
}

- (IBAction)btnZoom:(id)sender {
    UIButton *button = (UIButton *)sender;
    pickerView = [AnimationCurvePicker newAnimationCurvePicker:self];
    pickerView.center = button.center;
    [self.view addSubviewWithZoomInAnimaition:pickerView duration:1.0 option:curveValues[selectedCurveIndex]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [curveList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [curveList objectAtIndex:indexPath.row];
    if (indexPath.row == selectedCurveIndex) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Select the Animation Curve to be used";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"Curves will not affetct total duration but instant speed and accelaeration ";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    if (selectedCurveIndex != indexPath.row) {
        NSIndexPath *oldPath = [NSIndexPath indexPathForRow:selectedCurveIndex inSection:indexPath.section];
        cell = [tableView cellForRowAtIndexPath:oldPath];
        cell.accessoryType = UITableViewCellAccessoryNone;
        selectedCurveIndex = indexPath.row;
    }
    if (pickerView) {
        [pickerView removeWithZoomOutAnimation:1.0 option:curveValues[selectedCurveIndex]];
        pickerView  = nil;
    }
}
@end
