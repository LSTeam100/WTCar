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
//地图
@property (weak, nonatomic) IBOutlet UIButton *ZhanWeiMapButton;

//展商按钮
@property (weak, nonatomic) IBOutlet UIButton *ZhanShangButton;
//展品按钮
@property (weak, nonatomic) IBOutlet UIButton *ZhanPinButton;

@property (weak, nonatomic) IBOutlet UIButton *CustomerInviteButtonAction;
@property (weak, nonatomic) IBOutlet UIButton *HowArriveButtonAction;
@property (weak, nonatomic) IBOutlet UIButton *HotelsInforButtonAction;
@property (weak, nonatomic) IBOutlet UIButton *SearchButtonAction;
@property (weak, nonatomic) IBOutlet UIButton *MoreInforButtonAction;
@property (weak, nonatomic) IBOutlet UIButton *ContactUsButtonAction;
@property (weak, nonatomic) IBOutlet UIButton *LanguageButton;
@property (weak, nonatomic) IBOutlet UILabel *ZhanShangLabel;
@property (weak, nonatomic) IBOutlet UILabel *ZhanPinLabel;
@property (weak, nonatomic) IBOutlet UILabel *ZhanWeiMapLabel;
@property (weak, nonatomic) IBOutlet UILabel *HowArriveLabel;
@property (weak, nonatomic) IBOutlet UILabel *CustomerInviteLabel;
@property (weak, nonatomic) IBOutlet UILabel *HotelsInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *ContactUsLabel;
@property (weak, nonatomic) IBOutlet UILabel *MoreInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *SearchBarLabel;

@end
