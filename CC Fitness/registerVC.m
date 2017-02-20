//
//  registerVC.m
//  CC Fitness
//
//  Created by Student2 on 14/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "registerVC.h"
#import "UserCredentials+CoreDataClass.h"
#import "AppDelegate.h"
#import "ConfirmSignUpVC.h"

@interface registerVC ()

@end

@implementation registerVC

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
    [self.lblregName resignFirstResponder];
    [[self.view window] endEditing:YES];
}


- (BOOL)checkForExistingUserName
{
    //Fetch all usernames to array and check if there is existing username
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"UserCredentials"];
    NSError *requestError = nil;
    
    NSArray *usernames = [context executeFetchRequest:fetchRequest error:&requestError];
    
    for (UserCredentials *user in usernames)
    {
        if (user.dbUsername == self.lblregName.text)
        {
            return NO;
        }
    }
    
    return YES;
}



- (void)alertUserInvalidUserNameWithMessage: (NSString *)message
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Invalid username"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString: @"segueContinue"])
    {
        ConfirmSignUpVC *vc = segue.destinationViewController;
        vc.myUsername = self.lblregName.text;
    }
    
}


- (IBAction)btnContinue:(id)sender {
    
    if (self.lblregName.text.length < 5)
    {
        [self alertUserInvalidUserNameWithMessage:@"Username must be at least five characters or more. Please try again."];
    }
    else
    {
        if (![self checkForExistingUserName])
        {
            [self alertUserInvalidUserNameWithMessage:@"This username is taken. Please enter a different username."];
        }
        
        else
        {
            [self performSegueWithIdentifier:@"segueContinue" sender:self];
        }
    }
    
}

- (IBAction)btnBack:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:NO];

}

@end
