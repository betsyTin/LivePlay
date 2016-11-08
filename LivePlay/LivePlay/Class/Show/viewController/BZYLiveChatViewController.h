//
//  BZYLiveChatViewController.h
//  LivePlay
//
//  Created by Betsy on 2016/11/8.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYBaseViewController.h"
#import "BZYLiveModel.h"

@interface BZYLiveChatViewController : BZYBaseViewController

@property (strong, nonatomic) BZYLiveModel *live;

@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UIButton *yingPiaoLabel;

@end
