//
//  MainButtonView.h
//  CMEF
//
//  Created by MacBookPro on 16/5/19.
//  Copyright © 2016年 YaNan L. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainButtonView : UIView
@property (weak, nonatomic) IBOutlet UIScrollView *MainScrollView;
@property (weak, nonatomic) IBOutlet UIView *MainContentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *MainContentViewHight;
//发布车辆
@property (weak, nonatomic) IBOutlet UIButton *FaBuCheButton;
//车辆管理
@property (weak, nonatomic) IBOutlet UIButton *CheGuanLiButton;
//店铺设置
@property (weak, nonatomic) IBOutlet UIButton *DianPuSZButton;
//商家POS
@property (weak, nonatomic) IBOutlet UIButton *ShangJiaPosButton;
@property(weak,nonatomic)IBOutlet UIButton *loanButton;


@end
