//
//  BZYNearLiveCell.h
//  LivePlay
//
//  Created by Betsy on 2016/11/9.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BZYLiveModel.h"

@interface BZYNearLiveCell : UICollectionViewCell

@property (nonatomic, strong) BZYLiveModel *live;

- (void)showAnimation;

@end
