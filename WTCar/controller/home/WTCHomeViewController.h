//
//  WTCHomeViewController.h
//  WTCar
//
//  Created by apple on 2016/10/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
// 屏幕宽度
#define SCREEN_WIDTH    [[UIScreen mainScreen] applicationFrame].size.width

// 屏幕高度
#define SCREEN_HEIGHT   [[UIScreen mainScreen] applicationFrame].size.height
@interface WTCHomeViewController : UIViewController<iCarouselDataSource,iCarouselDelegate,UIScrollViewDelegate>
@property(strong,nonatomic)IBOutlet iCarousel *carousel;
@end
