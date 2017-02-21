//
//  SitUpLog+CoreDataProperties.m
//  CC Fitness
//
//  Created by Hongxuan on 21/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "SitUpLog+CoreDataProperties.h"

@implementation SitUpLog (CoreDataProperties)

+ (NSFetchRequest<SitUpLog *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"SitUpLog"];
}

@dynamic attemptCategory;
@dynamic attemptDate;
@dynamic numOfReps;
@dynamic timeElapsed;
@dynamic userName;

@end
