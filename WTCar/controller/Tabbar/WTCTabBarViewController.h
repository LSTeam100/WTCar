//
//  WTCTabBarViewController.h
//  WTCar
//
//  Created by apple on 2016/10/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RDVTabBarController.h"
#import "WTCTabBarItem.h"
#import "WTCTabBar.h"
#import "WTCTabBarViewController.h"
@interface WTCTabBarViewController : RDVTabBarController

@end

@interface UIViewController (WTCTabBarControllerItem)

@property (nonatomic, strong, setter = WTCSetTabBarItem:) WTCTabBarItem *tabBarItem;
@property (nonatomic, readonly) WTCTabBarViewController *WTCTabBarController;

- (void)WTCSetTabBarController:(WTCTabBarViewController *)WTCTabBarController;
@end
