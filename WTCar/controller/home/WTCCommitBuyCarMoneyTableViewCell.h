//
//  WTCCommitBuyCarMoneyTableViewCell.h
//  WTCar
//
//  Created by apple on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTCCommitBuyCarMoneyTableViewCell : UITableViewCell<UITextFieldDelegate>
@property(nonatomic,weak)IBOutlet UILabel * purchaseLabelPrice;
@property(nonatomic,weak)IBOutlet UITextField *inputPriceTextField;


@end
