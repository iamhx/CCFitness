//
//  FindAGymViewController.m
//  CC Fitness
//
//  Created by Student2 on 6/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "FindAGymViewController.h"
#import "CustomAnnotation.h"

@interface FindAGymViewController ()

@end

@implementation FindAGymViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myMap.delegate = self;
    
    //Annotations yet to implement
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

- (void) viewWillDisappear:(BOOL)animated {
    
    //Stop using location services on view disappearing
    self.myMap.showsUserLocation = NO;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    //If class is UserLocation, return nil
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    
    //If class is CustomAnnotation
    if ([annotation isKindOfClass:[CustomAnnotation class]])
    {
        //Dequeue existing pin view first
        MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        
        if (!pinView)
        {
            //Create pin view if there is no existing one
            pinView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.pinTintColor = [UIColor purpleColor];
            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            
            //Callout action yet to implement
        }
        else
        {
            pinView.annotation = annotation;
        }
        
        return pinView;
    }
    else
    {
        return nil;
    }
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    MKCoordinateRegion region;
    
    region.center = userLocation.coordinate;
    
    //Zooms in to 5km
    region.span = MKCoordinateSpanMake(0.04504, 0.04504);
    
    [self.myMap setRegion:region animated:YES];
}



- (IBAction)btnBack:(id)sender {
    
    UIStoryboard *portalStoryboard = [UIStoryboard storyboardWithName:@"Portal" bundle:nil];
    UIViewController *portalVC = [portalStoryboard instantiateViewControllerWithIdentifier:@"ToolsID"];
    
    portalVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:portalVC animated:YES completion:nil];
}
@end
