//
//  PushUpTrainerVC.m
//  CC Fitness
//
//  Created by Hongxuan on 16/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "PushUpTrainerVC.h"

@interface PushUpTrainerVC ()

@end

@implementation PushUpTrainerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *helpButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [helpButton addTarget:self action:@selector(showHelp) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:helpButton];
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
    
    UIStoryboard *portalStoryboard = [UIStoryboard storyboardWithName:@"Portal" bundle:nil];
    UIViewController *portalVC = [portalStoryboard instantiateViewControllerWithIdentifier:@"ToolsID"];
    
    portalVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:portalVC animated:YES completion:nil];
    
}

- (void)showHelp {
    
    [self performSegueWithIdentifier:@"showHelp" sender:self];
}


@end
