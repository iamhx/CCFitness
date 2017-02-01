//
//  BMIViewController.h
//  CC Fitness
//
//  Created by Student2 on 25/7/16.
//  Copyright © 2016 Hongxuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMICalculation.h"

@interface BMIViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtHeight;
@property (weak, nonatomic) IBOutlet UITextField *txtWeight;
- (IBAction)btnCalculate:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblResult;


@property (strong, nonatomic) BMICalculation *objCalculation;
@property (weak, nonatomic) IBOutlet UILabel *lblYourBMI;
@property (weak, nonatomic) IBOutlet UITextView *lblDescription;
- (IBAction)btnBack:(id)sender;
@end
