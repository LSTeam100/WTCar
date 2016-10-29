//
//  WTCCarManageTableViewCell.h
//  WTCar
//
//  Created by apple on 2016/10/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTCCarManageTableViewCell : UITableViewCell
@property(nonatomic,weak)IBOutlet UIImageView *carImageView;
@property(nonatomic,weak)IBOutlet UILabel *nameLabel;
@property(nonatomic,weak)IBOutlet UILabel *priceLabel;
@property(nonatomic,weak)IBOutlet UILabel *dateLabel;
@property(nonatomic,weak)IBOutlet UILabel *browserNumLabel;
@property(nonatomic,weak)IBOutlet UILabel *callNumLabel;
@property(nonatomic,weak)IBOutlet UILabel *sellLabel;
@property(nonatomic,weak)IBOutlet UIButton *collectPayBtn;
@property(nonatomic,weak)IBOutlet UIButton *shareBtn;
@property(nonatomic,weak)IBOutlet UIButton *manageBtn;

@end
