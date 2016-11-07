//
//  HeadPhotoTableViewCell.h
//  WTCar
//
//  Created by apple on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadPhotoTableViewCell : UITableViewCell
@property(nonatomic,weak)IBOutlet UILabel *photoLabel;
@property(nonatomic,weak)IBOutlet UIImageView *photoImageView;
@property(nonatomic,weak)IBOutlet UITextField *infoTextField;


@end
