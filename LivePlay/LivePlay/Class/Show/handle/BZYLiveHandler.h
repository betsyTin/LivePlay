//
//  BZYLiveHandler.h
//  LivePlay
//
//  Created by Betsy on 2016/11/7.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYBaseHandle.h"

@interface BZYLiveHandler : BZYBaseHandle


/**
 获取热门直播信息

 @param success 成功
 @param failed  失败
 */
+ (void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;

@end
