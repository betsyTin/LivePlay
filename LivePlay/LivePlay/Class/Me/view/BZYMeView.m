//
//  BZYMeView.m
//  LivePlay
//
//  Created by Betsy on 2016/11/12.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYMeView.h"

@implementation BZYMeView

+ (instancetype) loadHeaderView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"BZYMeView" owner:nil options:nil] lastObject];
}

@end
