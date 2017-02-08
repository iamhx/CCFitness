//
//  CustomAnnotation.m
//  CC Fitness
//
//  Created by Hongxuan on 8/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "CustomAnnotation.h"

@implementation CustomAnnotation

@synthesize coordinate, title, subtitle;

- (id)initWithLocation:(CLLocationCoordinate2D)coord
{
    self = [super init];
    
    if (self)
    {
        coordinate = coord;
    }
    
    return self;
}

@end
