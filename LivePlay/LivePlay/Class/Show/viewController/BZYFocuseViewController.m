//
//  BZYFocuseViewController.m
//  LivePlay
//
//  Created by Betsy on 2016/11/6.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYFocuseViewController.h"
#import "BZYPlayerViewController.h"
#import "BZYLiveCell.h"

@interface BZYFocuseViewController ()

@property (nonatomic, strong) NSMutableArray *dataList;

@end

static NSString *FocuseID = @"focuseindentifier";

@implementation BZYFocuseViewController


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BZYLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:FocuseID];
    cell.live = self.dataList[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70+SCREEN_WIDTH;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BZYLiveModel *live = self.dataList[indexPath.row];
    BZYPlayerViewController *vc = [[BZYPlayerViewController alloc] init];
    vc.live = live;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.view.backgroundColor = [UIColor orangeColor];
    
    [self initUI];
    
    [self loadData];
}

- (void)initUI{
    [self.tableView registerNib:[UINib nibWithNibName:@"BZYLiveCell" bundle:nil] forCellReuseIdentifier:FocuseID];
}

- (NSMutableArray *)dataList
{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

- (void)loadData{
    BZYLiveModel * live = [[BZYLiveModel alloc] init];
    live.streamAddr = Live_Betsy;
    live.city = @"上海";
    live.onlineUsers = 9879;
    
    
    BZYCreatorModel * creator = [[BZYCreatorModel alloc] init];
    live.creator = creator;
    creator.nick = @"betsy";
    
    [self.dataList addObject:live];
    [self.tableView reloadData];
}

@end
