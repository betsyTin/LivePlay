//
//  BZYLiveView.m
//  LivePlay
//
//  Created by Betsy on 2016/11/6.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYLiveView.h"

@interface BZYLiveView ()

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) NSMutableArray *buttons;

@end



@implementation BZYLiveView

- (NSMutableArray *)buttons
{
    if (!_buttons) {
        _buttons = [[NSMutableArray alloc] init];
    }
    return _buttons;
}

-(instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat btnW = self.width/titles.count;
        CGFloat btnH = self.height;
        
        for (NSInteger i = 0; i<titles.count; i++) {
            
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            NSString *vcName = titles[i];
            
            [titleBtn setTitle:vcName forState:UIControlStateNormal];
            
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:18];
            
            titleBtn.tag = i;
            
            [self.buttons addObject:titleBtn];
            
            titleBtn.frame = CGRectMake(i*btnW, 0, btnW, btnH);
            
            [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:titleBtn];
            
            
            if (i == 1) {
                
                CGFloat y = 40;
                CGFloat h = 2;
                
                [titleBtn.titleLabel sizeToFit];
                
                self.lineView =[[UIView alloc] init];
                self.lineView.backgroundColor = [UIColor whiteColor];
            
                self.lineView.width = titleBtn.titleLabel.width;
                self.lineView.height = h;
                self.lineView.top = y;
                self.lineView.centerX = titleBtn.centerX;
                
                [self addSubview:self.lineView];
            }
        }
    }
    return self;
}

//LiveVC滚动时调用
- (void)scrolling:(NSInteger)tag
{
    UIButton *button = [self.buttons objectAtIndex:tag];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.lineView.centerX = button.centerX;
    } completion:nil];
}

//按钮点击时调用as
- (void)titleClick:(UIButton *)button
{
    if (self.block) {
        self.block(button.tag);
    }
    [self scrolling:button.tag];
}


@end
