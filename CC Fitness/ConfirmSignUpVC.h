//
//  ConfirmSignUpVC.h
//  CC Fitness
//
//  Created by Hongxuan on 15/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfirmSignUpVC : UIViewController
{
    NSManagedObjectContext *context;

}

@property (weak, nonatomic) IBOutlet UITextField *lblregPassword;
@property (weak, nonatomic) IBOutlet UITextField *lblconfirmPass;

@property (nonatomic, copy) NSString *myUsername;
- (IBAction)btnSignUp:(id)sender;

@end
