//
//  BMICalculation.m
//  CC Fitness
//
//  Created by Student2 on 25/7/16.
//  Copyright © 2016 Hongxuan. All rights reserved.
//

#import "BMICalculation.h"

@implementation BMICalculation

-(id) init {
    self = [super init];
    if (self) {
        self.height = 0;
        self.weight = 0;
    }
    
    return self;
}

-(float) calculateBMI {
    float result;
    float heightInCms = self.height * 0.01;
    return result = (self.weight / (heightInCms * heightInCms));
}


@end
