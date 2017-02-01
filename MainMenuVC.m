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


-(void) alertStatus:(NSString *)msg :(NSString *)title : (int)tag {
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:msg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    alertView.tag = tag;
    [alertView show];
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
    
    [self alertStatus:@"Copyright © CC Fitness 2016. All Rights Reserved." :@"About" :0];
    
    
}


@end
