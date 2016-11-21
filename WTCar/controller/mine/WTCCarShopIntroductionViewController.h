//
//  WTCCarShopIntroductionViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BRPlaceholderTextView.h"
#import "WTCBaseViewController.h"
@interface WTCCarShopIntroductionViewController : WTCBaseViewController
- (IBAction)SaveCarShopIntroButtonClick:(id)sender;
//@property (weak, nonatomic) IBOutlet UITextView *ShopIntroTextView;
@property(nonatomic,weak)IBOutlet BRPlaceholderTextView *textView;

@property(nonatomic,strong)NSString *shopDes;

@end
