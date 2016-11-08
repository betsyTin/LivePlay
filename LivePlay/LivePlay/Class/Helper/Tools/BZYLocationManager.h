//
//  BZYLocationManager.h
//  LivePlay
//
//  Created by Betsy on 2016/11/8.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LocationBlock)(NSString *lat, NSString *lon);

@interface BZYLocationManager : NSObject

+ (instancetype) sharedManager;

- (void)getGPS:(LocationBlock)block;

@property (nonatomic, copy) NSString *lat;
@property (nonatomic, copy) NSString *lon;

@end
