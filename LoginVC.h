//
//  LoginVC.h
//  CC Fitness
//
//  Created by Hongxuan on 12/7/16.
//  Copyright © 2016 Hongxuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginService.h"
@interface LoginVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
- (IBAction)btnLogin:(id)sender;


@property (strong, nonatomic) LoginService *checkLogin;

@end
