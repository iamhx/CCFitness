//
//  OneMinChallenge.m
//  CC Fitness
//
//  Created by Hongxuan on 18/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "OneMinChallenge.h"
#import "PushUpTrainerVC.h"

@interface OneMinChallenge ()
{
    int timeTick;
    NSTimer *timer;
    BOOL started;
    int pushUpCount;
}

@end

@implementation OneMinChallenge

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Initialize bool flag for UIAlertController event.
    started = NO;
    //Create back button to handle UIAlertController event.
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain
                                                                     target:self action:@selector(goBackSegue:)];
    self.navigationItem.leftBarButtonItem= newBackButton;
    

    //Initialize timer
    timeTick = 5;
    
    /*Invalidate the timer if it is running, otherwise when this function is called again,
     the timer would run twice as fast each second and so on. */
    [timer invalidate];
    
    //Create our timer object
    //set the tick interval to 1.0
    //set the selector to the method that should be executed on the interval
    //set repeat to yes meaning it should run continiously, not just once
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTickGetReady) userInfo:nil repeats:YES];
}

- (void)goBackSegue:(UIBarButtonItem *)sender
{
    [timer invalidate];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Return to the start menu?"
                                                                   message:@"Your results will not be saved!"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                          
                                                              [self.navigationController popToRootViewControllerAnimated:YES];
                                                              
                                                          }];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {
                                                         
                                                             if (!started)
                                                             {
                                                                 timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTickGetReady) userInfo:nil repeats:YES];
                                                             }
                                                             else
                                                             {
                                                             timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTickStart) userInfo:nil repeats:YES];
                                                             }
                                                         
                                                         }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)timerTickGetReady
{
    //increment the timer (in this case, decrement)
    timeTick--;
    //if we wanted to count down we could have done "timeTick--"
    
    NSString *timeString =[[NSString alloc] initWithFormat:@"%i", timeTick];
    
    self.lblCount.text = timeString;
    
    //if we want the timer to stop after a certain number of seconds we can do
    if (timeTick == 0)
    {
        started = YES;
        
        //stop the timer after 0 seconds
        [timer invalidate];
        
        timeTick = 60; //reset to 1 minute
        
        self.lblAlertTimer.text = @"60 SECONDS";
        
        self.lblPushUps.alpha = 1.0; //Show lblPushUps
        
        //Begin 1 minute timer
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTickStart) userInfo:nil repeats:YES];
    }

}

-(void)timerTickStart
{
    timeTick--;
    
    NSString *timeString =[[NSString alloc] initWithFormat:@"%i SECONDS", timeTick];

    self.lblAlertTimer.text = timeString;
    
    if (timeTick == 0)
    {
        [timer invalidate];
        
        //do insert result to core data
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidDisappear:(BOOL)animated
{
    [timer invalidate];
    timer = nil;
}

/*
 #pragma mark - Navigation


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
