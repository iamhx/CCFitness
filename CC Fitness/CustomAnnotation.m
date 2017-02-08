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

- (id)initWithLocation:(CLLocationCoordinate2D)coord title:(NSString *)pTitle andSubtitle: (NSString *)pSubtitle
{
    self = [super init];
    
    if (self)
    {
        coordinate = coord;
        title = pTitle;
        subtitle = pSubtitle;
        
    }
    
    return self;
}

+ (NSMutableArray *)GetAllAnnotations
{
    NSMutableArray *AllAnnotations = [[NSMutableArray alloc]init];
    
    
    [AllAnnotations addObject:[[CustomAnnotation alloc]initWithLocation:CLLocationCoordinate2DMake(1.3553, 103.8508) title:@"Bishan" andSubtitle:@"ActiveSG"]];
    
    [AllAnnotations addObject:[[CustomAnnotation alloc]initWithLocation:CLLocationCoordinate2DMake(1.3307, 103.8515) title:@"Toa Payoh" andSubtitle:@"ActiveSG"]];
    
    return AllAnnotations;
    
}


@end
