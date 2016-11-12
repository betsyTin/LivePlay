//
//  BZYLiveCell.m
//  LivePlay
//
//  Created by Betsy on 2016/11/7.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYLiveCell.h"

@interface BZYLiveCell ()

@property (strong, nonatomic) IBOutlet UIImageView *headView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) IBOutlet UILabel *onLineLabel;
@property (strong, nonatomic) IBOutlet UIImageView *liveView;



@end

@implementation BZYLiveCell

- (void)setLive:(BZYLiveModel *)live
{
    _live = live;
    
    
    
//    [self.headView downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
//     [self.liveView downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
    
    self.nameLabel.text = live.creator.nick;
    self.locationLabel.text = live.city;
    self.onLineLabel.text = [@(live.onlineUsers) stringValue];//@()先转number类型，[]再转string类型
    
    if ([live.creator.nick isEqualToString:@"betsy"]) {
        
        self.headView.image = [UIImage  imageNamed:@"hehe.jpg"];
        self.liveView.image = [UIImage  imageNamed:@"hehe.jpg"];
        
    } else {
        
        [self.headView downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
        [self.liveView downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
    }

    
   
}


- (void)awakeFromNib {
    [super awakeFromNib];
//    self.headView.layer.cornerRadius = 25;
//    self.headView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
