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
@property (weak, nonatomic) IBOutlet UIButton *FaBuCheButton;
@property (weak, nonatomic) IBOutlet UIButton *CheGuanLiButton;
@property (weak, nonatomic) IBOutlet UIButton *DianPuSZButton;
@property (weak, nonatomic) IBOutlet UIButton *ShangJiaPosButton;


@end
