//
//  ResultsVC.h
//  CC Fitness
//
//  Created by Hongxuan on 20/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PushUpLog+CoreDataClass.h"

@interface ResultsVC : UIViewController

@property (nonatomic, retain) PushUpLog *selectedEntry;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblScore;
@property (weak, nonatomic) IBOutlet UILabel *lblCategory;
@property (weak, nonatomic) IBOutlet UILabel *lblAttemptDate;
@property (weak, nonatomic) IBOutlet UILabel *lblTimeElapsed;

@end
