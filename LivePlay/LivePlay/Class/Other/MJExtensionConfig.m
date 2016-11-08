//
//  MJExtensionConfig.m
//  LivePlay
//
//  Created by Betsy on 2016/11/7.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "MJExtensionConfig.h"
#import "MJExtension.h"
#import "BZYCreatorModel.h"
#import "BZYLiveModel.h"

@implementation MJExtensionConfig

+ (void)load {
    
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID" : @"id"
                 };
    }];
    
    [BZYCreatorModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"desc" : @"desciption"
                 };
    }];
    
    //下滑线
    [BZYCreatorModel mj_setupReplacedKeyFromPropertyName121:^NSString *(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
    
    [BZYLiveModel mj_setupReplacedKeyFromPropertyName121:^NSString *(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
}

@end
