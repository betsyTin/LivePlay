//
//  BZYLoginHelper.m
//  LivePlay
//
//  Created by Betsy on 2016/11/11.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYLoginHelper.h"

@implementation BZYLoginHelper

+(instancetype)sharedUser
{
    static BZYLoginHelper *_bzyLoginHelp = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_bzyLoginHelp) {
            _bzyLoginHelp = [[BZYLoginHelper alloc] init];
        }
    });
    return _bzyLoginHelp;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _nickName = [[NSUserDefaults standardUserDefaults] objectForKey:@"nickName"];
        _iconUrl = [[NSUserDefaults standardUserDefaults] objectForKey:@"iconUrl"];
    }
    return self;
}

+ (BOOL)isAutoLogin
{
    if (![BZYLoginHelper sharedUser].nickName.length) {
        return NO;
    }
    return YES;
}

+ (void)saveUserInformation
{
    if ([BZYLoginHelper sharedUser].nickName.length) {
        [[NSUserDefaults standardUserDefaults] setObject:[BZYLoginHelper sharedUser].nickName forKey:@"nickName"];
        [[NSUserDefaults standardUserDefaults] setObject:[BZYLoginHelper sharedUser].iconUrl forKey:@"iconUrl"];
    }
}

@end
