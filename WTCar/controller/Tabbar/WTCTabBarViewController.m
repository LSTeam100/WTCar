//
//  WTCTabBarViewController.m
//  WTCar
//
//  Created by apple on 2016/10/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCTabBarViewController.h"
#import "WTCHomeViewController.h"
#import "WTCMineViewController.h"
#import "WTCShareViewController.h"
#import "WTCTabBarItem.h"
#import <objc/runtime.h>
#import "WTCCarManageController.h"
#import "WTCCarBrandViewController.h"
#import "WTCAddCarViewController.h"
@interface WTCTabBarViewController ()

@end

@implementation WTCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setControllers];
    // Do any additional setup after loading the view.
}
-(void)setControllers
{

    WTCAddCarViewController *home=[[WTCAddCarViewController alloc]init];

//    WTCCarManageController *home=[[WTCCarManageController alloc]init];
//    WTCHomeViewController *home = [[WTCHomeViewController alloc]init];

    UINavigationController *homeNav=[[UINavigationController alloc]initWithRootViewController:home];
    WTCShareViewController *share=[[WTCShareViewController alloc]initWithNibName:@"WTCShareViewController" bundle:nil];
    UINavigationController *shareNav=[[UINavigationController alloc]initWithRootViewController:share];
    WTCMineViewController *mine=[[WTCMineViewController alloc]initWithNibName:@"WTCMineViewController" bundle:nil];
    UINavigationController *mineNav=[[UINavigationController alloc]initWithRootViewController:mine];
    NSArray *navArr=@[homeNav,shareNav,mineNav];
    [self setViewControllers:navArr];
    
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"findClick", @"orderList", @"mine"];
    NSArray *tabBarTitle = @[@"梧桐汽车",@"分享",@"我的"];
    
    
    [self.tabBar setFrame:CGRectMake(CGRectGetMinX(self.tabBar.frame), CGRectGetMinY(self.tabBar.frame), CGRectGetWidth(self.tabBar.frame), 63)];
    NSInteger index = 0;
    for (WTCTabBarItem *item in self.tabBar.items) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        [item setTitle:[tabBarTitle objectAtIndex:index]];
        
        index++;
    }
    self.navigationController.navigationBar.hidden=YES;
}
- (NSInteger)indexForViewController:(UIViewController *)viewController{
    UIViewController *searchedController = viewController;
    // 保存的可能是 UINavigationController
    if (searchedController.navigationController) {
        searchedController = searchedController.navigationController;
    }
    return [self.viewControllers indexOfObject:searchedController];
}
- (void)setTabBarHidden:(BOOL)hidden {
    [self setTabBarHidden:hidden animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

#pragma mark - UIViewController+UPMTabBarControllerItem

@implementation UIViewController (WTCTabBarControllerItem)

- (void)WTCSetTabBarController:(WTCTabBarViewController *)WTCTabBarController {
    objc_setAssociatedObject(self, @selector(WTCTabBarController), WTCTabBarController, OBJC_ASSOCIATION_ASSIGN);
}

- (WTCTabBarViewController *)WTCTabBarController{
    WTCTabBarViewController *tabBarController = objc_getAssociatedObject(self, @selector(WTCTabBarController));
    if (!tabBarController && self.parentViewController) {
        tabBarController = self.parentViewController.WTCTabBarController;
    }
    return tabBarController;
}

- (WTCTabBarItem *)tabBarItem{
    WTCTabBarViewController *tabBarController = self.WTCTabBarController;
    NSInteger index = [tabBarController indexForViewController:self];
    
    return [tabBarController.tabBar.items objectAtIndex:index];
}

- (void)WTCSetTabBarItem:(WTCTabBarItem *)UPMTabBarItem{
    WTCTabBarViewController *tabBarController = [self WTCTabBarController];
    if (!tabBarController) {
        return;
    }
    
    WTCTabBar *tabBar = (WTCTabBar *)tabBarController.tabBar;
    NSInteger index = [tabBarController indexForViewController:self];
    
    NSMutableArray *tabBarItems = [[NSMutableArray alloc] initWithArray:tabBar.items];
    [tabBarItems replaceObjectAtIndex:index withObject:tabBarItems];
    [tabBar setItems:tabBarItems];
}
@end
