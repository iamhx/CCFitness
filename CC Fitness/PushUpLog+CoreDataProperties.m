//
//  PushUpLog+CoreDataProperties.m
//  CC Fitness
//
//  Created by Hongxuan on 19/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "PushUpLog+CoreDataProperties.h"

@implementation PushUpLog (CoreDataProperties)

+ (NSFetchRequest<PushUpLog *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"PushUpLog"];
}

@dynamic attemptCategory;
@dynamic attemptDate;
@dynamic numOfReps;
@dynamic timeElapsed;
@dynamic userName;

@end
