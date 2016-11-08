//
//  BZYLiveChatViewController.m
//  LivePlay
//
//  Created by Betsy on 2016/11/8.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYLiveChatViewController.h"

@interface BZYLiveChatViewController ()

@end

@implementation BZYLiveChatViewController

-(void)setLive:(BZYLiveModel *)live
{
    _live = live;
    [self.iconImage downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
    
    [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer * _Nonnull timer) {
        
        self.nameLabel.text = [NSString stringWithFormat:@"%u",arc4random_uniform(10000)];
        
    } repeats:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
