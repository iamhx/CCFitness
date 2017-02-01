//
//  LoginService.m
//  CC Fitness
//
//  Created by Student2 on 14/7/16.
//  Copyright © 2016 Hongxuan. All rights reserved.
//

#import "LoginService.h"

@implementation LoginService

-(id) init {
    self = [super init];
    if (self) {
        self.strUsername  = @"";
        self.strPassword = @"";
        self.success = false;
        
    }
    return self;
}

-(BOOL)success {
    NSArray *usersArray = [NSArray arrayWithObjects:@"admin", @"student", @"guest", nil];
    NSArray *pwdArray = [NSArray arrayWithObjects:@"ccadmin", @"ccstudent", @"ccguest", nil];
    
    int i = 0;
    while (i < [usersArray count]) {
        if ([self.strUsername isEqualToString:[usersArray objectAtIndex:i]] && [self.strPassword isEqualToString:[pwdArray objectAtIndex:i]])
        {
            return TRUE;
            break;
        }
        i++;
    }
    
    return FALSE;
}

@end
