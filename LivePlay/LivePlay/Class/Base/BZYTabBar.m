//
//  BZYTabBar.m
//  LivePlay
//
//  Created by Betsy on 2016/11/5.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYTabBar.h"

@interface BZYTabBar ()

@property (nonatomic, strong) UIImageView *tabbarBgView;

@property (nonatomic, strong) NSArray *dataList;

@property (nonatomic, strong) NSArray *labelList;

@property (nonatomic, strong) UIButton *lastItem;

@property (nonatomic, strong) UILabel *lastLabel;

@property (nonatomic, strong) UIButton *cameraButton;

@end



@implementation BZYTabBar

- (UIButton *)cameraButton
{
    if (!_cameraButton) {
        _cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraButton setBackgroundImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_cameraButton sizeToFit];
        _cameraButton.tag = BZYItemTypeLaunch;
        [_cameraButton addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraButton;
}

- (NSArray *)dataList
{
    if (!_dataList) {
        _dataList = @[@"tab_live",@"tab_me"];
    }
    return _dataList;
}


- (NSArray *)labelList
{
    if (!_labelList) {
        _labelList = @[@"直播",@"我的"];
    }
    return _labelList;
}



- (UIImageView *)tabbarBgView
{
    if (!_tabbarBgView) {
        _tabbarBgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    
    return _tabbarBgView;
}



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tabbarBgView];
        
        
        for (int i=0; i<self.dataList.count; i++) {
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            UILabel *label = [[UILabel alloc] init];
            label.textColor = [UIColor colorWithRed:0.69 green:0.75 blue:0.76 alpha:1.00];
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:11];
            label.text = self.labelList[i];
            item.adjustsImageWhenHighlighted = NO;
            [item setImage:[UIImage imageNamed:self.dataList[i]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.dataList[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            item.tag = BZYItemTypeLive+i;
            label.tag = BZYItemTypeLive+i+10;
            if (i == 0) {
                item.selected = YES;
                self.lastItem = item;
            }
            if (item.selected == YES) {
                label.textColor = [UIColor colorWithRed:0.16 green:0.84 blue:0.78 alpha:1.00];
                self.lastLabel = label;
            }
            
            [self addSubview:item];
            //[self addSubview:label];
        }
        [self addSubview:self.cameraButton];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.tabbarBgView.frame = self.bounds;
    
    CGFloat width = self.bounds.size.width/self.dataList.count;
    
    for (NSInteger i = 0; i<[self subviews].count; i++) {
        
        UIButton *button = [self subviews][i];
        if ([button isKindOfClass:[UIButton class]]) {
            button.frame = CGRectMake((button.tag-BZYItemTypeLive)*width, 0, width, 49);
        }
        UILabel *label = [self subviews][i];
        if ([label isKindOfClass:[UILabel class]]) {
            label.frame = CGRectMake((label.tag-BZYItemTypeLive-10)*width, 29, width, 20);
        }
    }
    [self.cameraButton sizeToFit];
    self.cameraButton.center = CGPointMake(SCREEN_WIDTH/2, self.bounds.size.height-40);
    
}


- (void)clickItem:(UIButton*)button
{
    if ([self.delegate respondsToSelector:@selector(tabbar:clickButton:)]) {
        [self.delegate tabbar:self clickButton:button.tag];
    }
    
    //!self.block?:self.block(self,button.tag);
    if (self.block) {
        self.block(self,button.tag);
    }
    
    if (button.tag == BZYItemTypeLaunch) {
        return;
    }
    
    self.lastItem.selected = NO;
    button.selected = YES;
    self.lastItem = button;
    
    //自己加的tabbar文字
    if (button.selected == YES) {
        UILabel *label = [self viewWithTag:button.tag+10];
        self.lastLabel.textColor = [UIColor colorWithRed:0.69 green:0.75 blue:0.76 alpha:1.00];
        label.textColor = [UIColor colorWithRed:0.16 green:0.84 blue:0.78 alpha:1.00];
        self.lastLabel = label;
    }
    
    
    [UIView animateWithDuration:0.2 animations:^{
        UILabel *label = [self viewWithTag:button.tag+10];
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
        label.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            UILabel *label = [self viewWithTag:button.tag+10];
            button.transform = CGAffineTransformIdentity;
            label.transform = CGAffineTransformIdentity;
        }];
    }];
}

@end
