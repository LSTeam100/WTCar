//
//  ChildAccountTableViewCell.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChildAccountTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *ChildAccountNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ChildAccountTeleLabel;
@property (weak, nonatomic) IBOutlet UIButton *ChangeChildAccountButton;
@property (weak, nonatomic) IBOutlet UIButton *DeleChildAccountButton;

@end
