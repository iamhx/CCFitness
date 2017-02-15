//
//  LoginVC.m
//  CC Fitness
//
//  Created by Hongxuan on 12/7/16.
//  Copyright © 2016 Hongxuan. All rights reserved.
//

#import "LoginVC.h"
#import "UserCredentials+CoreDataClass.h"
#import "AppDelegate.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    
    /*
     //This code is to delete all users in the UserCredentials entity.
     
     NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                    initWithEntityName:@"UserCredentials"];
    
    NSError *requestError = nil;
    
    // Fetch data from Persons table into NSArray
    NSArray *persons = [context
                        executeFetchRequest:fetchRequest
                        error:&requestError];
    // Make sure we get the array
    if([persons count] > 0)
    {
        
        for(UserCredentials *thisPerson in persons)
        {
            [context deleteObject:thisPerson];
            
        }
        
        NSError *savingError = nil;
        
        if([context save:&savingError])
        {
            NSLog(@"Successfully deleted all persons in array");
        }
        else
        {
            NSLog(@"Unable to delete all persons in array");
        }
    }
    else
    {
        
        NSLog(@"Could not find any Person entities in the context");
     
    }
     */

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

- (IBAction)btnLogin:(id)sender {
    
    if ([self loginAuth])
    {
        UIStoryboard *PortalStoryboard = [UIStoryboard storyboardWithName:@"Portal" bundle:nil];
        UIViewController *PortalVC = [PortalStoryboard instantiateViewControllerWithIdentifier:@"Portal"];
        PortalVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:PortalVC animated:YES completion:nil];

    }
    else
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Login Failed"
                                                                       message:@"You have entered a wrong username and/or password. Please try again."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.txtUsername resignFirstResponder];
    [self.txtPassword resignFirstResponder];
    [[self.view window] endEditing:YES];
}


- (BOOL)loginAuth
{
    //Fetch the selected username to NSArray and check if there it exists

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"UserCredentials"];
    NSError *requestError = nil;
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"UserCredentials" inManagedObjectContext:context];
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"dbUsername==%@ AND dbPassword==%@",self.txtUsername.text, self.txtPassword.text];
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    
    NSArray *user = [context executeFetchRequest:fetchRequest error:&requestError];
    
    if (!([user count] == 1))
    {
        return NO;
    }

    return YES;
}


@end
