//
//  PushUpTrainerVC.m
//  CC Fitness
//
//  Created by Hongxuan on 16/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "PushUpTrainerVC.h"
#import "AppDelegate.h"
#import "PushUpLog+CoreDataClass.h"
#import "PushUpAttemptTVC.h"

@interface PushUpTrainerVC ()

@end

@implementation PushUpTrainerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    
    UIButton *helpButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [helpButton addTarget:self action:@selector(showHelp) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:helpButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation


 // In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString: @"showViewAttempt"])
    {
        PushUpAttemptTVC *vc = segue.destinationViewController;
        vc.attemptEntries = self.attemptEntries;
    }
    
}


- (IBAction)btnBack:(id)sender {
    
    UIStoryboard *portalStoryboard = [UIStoryboard storyboardWithName:@"Portal" bundle:nil];
    UIViewController *portalVC = [portalStoryboard instantiateViewControllerWithIdentifier:@"ToolsID"];
    
    portalVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:portalVC animated:YES completion:nil];
    
}

- (IBAction)btnViewAttempt:(id)sender {
    
    self.attemptEntries = [self fetchAllEntries];
    
    if (self.attemptEntries == nil || [self.attemptEntries count] == 0)
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"No attempts found"
                                                                       message:@"There are no attempts yet! Complete a workout and submit your attempt to view all attempts."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        
        [self performSegueWithIdentifier:@"showViewAttempt" sender:self];
        
    }
}

- (void)showHelp {
    
    [self performSegueWithIdentifier:@"showHelp" sender:self];
}

- (NSArray *)fetchAllEntries
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"PushUpLog"];
    NSError *requestError = nil;
    
    NSSortDescriptor *sortByScore = [[NSSortDescriptor alloc]
                                       initWithKey:@"numOfReps"
                                       ascending:NO];
    
    fetchRequest.sortDescriptors = @[sortByScore];
    
    NSArray *entries = [context executeFetchRequest:fetchRequest error:&requestError];
    
    return entries;
    
}


@end
