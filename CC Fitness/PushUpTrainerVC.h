//
//  PushUpTrainerVC.h
//  CC Fitness
//
//  Created by Hongxuan on 16/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushUpTrainerVC : UIViewController
{
    NSManagedObjectContext *context;
}
- (IBAction)btnBack:(id)sender;
- (IBAction)btnViewAttempt:(id)sender;

@property (nonatomic, copy) NSArray *attemptEntries;

@end
