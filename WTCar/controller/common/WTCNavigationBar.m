//
//  WTCNavigationBar.m
//  WTCar
//
//  Created by apple on 2016/10/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCNavigationBar.h"

@implementation WTCNavigationBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, 45, 80, 30)];
        //        self.backBtn.backgroundColor=colorWithHexString(@"0ABC80", 0.9);
        //        [self.backBtn setTitle:@"登录" forState:UIControlStateNormal];
        
        UIImageView *imageView=[[UIImageView alloc]init];
        UIImage *img=[UIImage imageNamed:@"backBtn"];
        CGFloat w=img.size.width;
        CGFloat h=img.size.height;
        imageView.image=img;
        [imageView setFrame:CGRectMake(0, 5, w, h)];
        [self.backBtn addSubview:imageView];
        
        self.backBtn.titleLabel.font=[UIFont systemFontOfSize:16];
        self.backBtn.titleLabel.textColor=[UIColor whiteColor];
        [self addSubview:self.backBtn];
        [self.backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        self.titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-280)/2, 45, 280, 30) ];
        self.titleLabel.font=[UIFont systemFontOfSize:17];
        self.titleLabel.textColor=[UIColor whiteColor];
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];
        
        self.rightBtn=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-80, 42, 60, 30)];
        [self addSubview:self.rightBtn];
        
        self.rightBtn.hidden=YES;
        
        
        
    }
    return self;
}


-(IBAction)back
{
    [self.delegate back];
}


@end
