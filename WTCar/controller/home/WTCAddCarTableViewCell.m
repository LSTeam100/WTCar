//
//  WTCAddCarTableViewCell.m
//  WTCar
//
//  Created by apple on 2016/10/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCAddCarTableViewCell.h"
#import "define.h"



@implementation WTCAddCarTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}
-(void)layoutSubviews
{
    self.infoField.borderStyle = UITextBorderStyleNone;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
