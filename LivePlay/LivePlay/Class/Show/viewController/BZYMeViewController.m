//
//  BZYMeViewController.m
//  LivePlay
//
//  Created by Betsy on 2016/11/5.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYMeViewController.h"
#import "BZYMeView.h"
#import "BZYSetting.h"

@interface BZYMeViewController ()

@property (nonatomic, strong) BZYMeView * headerView;

@property (nonatomic, strong) NSArray * dataList;

@end

@implementation BZYMeViewController

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
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self initUI];
    
    [self loadData];
}
- (void)initUI {
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.rowHeight = 60;
    self.tableView.sectionFooterHeight = 5;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
}

- (void)loadData
{
    BZYSetting *set1 = [[BZYSetting alloc] init];
    set1.title = @"映客贡献榜";
    set1.subTitle = @"";
    set1.vcName = @"bzyGongxianbang";
    
    BZYSetting *set2 = [[BZYSetting alloc] init];
    set2.title = @"收益";
    set2.subTitle = @"0 映票";
    set2.vcName = @"bzyshouyi";
    
    BZYSetting *set3 = [[BZYSetting alloc] init];
    set3.title = @"账户";
    set3.subTitle = @"0 钻石";
    set3.vcName = @"bzyzhanghu";
    
    BZYSetting *set4 = [[BZYSetting alloc] init];
    set4.title = @"等级";
    set4.subTitle = @"9 级";
    set4.vcName = @"bzydengji";
    
    BZYSetting * set5 = [[BZYSetting alloc] init];
    set5.title = @"实名认证";
    set5.subTitle = @"";
    set5.vcName = @"";
    
    BZYSetting *set6 = [[BZYSetting alloc] init];
    set6.title = @"设置";
    set6.subTitle = @"";
    set6.vcName = @"bzyshezhi";
    
    NSArray *arr1 = @[set1,set2,set3];
    
    NSArray *arr2 = @[set4,set5];
    
    NSArray *arr3 = @[set6];

    self.dataList = @[arr1,arr2,arr3];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray * arr = self.dataList[section];
    
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    BZYSetting * set = self.dataList[indexPath.section][indexPath.row];
    
    cell.textLabel.text = set.title;
    cell.textLabel.textColor = [UIColor grayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.detailTextLabel.text = set.subTitle;
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return self.headerView;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return SCREEN_HEIGHT*0.4;
    }
    
    return 5;
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
