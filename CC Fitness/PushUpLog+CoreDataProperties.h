//
//  PushUpLog+CoreDataProperties.h
//  CC Fitness
//
//  Created by Hongxuan on 19/2/17.
//  Copyright © 2017 Hongxuan. All rights reserved.
//

#import "PushUpLog+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface PushUpLog (CoreDataProperties)

+ (NSFetchRequest<PushUpLog *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *attemptCategory;
@property (nullable, nonatomic, copy) NSDate *attemptDate;
@property (nonatomic) int32_t numOfReps;
@property (nullable, nonatomic, copy) NSString *timeElapsed;
@property (nullable, nonatomic, copy) NSString *userName;

@end

NS_ASSUME_NONNULL_END
