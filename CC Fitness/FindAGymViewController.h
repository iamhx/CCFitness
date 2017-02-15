//
//  FindAGymViewController.h
//  CC Fitness
//
//  Created by Student2 on 6/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface FindAGymViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    __block BOOL prompted; //If location services prompt has not shown
    
}

- (IBAction)btnBack:(id)sender;
@property (weak, nonatomic) IBOutlet MKMapView *myMap;
- (IBAction)btnMapType:(id)sender;



@end
