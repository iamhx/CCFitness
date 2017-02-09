//
//  FindAGymViewController.h
//  CC Fitness
//
//  Created by Student2 on 6/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface FindAGymViewController : ViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}

- (IBAction)btnBack:(id)sender;
@property (weak, nonatomic) IBOutlet MKMapView *myMap;

@end
