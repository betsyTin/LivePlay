//
//  BZYLiveModel.h
//  LivePlay
//
//  Created by Betsy on 2016/11/7.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BZYCreatorModel.h"

@interface BZYLiveModel : NSObject

@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) BZYCreatorModel * creator;
@property (nonatomic, assign) NSInteger group;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, assign) NSInteger link;
@property (nonatomic, assign) NSInteger multi;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger onlineUsers;
@property (nonatomic, assign) NSInteger optimal;
@property (nonatomic, assign) NSInteger pubStat;
@property (nonatomic, assign) NSInteger roomId;
@property (nonatomic, assign) NSInteger rotate;
@property (nonatomic, strong) NSString * shareAddr;
@property (nonatomic, assign) NSInteger slot;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * streamAddr;
@property (nonatomic, assign) NSInteger version;


@property (nonatomic, strong) NSString * distance;

@property (nonatomic, getter=isShow) BOOL show;

@end
