//
//  HeadTableViewCell.h
//  WTCar
//
//  Created by apple on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadTableViewCell : UITableViewCell
@property(nonatomic,weak)IBOutlet UIImageView *profileImageView;
@property(nonatomic,weak)IBOutlet UILabel *shopNameLabel;
@property(nonatomic,weak)IBOutlet UILabel *shopOwnerLabel;
@end
