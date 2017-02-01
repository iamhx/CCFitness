//
//  BMIViewController.m
//  CC Fitness
//
//  Created by Student2 on 25/7/16.
//  Copyright © 2016 Hongxuan. All rights reserved.
//

#import "BMIViewController.h"

@interface BMIViewController ()

@end

@implementation BMIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.objCalculation = [[BMICalculation alloc]init];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.txtHeight resignFirstResponder];
    [self.txtWeight resignFirstResponder];
    [[self.view window]endEditing:YES];
}

-(void) alertStatus:(NSString *)msg :(NSString *)title : (int)tag {
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:msg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    alertView.tag = tag;
    [alertView show];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnCalculate:(id)sender {
    
    [self.txtHeight resignFirstResponder];
    [self.txtWeight resignFirstResponder];
    [[self.view window]endEditing:YES];
    //[self.view endEditing:YES];
    
    if ([self.txtHeight.text  isEqualToString: @""] || [self.txtWeight.text  isEqualToString: @""])
    {
        [self alertStatus:@"Please enter your height or weight." :@"Invalid Input" :0];
    }
    
    else if ([self.txtHeight.text floatValue] < 134.0 || [self.txtHeight.text floatValue] > 241.0)
    {
        [self alertStatus:@"Please enter your height between 134 and 241cm." :@"Invalid Input" :0];
    }
    
    else if ([self.txtWeight.text floatValue] < 35.0 || [self.txtWeight.text floatValue] > 200.0)
    {
        [self alertStatus:@"Please enter your weight between 35 and 200kg." :@"Invalid Input" :0];
    }
    
    else
    {
        
        self.objCalculation.height = [self.txtHeight.text floatValue];
        self.objCalculation.weight = [self.txtWeight.text floatValue];
        
        //Transition start
        CATransition *animation = [CATransition animation];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.type = kCATransitionFade;
        animation.duration = 0.8;
        [self.lblYourBMI.layer addAnimation:animation forKey:@"kCATransitionFade"];
        [self.lblResult.layer addAnimation:animation forKey:@"kCATransitionFade"];
        [self.lblDescription.layer addAnimation:animation forKey:@"kcATransitionFade"];
        
        // This will fade:
        self.lblYourBMI.text = @"Your BMI is...";
        
        self.lblResult.text = [NSString stringWithFormat:@"%0.1f", self.objCalculation.calculateBMI];
        
        //Transition end
        
        
        if (self.lblResult.text.floatValue < 18.4)
        {
            
            self.lblResult.textColor = [UIColor redColor];
            
            self.lblDescription.text = @"You are at risk of developing problems such as nutritional deficiency and osteoporosis.";
            self.lblDescription.selectable = NO;

        }
        else if (self.lblResult.text.floatValue < 23.0)
        {
            self.lblResult.textColor = [UIColor greenColor];
            
            self.lblDescription.text = @"Low Risk (healthy range)";
            self.lblDescription.selectable = NO;

        }
        else if (self.lblResult.text.floatValue < 27.5)
        {
            self.lblResult.textColor = [UIColor orangeColor];
            
            self.lblDescription.text = @"You are at moderate risk of developing problems such as heart disease, high blood pressure, stroke and diabetes.";
            self.lblDescription.selectable = NO;

        }
        else
        {
            self.lblResult.textColor = [UIColor redColor];
            
            self.lblDescription.text = @"You are at high risk of developing problems such as heart disease, high blood pressure, stroke and diabetes.";
            self.lblDescription.selectable = NO;

        }
        
        
    }
    
}
- (IBAction)btnBack:(id)sender {
    
    UIStoryboard *portalStoryboard = [UIStoryboard storyboardWithName:@"Portal" bundle:nil];
    UIViewController *portalVC = [portalStoryboard instantiateViewControllerWithIdentifier:@"Portal"];
    
    portalVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:portalVC animated:YES completion:nil];
    
    
}
@end
