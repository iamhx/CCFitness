//
//  UserCredentials+CoreDataProperties.h
//  CC Fitness
//
//  Created by Student2 on 14/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "UserCredentials+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserCredentials (CoreDataProperties)

+ (NSFetchRequest<UserCredentials *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *username;
@property (nullable, nonatomic, copy) NSString *password;

@end

NS_ASSUME_NONNULL_END
