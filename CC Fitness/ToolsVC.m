//
//  ToolsVC.m
//  CC Fitness
//
//  Created by Student2 on 26/7/16.
//  Copyright © 2016 Hongxuan. All rights reserved.
//

#import "ToolsVC.h"

@interface ToolsVC ()

@end

@implementation ToolsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)btnBack:(id)sender {
    
    [self performSegueWithIdentifier:@"ShowMain" sender:self];
}

- (IBAction)btnBMICalc:(id)sender {
    
    UIStoryboard *calcStoryboard = [UIStoryboard storyboardWithName:@"BMI" bundle:nil];
    UIViewController *calcVC = [calcStoryboard instantiateViewControllerWithIdentifier:@"BMICalculator"];
    
    calcVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:calcVC animated:YES completion:nil];
    
}

- (IBAction)btnFind:(id)sender {
    
    UIStoryboard *findAGymStoryboard = [UIStoryboard storyboardWithName:@"FindAGym" bundle:nil];
    UIViewController *gymVC = [findAGymStoryboard instantiateViewControllerWithIdentifier:@"FindAGymID"];
    
    gymVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:gymVC animated:YES completion:nil];

}

- (IBAction)btnPushUp:(id)sender {
    
    UIStoryboard *findAGymStoryboard = [UIStoryboard storyboardWithName:@"PushUpTrainer" bundle:nil];
    UIViewController *gymVC = [findAGymStoryboard instantiateViewControllerWithIdentifier:@"PushUpTrainerID"];
    
    gymVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:gymVC animated:YES completion:nil];

}
@end
