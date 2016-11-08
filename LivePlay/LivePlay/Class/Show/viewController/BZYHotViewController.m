//
//  BZYHotViewController.m
//  LivePlay
//
//  Created by Betsy on 2016/11/6.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYHotViewController.h"
#import "BZYLiveHandler.h"
#import "BZYLiveCell.h"

@interface BZYHotViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

static NSString *indentifier = @"BZYLiveCell.h";

@implementation BZYHotViewController

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BZYLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    cell.live = self.dataArray[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70+SCREEN_WIDTH;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self initUI];
    
    [self loadData];
}

- (void)initUI{
    [self.tableView registerNib:[UINib nibWithNibName:@"BZYLiveCell" bundle:nil] forCellReuseIdentifier:indentifier];
}

- (void)loadData{

    [BZYLiveHandler executeGetHotLiveTaskWithSuccess:^(id obj) {
       
        [self.dataArray addObjectsFromArray:obj];
        [self.tableView reloadData];
        
    } failed:^(id obj) {
        
    }];
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
