//
//  BZYPersonViewController.m
//  LivePlay
//
//  Created by Betsy on 2016/11/12.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYPersonViewController.h"
#import "BZYMeView.h"

@interface BZYPersonViewController ()

@property (nonatomic, strong) BZYMeView * headerView;

@property (nonatomic, strong) NSMutableArray * dataList;

@end

@implementation BZYPersonViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (BZYMeView *)headerView {
    
    if (!_headerView) {
        _headerView = [BZYMeView loadHeaderView];
    }
    return _headerView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView = self.headerView;
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
