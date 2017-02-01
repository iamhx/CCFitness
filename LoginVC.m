//
//  LoginVC.m
//  CC Fitness
//
//  Created by Hongxuan on 12/7/16.
//  Copyright © 2016 Hongxuan. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.checkLogin = [[LoginService alloc]init];
    
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

- (IBAction)btnLogin:(id)sender {
    
    if ([self.txtUsername.text isEqualToString:@""] || [self.txtPassword.text isEqualToString:@""])
    {
        [self alertStatus:@"Username and/or Password cannot be blank!" :@"Login Failed" :0];
    }
    else
    {
        self.checkLogin.strUsername = self.txtUsername.text;
        self.checkLogin.strPassword = self.txtPassword.text;
        
        BOOL lgs = self.checkLogin.success;
        
        if (lgs == 1)
        {
            //transition to next slideshow
            
            UIStoryboard *PortalStoryboard = [UIStoryboard storyboardWithName:@"Portal" bundle:nil];
            UIViewController *PortalVC = [PortalStoryboard instantiateViewControllerWithIdentifier:@"Portal"];
            PortalVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self presentViewController:PortalVC animated:YES completion:nil];
        }
        else
        {
            [self alertStatus:@"Wrong Username and/or Password!" :@"Login Failed" :0];
        }
    }
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.txtUsername resignFirstResponder];
    [self.txtPassword resignFirstResponder];
    [[self.view window] endEditing:YES];
}

@end
