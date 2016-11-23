//
//  WTCBusinessVerityViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBaseViewController.h"

@interface WTCBusinessVerityViewController :WTCBaseViewController
- (IBAction)ConfirmBusinessButtonClick:(id)sender;
- (IBAction)VeritylicencePicButtonClick:(id)sender;
@property(nonnull,strong)IBOutlet UIImageView *shopImageView;
@property(nonatomic,strong)NSString *uploadLicenseUrl;


@end
