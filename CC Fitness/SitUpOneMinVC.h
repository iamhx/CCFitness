//
//  SitUpOneMinVC.h
//  CC Fitness
//
//  Created by Hongxuan on 21/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface SitUpOneMinVC : UIViewController
{
    NSManagedObjectContext *context;
    CMMotionManager *motionManager;
    
}

@property (weak, nonatomic) IBOutlet UILabel *lblAlertTimer;
@property (weak, nonatomic) IBOutlet UILabel *lblCount;
@property (weak, nonatomic) IBOutlet UILabel *lblSitUps;

@end
