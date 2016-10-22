//
//  WTCNavigationBar.h
//  WTCar
//
//  Created by apple on 2016/10/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol WTCNavigationBarDelegate <NSObject>

-(void)back;

@end


@interface WTCNavigationBar : UIView

@property(nonatomic,weak)id delegate;
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIButton *rightBtn;

-(IBAction)back;


@end
