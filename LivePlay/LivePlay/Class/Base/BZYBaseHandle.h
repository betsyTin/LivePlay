//
//  BZYBaseHandle.h
//  LivePlay
//
//  Created by Betsy on 2016/11/7.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import <Foundation/Foundation.h>


//处理完成事件
typedef void(^CompleteBlock)();


//处理成功事件
typedef void(^SuccessBlock)(id obj);


//处理失败事件
typedef void(^FailedBlock)(id obj);



@interface BZYBaseHandle : NSObject



@end
