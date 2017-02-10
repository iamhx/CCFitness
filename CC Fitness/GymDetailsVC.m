//
//  GymDetailsVC.m
//  CC Fitness
//
//  Created by Hongxuan on 10/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "GymDetailsVC.h"

@interface GymDetailsVC ()

@end

@implementation GymDetailsVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.lblTitle.text = self.myTitle;
    self.lblSubtitle.text = self.mySubtitle;
    
    NSLog(@"%f, %f", self.coordinate.latitude, self.coordinate.longitude);
    
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
