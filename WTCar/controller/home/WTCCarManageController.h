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
@property(nonatomic,strong)IBOutlet UITableView *tableview;
@end
