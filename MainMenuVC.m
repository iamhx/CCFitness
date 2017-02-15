//
//  MainMenuVC.m
//  CC Fitness
//
//  Created by Student2 on 18/7/16.
//  Copyright © 2016 Hongxuan. All rights reserved.
//

#import "MainMenuVC.h"

@interface MainMenuVC ()

@end

@implementation MainMenuVC

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


- (IBAction)btnLogout:(id)sender {
    
    UIStoryboard *loginStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *LoginVC = [loginStoryboard instantiateViewControllerWithIdentifier:@"Main"];
    
    LoginVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:LoginVC animated:YES completion:nil];
    
}

- (IBAction)btnLearn:(id)sender {
    
    UIStoryboard *learnStoryboard = [UIStoryboard storyboardWithName:@"Learn" bundle:nil];
    UIViewController *learnVC = [learnStoryboard instantiateViewControllerWithIdentifier:@"Learn"];
    
    learnVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:learnVC animated:YES completion:nil];
}

- (IBAction)btnTools:(id)sender {
    
    [self performSegueWithIdentifier:@"ShowTools" sender:self];
    
    
}

- (IBAction)btnOther:(id)sender {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"About"
                                                                   message:@"Copyright © CC Fitness 2016. All Rights Reserved."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}


@end
