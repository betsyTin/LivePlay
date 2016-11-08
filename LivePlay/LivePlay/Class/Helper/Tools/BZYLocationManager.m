//
//  BZYLocationManager.m
//  LivePlay
//
//  Created by Betsy on 2016/11/8.
//  Copyright © 2016年 betsy. All rights reserved.
//

#import "BZYLocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface BZYLocationManager ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locManager;

@property (nonatomic, copy) LocationBlock locationBlock;

@end

@implementation BZYLocationManager

+ (instancetype) sharedManager
{
    static BZYLocationManager *_manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[BZYLocationManager alloc]init];
    });
    return _manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _locManager = [[CLLocationManager alloc] init];
        [_locManager setDesiredAccuracy:kCLLocationAccuracyBest];
        _locManager.distanceFilter = 100;
        _locManager.delegate = self;
        
        if (![CLLocationManager locationServicesEnabled]) {
            NSLog(@"开启定位服务");
        }else{
        
            CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
            if (status == kCLAuthorizationStatusNotDetermined) {
                [_locManager requestWhenInUseAuthorization];
            }
            
        }
    }
    return self;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocationCoordinate2D coor = newLocation.coordinate;
    
    NSString *latitude = [NSString stringWithFormat:@"%@",@(coor.latitude)];
    NSString *longitude = [NSString stringWithFormat:@"%@",@(coor.longitude)];
    
    [BZYLocationManager sharedManager].lat = latitude;
    [BZYLocationManager sharedManager].lat = longitude;
    
    self.locationBlock(latitude,longitude);
    
    [self.locManager stopUpdatingLocation];
    NSLog(@"经度===%f纬度====%f",coor.latitude,coor.longitude);
}

- (void)getGPS:(LocationBlock)block
{
    self.locationBlock = block;
    
    [self.locManager startUpdatingLocation];
}


@end
