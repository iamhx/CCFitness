//
//  GymDetailsVC.h
//  CC Fitness
//
//  Created by Hongxuan on 10/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface GymDetailsVC : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (nonatomic, copy) NSString *myTitle;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *mySubtitle;


@end
