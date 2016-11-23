//
//  UPMNavigatinBar.h
//  UPMeilin
//
//  Created by duanran on 15/7/15.
//  Copyright (c) 2015年 duanran. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UPMNavigationBarDelegate <NSObject>

-(void)back;

@end


@interface UPMNavigatinBar : UIView

@property(nonatomic,weak)id delegate;
@property(nonatomic,strong)IBOutlet UIButton *backBtn;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIButton *rightBtn;

-(IBAction)back;
@end
