//
//  LoginVC.h
//  CC Fitness
//
//  Created by Hongxuan on 12/7/16.
//  Copyright © 2016 Hongxuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface LoginVC : UIViewController
{
    NSManagedObjectContext *context;
}

@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
- (IBAction)btnLogin:(id)sender;

@end
