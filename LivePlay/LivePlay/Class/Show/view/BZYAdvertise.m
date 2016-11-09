//
//  BZYAdvertise.m
//  LivePlay
//
//  Created by Betsy on 2016/11/9.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYAdvertise.h"
#import "BZYLiveHandler.h"
#import "BZYADModel.h"
#import "BZYCacheHelper.h"

@interface BZYAdvertise ()

@property (strong, nonatomic) IBOutlet UIImageView *advertiseView;

@property (strong, nonatomic) IBOutlet UILabel *timelabel;

@property (strong, nonatomic) dispatch_source_t timer;

@end

static NSInteger showTime = 3;

@implementation BZYAdvertise

+(instancetype)loadAdvertiseView
{

    return [[[NSBundle mainBundle] loadNibNamed:@"BZYAdvertise" owner:self options:nil] lastObject];
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.frame = [UIScreen mainScreen].bounds;
    
    self.timelabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTouchUpInside:)];
    
    [self.timelabel addGestureRecognizer:labelTapGestureRecognizer];

    
    [self showAD];
    
    [self downLoadAD];
    
    [self startTime];
}



-(void) labelTouchUpInside:(UITapGestureRecognizer *)recognizer{
    NSLog(@"dianjiale ````~~~~~~~~~~~~");
    [self dismiss];
}

- (void)showAD
{

    NSString *fileName = [BZYCacheHelper getAdImage];
    
    NSString *filePath = [NSString stringWithFormat:@"%@%@",IMAGE_HOST,fileName];
    
    UIImage *last = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:filePath];
    
    if (last) {
        self.advertiseView.image = last;
    }else{
        [self setHidden:YES];
    }
    
}

- (void)downLoadAD
{
    [BZYLiveHandler executeGetAdvertiseTaskWithSuccess:^(id obj) {
        
        BZYADModel *ad = obj;
        
         NSURL * imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,ad.image]];
        
        //SDWebImageAvoidAutoSetImage 下载完成不会直接赋值给imageview
        [[SDWebImageManager sharedManager] downloadImageWithURL:imageUrl options:SDWebImageAvoidAutoSetImage progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            [BZYCacheHelper setAdImage:ad.image];
        }];
        
    } failed:^(id obj) {
        
    }];
}

- (void)startTime
{
    __block NSInteger time = showTime+1;
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    
    self.timer = timer;
    
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        
        if (time <= 0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismiss];
            });
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.timelabel.text = [NSString stringWithFormat:@"跳过%ld",(long)time] ;
               
            });
            time--;
        }
        
    });
    dispatch_resume(timer);
}

- (void)dismiss
{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
