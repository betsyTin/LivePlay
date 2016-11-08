//
//  BZYTabBar.h
//  LivePlay
//
//  Created by Betsy on 2016/11/5.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,BZYItemType) {
    BZYItemTypeLaunch = 10, //自己直播
    BZYItemTypeLive = 100, //直播
    BZYItemTypeMe,  //我的
};

@class BZYTabBar;

typedef void(^TabBlock)(BZYTabBar * tabbar,BZYItemType index);

@protocol BZYTabBarDelegate <NSObject>

- (void)tabbar:(BZYTabBar *)tabbar clickButton:(BZYItemType)index;

@end

@interface BZYTabBar : UIView

@property (nonatomic, weak) id<BZYTabBarDelegate>delegate;

@property (nonatomic, copy) TabBlock block;

@end
