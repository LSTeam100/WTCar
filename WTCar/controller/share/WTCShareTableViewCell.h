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
}
@property(nonatomic,weak)IBOutlet UIImageView *selectImageView;
@property(nonatomic,weak)IBOutlet UIImageView *titleImageView;
@property(nonatomic,weak)IBOutlet UILabel *titleLabel;
@property(nonatomic,weak)IBOutlet UILabel *dateLabel;
@property(nonatomic,weak)IBOutlet UILabel *priceLabel;
@property(nonatomic,assign)BOOL m_checked;

- (void)setChecked:(BOOL)checked;


@end
