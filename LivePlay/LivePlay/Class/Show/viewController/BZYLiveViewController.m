//
//  BZYLiveViewController.m
//  LivePlay
//
//  Created by Betsy on 2016/11/5.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYLiveViewController.h"
#import "BZYLiveView.h"

@interface BZYLiveViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *contentScrollView;

@property (strong, nonatomic) NSArray *dataArray;

@property (strong, nonatomic) BZYLiveView *topView;

@end

@implementation BZYLiveViewController

- (BZYLiveView *)topView
{
    if (!_topView) {
        _topView = [[BZYLiveView alloc]initWithFrame:CGRectMake(0, 0, 200, 50) titleNames:self.dataArray];
        
        //__weak typeof(self) weakSelf = self;
        
        @weakify(self);
        [_topView setBlock:^(NSInteger tag) {
            
            @strongify(self);
            CGPoint point = CGPointMake(tag*SCREEN_WIDTH, self.contentScrollView.contentOffset.y);
            [self.contentScrollView setContentOffset:point animated:YES];
        }];
    }
    return _topView;
}


- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSArray arrayWithObjects:@"关注",@"热门",@"附近", nil];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI{
    [self setupNav];
    
    [self setupContentViewControllers];
}

- (void)setupNav
{
    self.navigationItem.titleView = self.topView;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];
}

- (void)setupContentViewControllers
{
    NSArray *vcArray = [NSArray arrayWithObjects:@"BZYFocuseViewController",@"BZYHotViewController",@"BZYNearViewController", nil];
    for (NSInteger i = 0; i < [vcArray count]; i++) {
        NSString *vcName = vcArray[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        vc.title = self.dataArray[i];
        
        //当执行addChildViewController时，不会走该VC的viewDidLoad方法
        [self addChildViewController:vc];
    }
    
    self.contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*self.dataArray.count, 0);
    
    self.contentScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
   
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
}

//滑动减速后调用加载子视图控制器
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    CGFloat width = SCREEN_WIDTH;
    CGFloat height = scrollView.frame.size.height;
    CGFloat offset = scrollView.contentOffset.x;
    //获取索引值
    NSInteger index = offset/width;
    
    //滚动视图时，调用此方法联动导航栏上的三个按钮的动画效果
    [self.topView scrolling:index];
    
    //根据索引值返回vc引用
    UIViewController *vc = self.childViewControllers[index];
    
    //
    if ([vc isViewLoaded]) return;
    
    vc.view.frame = CGRectMake(offset, 0, scrollView.frame.size.width, height);
    [scrollView addSubview:vc.view];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self scrollViewDidEndDecelerating:scrollView];
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
