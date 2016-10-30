//
//  WTCCarShanreTableViewCell.h
//  WTCar
//
//  Created by apple on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTCCarShanreTableViewCell : UITableViewCell
@property(nonatomic,weak)IBOutlet UIImageView *shanreImageView;
@property(nonatomic,weak)IBOutlet UILabel *titleLabel;
@property(nonatomic,weak)IBOutlet UILabel *dateLabel;
@property(nonatomic,weak)IBOutlet UILabel *priceLabel;

@property(nonatomic,weak)IBOutlet UIButton *multipleShareBtn;
@property(nonatomic,weak)IBOutlet UIButton *wechatBtn;
@property(nonatomic,weak)IBOutlet UIButton *firendsBtn;
@property(nonatomic,weak)IBOutlet UIView *multipleShareView;
@property(nonatomic,weak)IBOutlet UIView *wechatView;
@property(nonatomic,weak)IBOutlet UIView *firendView;
@property(nonatomic,weak)IBOutlet UIImageView *multipleShareImageview;
@property(nonatomic,weak)IBOutlet UIImageView *wechatImageview;
@property(nonatomic,weak)IBOutlet UIImageView *firendImageview;



@end
