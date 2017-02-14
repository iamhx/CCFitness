//
//  UserCredentials+CoreDataProperties.m
//  CC Fitness
//
//  Created by Student2 on 14/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "UserCredentials+CoreDataProperties.h"

@implementation UserCredentials (CoreDataProperties)

+ (NSFetchRequest<UserCredentials *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"UserCredentials"];
}

@dynamic username;
@dynamic password;

@end
