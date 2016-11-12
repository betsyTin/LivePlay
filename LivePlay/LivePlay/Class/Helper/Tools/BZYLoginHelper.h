//
//  BZYLoginHelper.h
//  LivePlay
//
//  Created by Betsy on 2016/11/11.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BZYLoginHelper : NSObject

@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, copy) NSString *iconUrl;

+ (instancetype) sharedUser;

+ (BOOL) isAutoLogin;

+ (void) saveUserInformation;

@end
