//
//  ConfirmSignUpVC.m
//  CC Fitness
//
//  Created by Hongxuan on 15/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "ConfirmSignUpVC.h"
#import "UserCredentials+CoreDataClass.h"
#import "AppDelegate.h"

@interface ConfirmSignUpVC ()

@end

@implementation ConfirmSignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.lblregPassword resignFirstResponder];
    [self.lblconfirmPass resignFirstResponder];
    [[self.view window] endEditing:YES];
}


- (void)alertUserInvalidPasswordWithMessage: (NSString *)message
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Invalid password"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (BOOL)createNewUser
{
    UserCredentials *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"UserCredentials" inManagedObjectContext:context];
    
    if (newUser == nil)
    {
        NSLog(@"Failed to create new user.");
        return NO;
    }
    
    newUser.dbUsername = self.myUsername;
    newUser.dbPassword = self.lblregPassword.text;
    
    NSError *savingError = nil;
    
    if (![context save:&savingError])
    {
        NSLog(@"Failed to save the new user. Error: %@", savingError);
        return NO;
    }
    
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnSignUp:(id)sender {
    
    if (self.lblregPassword.text.length < 5)
    {
        [self alertUserInvalidPasswordWithMessage:@"Password must be at least five characters or more. Please try again."];
    }
    else
    {
        if (![self.lblregPassword.text isEqualToString:self.lblconfirmPass.text])
        {
            [self alertUserInvalidPasswordWithMessage:@"Passwords do not match. Please check again."];
        }
        else
        {
            if ([self createNewUser])
            {
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Registration successful"
                                                                               message:@"You can now log in with your username and password."
                                                                        preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction * action) {
                                                                          
                                                                          UIStoryboard *loginStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                                          UIViewController *LoginVC = [loginStoryboard instantiateViewControllerWithIdentifier:@"Main"];
                                                                          
                                                                          [self.navigationController pushViewController:LoginVC animated:YES];
                                                                      }];
                
                [alert addAction:defaultAction];
                
                [self presentViewController:alert animated:YES completion:nil];
                
                /*
                 
                //debug purposes
                
                NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"UserCredentials"];
                NSError *requestError = nil;
                
                NSArray *usernames = [context executeFetchRequest:fetchRequest error:&requestError];
                
                for (UserCredentials *user in usernames)
                {
                    NSLog(@"%@, %@", user.dbUsername, user.dbPassword);
                }
                 
                */
                
            }
        }
    }

}
@end
