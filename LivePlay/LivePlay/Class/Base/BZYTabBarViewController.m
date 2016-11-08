//
//  BZYTabBarViewController.m
//  LivePlay
//
//  Created by Betsy on 2016/11/5.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYTabBarViewController.h"
#import "BZYNavViewController.h"
#import "BZYLaunchViewController.h"
#import "BZYTabBar.h"

@interface BZYTabBarViewController ()<BZYTabBarDelegate>

@property (nonatomic,strong) BZYTabBar *bzyTabBar;

@end

@implementation BZYTabBarViewController

- (BZYTabBar *)bzyTabBar
{
    if (!_bzyTabBar) {
        _bzyTabBar = [[BZYTabBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        _bzyTabBar.delegate = self;
    }
    return _bzyTabBar;
}

- (void)tabbar:(BZYTabBar *)tabbar clickButton:(BZYItemType)index
{
    if (index != BZYItemTypeLaunch) {
        self.selectedIndex = index-BZYItemTypeLive;
        return;
    }
    BZYLaunchViewController *vc = [[BZYLaunchViewController alloc] init];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    //加载控制器
    [self initViewControllers];
    
    //加载tabbar
    [self.tabBar addSubview:self.bzyTabBar];
    
    
    //去掉tabbar的阴影和那条线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
}

- (void)initViewControllers
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"BZYLiveViewController",@"BZYMeViewController"]];

    for (NSInteger i = 0; i<array.count; i++) {
        NSString *vcName = array[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        
        BZYNavViewController *nav = [[BZYNavViewController alloc] initWithRootViewController:vc];
        
        [array replaceObjectAtIndex:i withObject:nav];
    }
    self.viewControllers = array;
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
