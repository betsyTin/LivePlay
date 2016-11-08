//
//  BZYLaunchViewController.m
//  LivePlay
//
//  Created by Betsy on 2016/11/6.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYLaunchViewController.h"

@interface BZYLaunchViewController ()

@end

@implementation BZYLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)closeLaunch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
