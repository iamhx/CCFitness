//
//  SitUpResultsVC.h
//  CC Fitness
//
//  Created by Hongxuan on 21/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SitUpLog+CoreDataClass.h"

@interface SitUpResultsVC : UIViewController

@property (nonatomic, strong) SitUpLog *selectedEntry;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblScore;
@property (weak, nonatomic) IBOutlet UILabel *lblCategory;
@property (weak, nonatomic) IBOutlet UILabel *lblAttemptDate;
@property (weak, nonatomic) IBOutlet UILabel *lblTimeElapsed;

@end
