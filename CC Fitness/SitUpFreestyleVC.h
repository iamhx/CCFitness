//
//  SitUpFreestyleVC.h
//  CC Fitness
//
//  Created by Hongxuan on 21/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface SitUpFreestyleVC : UIViewController
{
    CMMotionManager *motionManager;
    NSManagedObjectContext *context;
}

@property (weak, nonatomic) IBOutlet UILabel *lblAlertTimer;
@property (weak, nonatomic) IBOutlet UILabel *lblCount;
@property (weak, nonatomic) IBOutlet UILabel *lblSitUps;
- (IBAction)btnEndWorkout:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *lblEndWorkout;


@end
