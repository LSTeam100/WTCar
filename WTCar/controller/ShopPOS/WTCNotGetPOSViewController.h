//
//  WTCNotGetPOSViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import"WTCBaseViewController.h"
@interface WTCNotGetPOSViewController : WTCBaseViewController
//获取店铺POS
@property(nonatomic,assign)int posFag;
- (IBAction)ToGetPOSButtonClick:(id)sender;
@property(nonatomic,weak)IBOutlet UIButton *posBtn;

@end
