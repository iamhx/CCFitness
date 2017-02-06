//
//  FindAGymViewController.m
//  CC Fitness
//
//  Created by Student2 on 6/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "FindAGymViewController.h"

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
    
    self.myMap.showsUserLocation = NO;
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
    UIViewController *portalVC = [portalStoryboard instantiateViewControllerWithIdentifier:@"Portal"];
    
    portalVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:portalVC animated:YES completion:nil];
}
@end
