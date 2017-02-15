//
//  registerVC.h
//  CC Fitness
//
//  Created by Student2 on 14/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface registerVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *lblregName;
- (IBAction)btnContinue:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *lblregPassword;
@property (weak, nonatomic) IBOutlet UITextField *lblconfirmPass;
- (IBAction)btnSignUp:(id)sender;

@end
