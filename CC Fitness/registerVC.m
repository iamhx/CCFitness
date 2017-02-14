//
//  registerVC.m
//  CC Fitness
//
//  Created by Student2 on 14/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "registerVC.h"

@interface registerVC ()

@end

@implementation registerVC

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

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.lblregName resignFirstResponder];
    [self.lblregPassword resignFirstResponder];
    [self.lblconfirmPass resignFirstResponder];
    [[self.view window] endEditing:YES];
}



- (IBAction)btnContinue:(id)sender {
}
@end
