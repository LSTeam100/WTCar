//
//  WTCMapViewController.h
//  WTCar
//
//  Created by apple on 2016/10/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBaseViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface WTCMapViewController : WTCBaseViewController<BMKMapViewDelegate>
@property(nonatomic,weak)IBOutlet BMKMapView* _mapView;

@end
