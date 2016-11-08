//
//  BZYLiveHandler.m
//  LivePlay
//
//  Created by Betsy on 2016/11/7.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYLiveHandler.h"
#import "BZYLiveModel.h"

@implementation BZYLiveHandler

+ (void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed
{
    [HttpTool getWithPath:API_LiveGetTop params:nil success:^(id json) {
        
        if ([json[@"dm_error"] integerValue]) {
            
            //返回数据出现错误
            failed(json);
            
        }else{
            //如果返回数据正确，开始解析数据
           NSArray *lives = [BZYLiveModel mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            
        success(lives);
            
        }
        
    } failure:^(NSError *error) {
        failed(error);
    }];
}

@end
