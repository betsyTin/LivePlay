//
//  BZYLiveView.h
//  LivePlay
//
//  Created by Betsy on 2016/11/6.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BackLiveBlock)(NSInteger tag);

@interface BZYLiveView : UIView

-(instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles;

@property (nonatomic, copy) BackLiveBlock block;

- (void)setBlock:(BackLiveBlock)block;

- (void)scrolling:(NSInteger)tag;

@end
