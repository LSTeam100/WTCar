//
//  WTCBaseViewController.h
//  WTCar
//
//  Created by apple on 2016/10/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTCarBaseRequest.h"
@interface WTCBaseViewController : UIViewController
-(void)setBusyIndicatorVisible:(BOOL)visible;

-(BOOL)handleResponseError:(WTCBaseViewController *)currentController
                   request:(WTCarBaseRequest *)request
       treatErrorAsUnknown:(BOOL) treated;

-(void)setSigleButtonBg:(UIButton *)button;

-(void)showDefaultFailureMessage;

-(void)showMessage:(NSString *)message;


@end
