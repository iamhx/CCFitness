//
//  SitUpResultsVC.m
//  CC Fitness
//
//  Created by Hongxuan on 21/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "SitUpResultsVC.h"
#import "SitUpLog+CoreDataClass.h"


@interface SitUpResultsVC ()

@end

@implementation SitUpResultsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDateFormatter *dateFormat= [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"d MMM yyyy hh:mm a"];
    // Convert date to string
    NSString *date = [dateFormat stringFromDate:self.selectedEntry.attemptDate];
    
    self.lblName.text = self.selectedEntry.userName;
    self.lblScore.text = [NSString stringWithFormat:@"Score: %i", self.selectedEntry.numOfReps];
    self.lblCategory.text = [NSString stringWithFormat:@"Category: %@", self.selectedEntry.attemptCategory];
    self.lblAttemptDate.text = [NSString stringWithFormat:@"Attempt Date: %@", date];
    self.lblTimeElapsed.text = [NSString stringWithFormat:@"Time Elapsed: %@",self.selectedEntry.timeElapsed];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
