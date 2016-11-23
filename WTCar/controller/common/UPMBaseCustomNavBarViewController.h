//
//  UPMBaseCustomNavBarViewController.h
//  UPMeilin
//
//  Created by 曾宏亮 on 15/7/23.
//  Copyright (c) 2015年 duanran. All rights reserved.
//

#import "WTCBaseViewController.h"
#import "UPMNavigatinBar.h"

@interface UPMBaseCustomNavBarViewController : WTCBaseViewController<UPMNavigationBarDelegate>

@property(nonatomic,strong)UPMNavigatinBar *naviGantionBar;

@end
