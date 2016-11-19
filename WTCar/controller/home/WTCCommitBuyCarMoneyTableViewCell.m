//
//  WTCCommitBuyCarMoneyTableViewCell.m
//  WTCar
//
//  Created by apple on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCommitBuyCarMoneyTableViewCell.h"

@implementation WTCCommitBuyCarMoneyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.inputPriceTextField.returnKeyType = UIReturnKeyDone;
    self.inputPriceTextField.delegate = self;
    // Initialization code
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
