//
//  SitUpFreestyleVC.m
//  CC Fitness
//
//  Created by Hongxuan on 21/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "SitUpFreestyleVC.h"
#import "AppDelegate.h"
#import "SitUpLog+CoreDataClass.h"

@interface SitUpFreestyleVC ()
{
    int timeTick;
    NSTimer *timer;
    BOOL started;
    int sitUpCount;
    __block BOOL seatedup;
}

@end

@implementation SitUpFreestyleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Instantiate motionManager
    motionManager = [[CMMotionManager alloc]init];
    
    context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    
    //Initialize bool flag for UIAlertController event.
    started = NO;
    seatedup = NO;
    //Create back button to handle UIAlertController event.
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Quit" style:UIBarButtonItemStylePlain
                                                                     target:self action:@selector(goBackSegue:)];
    self.navigationItem.leftBarButtonItem= newBackButton;
    
    //Initialize timer
    timeTick = 5;
    
    //Initialize the situp counter
    sitUpCount = 0;
    
    /*Invalidate (stop) the timer if it is running, otherwise when this function is called again,
     the timer would run twice as fast each second and so on. */
    [timer invalidate];
    
    //Create timer object
    //set tick interval to 1.0
    //set selector to the method that should be executed on the interval
    //set repeat to yes meaning it should run continiously, not just once
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTickGetReady) userInfo:nil repeats:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pauseTimer) name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resumeTimer) name:UIApplicationWillEnterForegroundNotification object:nil];


}

- (void)pauseTimer {
    
    [timer invalidate];
    [motionManager stopDeviceMotionUpdates];
    
}

- (void)resumeTimer {
    
    if (![self.navigationController.visibleViewController isKindOfClass:[UIAlertController class]]) {
        
        if (!started)
        {
            [self startSitUpSensor];
            timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTickGetReady) userInfo:nil repeats:YES];
        }
        else
        {
            UIBarButtonItem *resumeButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(resumeButtonTimer)];
            
            self.navigationItem.rightBarButtonItem = resumeButton;

        }
    }
}


- (void)pauseButtonTimer {
    
    
    [timer invalidate];
    [motionManager stopDeviceMotionUpdates];
    
    UIBarButtonItem *resumeButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(resumeButtonTimer)];
    
    self.navigationItem.rightBarButtonItem = resumeButton;

    
}

- (void)resumeButtonTimer {
    
    [self startSitUpSensor];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTickStart) userInfo:nil repeats:YES];
    
    UIBarButtonItem *pauseButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPause target:self action:@selector(pauseButtonTimer)];
    
    self.navigationItem.rightBarButtonItem = pauseButton;

}


- (void)confirmEndWorkout
{
    [timer invalidate];
    [motionManager stopDeviceMotionUpdates];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Confirm end workout?"
                                                                   message:@"Do you want to end your workout?"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [self alertFinalScore];
                                                              
                                                          }];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {
                                                             
                                                             [self startSitUpSensor];
                                                             
                                                             timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTickStart) userInfo:nil repeats:YES];
                                                             
                                                         }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)goBackSegue:(UIBarButtonItem *)sender
{
    [timer invalidate];
    [motionManager stopDeviceMotionUpdates];
    
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
                                                                 UIBarButtonItem *resumeButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(resumeButtonTimer)];
                                                                 
                                                                 self.navigationItem.rightBarButtonItem = resumeButton;
                                                             }
                                                             
                                                         }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)timerTickGetReady
{
    //Each tick decrement by one
    timeTick--;
    
    //Update time each tick
    NSString *timeString =[[NSString alloc] initWithFormat:@"%i", timeTick];
    self.lblCount.text = timeString;
    
    if (timeTick == 0)
    {
        started = YES;
        
        //stop the timer when it reaches 0
        [timer invalidate];
        
        self.lblAlertTimer.text = @"00:00:00";
        self.lblSitUps.alpha = 1.0; //Show lblSitUps
        self.lblEndWorkout.alpha = 1.0; //Show btnEndWorkout
        self.lblEndWorkout.enabled = YES;
        
        //Create a pause button for manual pausing or applicationWillResignActive
        UIBarButtonItem *pauseButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPause target:self action:@selector(pauseButtonTimer)];
        
        self.navigationItem.rightBarButtonItem = pauseButton;
        
        [self startSitUpSensor];
        
        //Begin the timer
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTickStart) userInfo:nil repeats:YES];
    }
    
}

