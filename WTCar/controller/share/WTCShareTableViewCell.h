//
//  WTCShareTableViewCell.h
//  WTCar
//
//  Created by apple on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTCShareTableViewCell : UITableViewCell
{
    BOOL			m_checked;
}
@property(nonatomic,weak)IBOutlet UIImageView *selectImageView;
@property(nonatomic,weak)IBOutlet UIImageView *titleImageView;
@property(nonatomic,weak)IBOutlet UILabel *titleLabel;
@property(nonatomic,weak)IBOutlet UILabel *dateLabel;
@property(nonatomic,weak)IBOutlet UILabel *priceLabel;
- (void)setChecked:(BOOL)checked;


@end
