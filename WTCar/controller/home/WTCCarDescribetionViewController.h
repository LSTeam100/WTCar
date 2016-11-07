//
//  WTCCarDescribetionViewController.h
//  WTCar
//
//  Created by apple on 2016/11/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBaseViewController.h"
#import "BRPlaceholderTextView.h"

@protocol DescribetionControllerDelegate <NSObject>

-(void)saveCarDescribtion:(NSString *)des;

@end

@interface WTCCarDescribetionViewController : WTCBaseViewController
@property(nonatomic,weak)IBOutlet BRPlaceholderTextView *textView;
@property(nonatomic,weak)id desDelegate;
@end
