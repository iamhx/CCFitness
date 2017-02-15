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

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.lblregName resignFirstResponder];
    [self.lblregPassword resignFirstResponder];
    [self.lblconfirmPass resignFirstResponder];
    [[self.view window] endEditing:YES];
}


- (BOOL) checkForExistingUserName
{
    //Fetch all usernames to array and check if there is existing username
    
    NSManagedObjectContext *context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
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


- (IBAction)btnContinue:(id)sender {
    
    if (self.lblregName.text.length < 6)
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Invalid username"
                                                                       message:@"Username must be at least six characters or more. Please try again."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        if (![self checkForExistingUserName])
        {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Invalid username"
                                                                           message:@"This username is taken. Please enter a different username."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
        
        else
        {
            [self performSegueWithIdentifier:@"segueContinue" sender:self];
        }
    }
    
}
- (IBAction)btnSignUp:(id)sender {
}
@end
