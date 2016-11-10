//
//  WTCShareTableViewCell.m
//  WTCar
//
//  Created by apple on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCShareTableViewCell.h"

@implementation WTCShareTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setChecked:(BOOL)checked{
    if (checked)
    {
        self.selectImageView.image = [UIImage imageNamed:@"share_select"];
    }
    else
    {
        self.selectImageView.image = [UIImage imageNamed:@"share_unselect"];
    }
   self.m_checked = checked;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
