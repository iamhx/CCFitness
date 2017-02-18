//
//  FreestyleChallenge.h
//  CC Fitness
//
//  Created by Hongxuan on 18/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FreestyleChallenge : UIViewController
{
    UIDevice *device;
}
@property (weak, nonatomic) IBOutlet UILabel *lblAlertTimer;
@property (weak, nonatomic) IBOutlet UILabel *lblCount;
@property (weak, nonatomic) IBOutlet UILabel *lblPushUps;
- (IBAction)btnEndWorkout:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *lblEndWorkout;
@end