-(void)timerTickStart
{
    timeTick++;
    
    self.lblAlertTimer.text = [self formattedTime: timeTick];
    
}

- (NSString *)formattedTime:(int)totalSeconds
{
    
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    
    return [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
}


- (void) viewDidDisappear:(BOOL)animated
{
    [motionManager stopDeviceMotionUpdates];
    [timer invalidate];
    timer = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnEndWorkout:(id)sender {
    
    [self confirmEndWorkout];
}

- (void)startSitUpSensor
{
    if (motionManager.deviceMotionAvailable)
    {
        motionManager.deviceMotionUpdateInterval = 0.045;
        
        [motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
            
            CMAttitude *attitude = motion.attitude;
            
            double degree = attitude.pitch * 180.0/M_PI;
            
            //NSLog(@"%f", degree);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                // Update some UI
                
                if (!seatedup)
                {
                    if (degree >=75.0)
                    {
                        sitUpCount++;
                        self.lblCount.text = [NSString stringWithFormat:@"%i", sitUpCount];
                        seatedup = YES;
                    }
                }
                
                else
                {
                    if (degree <=10.0)
                    {
                        seatedup = NO;
                    }
                }
            });
        }];
        
        //NSLog(@"Device motion started");
    }
    
    else
    {
        //NSLog(@"Device motion unavailable");
    }
}

- (void)alertFinalScore
{
    NSString *displayScore = [NSString stringWithFormat:@"Time: %@\nScore: %i\nWould you like to save the result of your attempt?", self.lblAlertTimer.text, sitUpCount];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Workout complete!"
                                                                   message:displayScore
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [self alertSaveScore];
                                                              
                                                          }];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {
                                                             
                                                             [self.navigationController popToRootViewControllerAnimated:YES];
                                                             
                                                         }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)alertSaveScore
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Enter name"
                                                                   message:@"Please enter your name"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        
        textField.placeholder = @"Your name";
        [textField addTarget:self action:@selector(alertControllerTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
    }];
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Submit" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              //Insertion of data here
                                                              UITextField *userName = alert.textFields.firstObject;
                                                              if ([self insertEntryWithName:userName.text andScore:sitUpCount])
                                                              {
                                                                  [self.navigationController popToRootViewControllerAnimated:YES];
                                                              }
                                                              else
                                                              {
                                                                  NSLog(@"Debug: Check text field value %@", userName.text);
                                                              }
                                                              
                                                          }];
    
    defaultAction.enabled = NO;
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {
                                                             
                                                             [self.navigationController popToRootViewControllerAnimated:YES];
                                                             
                                                         }];
    
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)alertControllerTextFieldDidChange:(UITextField *)sender {
    
    
    UIAlertController *alertController = (UIAlertController *)self.presentedViewController;
    if (alertController)
    {
        UITextField *someTextField = alertController.textFields.firstObject;
        UIAlertAction *okAction = alertController.actions.firstObject;
        okAction.enabled = someTextField.text.length >= 2 && someTextField.text.length <= 25;
    }
}


- (BOOL)insertEntryWithName: (NSString *)name andScore:(int)score
{
    //SitUpLog only saves 20 entries. The last entry will be deleted.
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"SitUpLog"];
    NSError *requestError = nil;
    
    NSArray *entries = [context executeFetchRequest:fetchRequest error:&requestError];
    SitUpLog *firstEntry = entries.firstObject;
    
    if ([entries count] > 20)
    {
        [context deleteObject:firstEntry];
    }
    
    
    SitUpLog *newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"SitUpLog" inManagedObjectContext:context];
    
    if (newEntry == nil)
    {
        NSLog(@"Failed to create new entry.");
        return NO;
    }
    
    newEntry.userName = name;
    newEntry.numOfReps = score;
    newEntry.attemptCategory = @"Freestyle";
    newEntry.timeElapsed = self.lblAlertTimer.text;
    newEntry.attemptDate = [NSDate date];
    
    NSError *savingError = nil;
    
    if (![context save:&savingError])
    {
        NSLog(@"Failed to save the new entry. Error: %@", savingError);
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

@end
