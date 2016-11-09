//
//  BZYNearViewController.m
//  LivePlay
//
//  Created by Betsy on 2016/11/6.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYNearViewController.h"
#import "BZYLiveHandler.h"
#import "BZYNearLiveCell.h"
#import "BZYPlayerViewController.h"

#define kItemSizeW 100
#define kMargin 5

@interface BZYNearViewController ()<UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSArray *dataList;

@end

static NSString *Identifier = @"Identifier";

@implementation BZYNearViewController

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    BZYPlayerViewController * playerVC = [[BZYPlayerViewController alloc] init];
    
    playerVC.live = self.dataList[indexPath.row];
    
    [self.navigationController pushViewController:playerVC animated:YES];
}

//cell将要展示的时候启动动画
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BZYNearLiveCell * c = (BZYNearLiveCell *)cell;
    
    [c showAnimation];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    
    NSInteger count = self.collectionView.width / kItemSizeW;
    NSInteger extraTotal = (self.collectionView.width - kMargin * (count + 1))/count;
    
    
    return CGSizeMake(extraTotal, extraTotal + 20);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BZYNearLiveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Identifier forIndexPath:indexPath];
    
    cell.live = self.dataList[indexPath.row];
    
    return cell;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
    [self loadData];
    
}

- (void)initUI
{
    [self.collectionView registerNib:[UINib nibWithNibName:@"BZYNearLiveCell" bundle:nil] forCellWithReuseIdentifier:Identifier];
}

- (void)loadData
{
    [BZYLiveHandler executeGetNearLiveTaskWithSuccess:^(id obj) {
        
        NSLog(@"xinxi === %@",obj);
        
        self.dataList = obj;
        
        [self.collectionView reloadData];
        
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
