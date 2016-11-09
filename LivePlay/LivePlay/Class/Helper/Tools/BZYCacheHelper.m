//
//  BZYCacheHelper.m
//  LivePlay
//
//  Created by Betsy on 2016/11/9.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYCacheHelper.h"
#define advertise @"adimage"

@implementation BZYCacheHelper

+(NSString *)getAdImage
{

    return [[NSUserDefaults standardUserDefaults] objectForKey:advertise];

}

+(void)setAdImage:(NSString *)adImage
{
    [[NSUserDefaults standardUserDefaults] setObject:adImage forKey:advertise];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
