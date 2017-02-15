//
//  UserCredentials+CoreDataProperties.h
//  CC Fitness
//
//  Created by Hongxuan on 15/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "UserCredentials+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserCredentials (CoreDataProperties)

+ (NSFetchRequest<UserCredentials *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *dbPassword;
@property (nullable, nonatomic, copy) NSString *dbUsername;

@end

NS_ASSUME_NONNULL_END
