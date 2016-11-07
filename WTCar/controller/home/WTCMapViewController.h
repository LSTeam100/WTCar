//
//  WTCMapViewController.h
//  WTCar
//
//  Created by apple on 2016/10/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBaseViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>

@interface WTCMapViewController : WTCBaseViewController<BMKMapViewDelegate,BMKGeoCodeSearchDelegate,BMKLocationServiceDelegate>
{
    IBOutlet UITextField* _coordinateXText;
    IBOutlet UITextField* _coordinateYText;
    IBOutlet UITextField* _cityText;
    IBOutlet UITextField* _addrText;
    BMKGeoCodeSearch* _geocodesearch;
    BMKLocationService* _locService;

}
@property(nonatomic,weak)IBOutlet BMKMapView* _mapView;
-(IBAction)onClickGeocode;
-(IBAction)onClickReverseGeocode;
- (IBAction)textFiledReturnEditing:(id)sender;
-(void)startLocation;
-(IBAction)stopLocation:(id)sender;

@end
