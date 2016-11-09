//
//  BZYNearLiveCell.m
//  LivePlay
//
//  Created by Betsy on 2016/11/9.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYNearLiveCell.h"

@interface BZYNearLiveCell ()

@property (strong, nonatomic) IBOutlet UIImageView *headerView;

@property (strong, nonatomic) IBOutlet UILabel *distance;

@end

@implementation BZYNearLiveCell

- (void)showAnimation
{
    if (self.live.isShow) {
        return;
    }
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
        
        self.live.show = YES;
    }];
}


-(void)setLive:(BZYLiveModel *)live
{
    _live = live;
    
    [self.headerView downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
    
    if (live.distance) {
        self.distance.text = live.distance;
    }else{
        self.distance.text = @"未知";
    }
    
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
