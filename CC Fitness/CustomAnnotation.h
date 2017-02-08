//
//  CustomAnnotation.h
//  CC Fitness
//
//  Created by Hongxuan on 8/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

- (id)initWithLocation:(CLLocationCoordinate2D)coord;

@end
