//
//  registerVC.h
//  CC Fitness
//
//  Created by Student2 on 14/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface registerVC : UIViewController
{
    NSManagedObjectContext *context;
}
@property (weak, nonatomic) IBOutlet UITextField *lblregName;
- (IBAction)btnContinue:(id)sender;
- (IBAction)btnBack:(id)sender;

@end
