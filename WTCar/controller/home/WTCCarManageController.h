//
//  WTCCarManageController.h
//  WTCar
//
//  Created by apple on 2016/10/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WTCBaseViewController.h"
@interface WTCCarManageController : WTCBaseViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UISegmentedControl *segmentedControl;
@property(nonatomic,strong)IBOutlet UITableView *tableView;
@property(nonatomic,weak)IBOutlet UIView *mangeView;
@property(nonatomic,weak)IBOutlet UIView *modifyView;
@property(nonatomic,weak)IBOutlet UIButton *cancelBtn;
@property(nonatomic,weak)IBOutlet NSLayoutConstraint *bottomViewConstraint;
@property(nonatomic,weak)IBOutlet UIButton *onSaleBtn;
@property(nonatomic,weak)IBOutlet UIButton *saledBtn;
@property(nonatomic,weak)IBOutlet UIButton *offShelfBtn;
@property(nonatomic,weak)IBOutlet UIView *saledView;
@property(nonatomic,weak)IBOutlet UIView *offShelfView_edite;
@property(nonatomic,weak)IBOutlet UIView *offShelfView_upView;


@end
