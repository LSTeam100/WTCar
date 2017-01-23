//
//  WTCHomeViewController.m
//  WTCar
//
//  Created by apple on 2016/10/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCHomeViewController.h"
#import "MainButtonView.h"
#import "WTCCarManageController.h"
#import "WTCPublishCarViewController.h"
#import "WTCBusinessPosViewController.h"
#import "WTCShopSettingViewController.h"
#import "WTCAddCarViewController.h"
#import "LoanServiceViewController.h"
#import "HomeNavigationBarView.h"
#import "WTCNotGetPOSViewController.h"
#import "LoginViewController.h"
#import "WTCGetPOSInfoResult.h"
#import "WTCGetPOSInfoRequest.h"
#import "MBProgressHUD.h"
#import "WTCBannerRequest.h"
#import "WTCBanner.h"
#import "WTCPOSHasOpenedViewController.h"
@interface WTCHomeViewController ()
{
    CGFloat carouselHeight;
    float viewX;
    float viewY;
}
@property(strong,nonatomic) UIScrollView *mainScrollView;
@property (nonatomic,assign) NSInteger scrollCount;
@property (nonatomic,strong) NSTimer *scheduledTimer;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) NSMutableArray *allLbPicPathArry;//服务器返回的所有轮播图数组
@property (nonatomic,strong) MainButtonView *buttonView;

@end

@implementation WTCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"梧桐汽车";
    viewX = CGRectGetWidth(self.view.frame);//屏幕宽
    viewY = CGRectGetHeight(self.view.frame);//屏幕高
    
//    CGFloat offset = 44;
    float bannerWidth = [UIScreen mainScreen].bounds.size.width;
    float fen = 16.0/9.0;
    float bannerHeight = bannerWidth /fen;

    carouselHeight = bannerHeight;
//    _mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, viewX, viewY-44-offset)];
    _mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, viewX, bannerHeight)];
    _mainScrollView.showsVerticalScrollIndicator = false;//禁止垂直滚动条显示
    _mainScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_mainScrollView];
    [self dataInit];
    [self bannerPicInit];
    [self buttonViewInit];
    [self startScroll];

//    self.navigationController.view.backgroundColor= [UIColor redColor];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
//    [super viewWillAppear:animated];
//    self.naviView.hidden = NO;
    [[self WTCTabBarController] setTabBarHidden:NO animated:YES];

}
-(void)viewDidAppear:(BOOL)animated
{
}

-(void)buttonViewInit{
    //九宫格View
    _buttonView = [[NSBundle mainBundle]loadNibNamed:@"MainButtonView" owner:nil options:nil][0];
    float bannerWidth = [UIScreen mainScreen].bounds.size.width;
    float fen = 16.0/9.0;
    float bannerHeight = bannerWidth /fen;
    carouselHeight = bannerHeight;
    _buttonView.frame = CGRectMake(0, bannerHeight, _mainScrollView.frame.size.width,[UIScreen mainScreen].bounds.size.height-bannerHeight+80);
    _buttonView.backgroundColor = [UIColor whiteColor];
    
    
    _buttonView.MainScrollView.backgroundColor = [UIColor whiteColor];
    _buttonView.MainScrollView.delegate=self;
    
    [_buttonView.MainScrollView flashScrollIndicators];
    // 是否同时运动,lock
    _buttonView.MainScrollView.directionalLockEnabled = YES;
    _buttonView.MainScrollView.scrollEnabled = YES;
    _buttonView.MainScrollView.showsVerticalScrollIndicator = FALSE;
    _buttonView.MainScrollView.showsHorizontalScrollIndicator=FALSE;
    _buttonView.MainContentViewHight.constant = -250;
    [self.view addSubview:_buttonView];
    
    //button点击方法
    //发布车辆
    [_buttonView.FaBuCheButton addTarget:self action:@selector(FaBucheButtonClick) forControlEvents:UIControlEventTouchUpInside];
    //车辆管理
    [_buttonView.CheGuanLiButton addTarget:self action:@selector(CheGuanLiButtonClick) forControlEvents:UIControlEventTouchUpInside];
    //店铺设置
    [_buttonView.DianPuSZButton addTarget:self action:@selector(DianPuSZButtonClick) forControlEvents:UIControlEventTouchUpInside];
    //商家Pos
    [_buttonView.ShangJiaPosButton addTarget:self action:@selector(ShangJPosButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_buttonView.loanButton addTarget:self action:@selector(navitoLoanConTroller:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)dataInit{

//    carouselHeight = 150*SCREEN_WIDTH/435;
    _scrollCount = 0;
//    _allLbPicPathArry = [NSMutableArray new];
    _allLbPicPathArry = [NSMutableArray arrayWithCapacity:0];
    
    [self getBannerRequest];
}
-(void)getBannerRequest
{
    [self setBusyIndicatorVisible:YES];
    WTCBannerRequest *request = [[WTCBannerRequest alloc]initWithSuccessCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        WTCBanner *banners = [request getResponse].data;
        
        _allLbPicPathArry = [[NSMutableArray alloc]initWithArray:banners.bannerArr];
        [_carousel reloadData];
        
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
    }];
    [request start];
    
}
-(void)bannerPicInit{
    
    UIImage *carouselImage = [UIImage imageNamed:@"banner3"];
    carouselHeight = carouselImage.size.height * (viewX / carouselImage.size.width);
    float Width = [UIScreen mainScreen].bounds.size.width;
    float fen = 16.0/9.0;
    float Height = Width /fen;
    _carousel = [[iCarousel alloc]initWithFrame:CGRectMake(0, 0, viewX, Height)];
    _carousel.backgroundColor = [UIColor clearColor];
    _carousel.type = iCarouselTypeLinear;
    _carousel.delegate = self;
    _carousel.dataSource = self;
    
    [_mainScrollView addSubview:_carousel];
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, _carousel.frame.size.height/7*6, viewX, _carousel.frame.size.height/7)];
    _pageControl.numberOfPages = _carousel.numberOfItems;
    _pageControl.backgroundColor = [UIColor clearColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPage = 0;
    
    [_carousel addSubview:_pageControl];

}

#pragma mark - 自动滚动视图

- (void)startScroll
{
    
    _scheduledTimer = [NSTimer scheduledTimerWithTimeInterval:5
                                                       target:self
                                                     selector:@selector(scrollViewAtTime)
                                                     userInfo:nil
                                                      repeats:YES];
}

- (void)scrollViewAtTime
{
    //    NSLog(@"banner滚动");
    //    NSLog(@"%ld",(long)_scrollCount);
    _scrollCount ++;
    _pageControl.currentPage = _scrollCount;
    if (_scrollCount >  self.allLbPicPathArry.count + 1) {
        _scrollCount = 0;
        [_carousel reloadData];
    }
    if (_scrollCount >  self.allLbPicPathArry.count) {
        _pageControl.currentPage = 0;
    }
    
    [_carousel addSubview:_pageControl];
    
    [_carousel scrollToItemAtIndex:_scrollCount duration:1];
}

#pragma mark-iCarousel delegate & datasource

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    if (self.allLbPicPathArry.count == 0) {
        return 1;
    }
    else
    {
        return self.allLbPicPathArry.count;

    }
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UIImageView *imageView = nil;
//    imageView.contentMode =

    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        CGFloat height = carouselHeight;

        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, carouselHeight)];
        
        
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, height)];
        imageView.backgroundColor = [UIColor clearColor];
        imageView.tag = 5002;
        
        view.contentMode = UIViewContentModeScaleAspectFit;

        [view addSubview:imageView];
    }
    else
    {
        
        //get a reference to the label in the recycled view
        imageView = (UIImageView *)[view viewWithTag:5002];
    }
    if (_allLbPicPathArry.count > 0) {
        WTCOneBanner *oneBanner = [_allLbPicPathArry objectAtIndex:index];
        imageView.contentMode = UIViewContentModeScaleAspectFit;

        [imageView sd_setImageWithURL:[NSURL URLWithString:oneBanner.picUrl] placeholderImage:[UIImage imageNamed:@"banner3"]];
    }
    else
    {
        imageView.contentMode = UIViewContentModeScaleAspectFit;

        imageView.image = [UIImage imageNamed:@"banner3"];
    }
    
    
    
//    imageView.image = [UIImage imageNamed:@"banner3"];
//        if (index == 1){
//        imageView.image = [UIImage imageNamed:@"banner3"];
//           }else if (index == 2){
//        imageView.image = [UIImage imageNamed:@"banner3"];
//        
//        }
//    else if (index == 3){
//        imageView.image = [UIImage imageNamed:@"banner3"];
//           }
    return view;
    
}
- (void)carouselDidScroll:(iCarousel *)carousel
{
    _scrollCount = carousel.currentItemIndex;
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
    _pageControl.currentPage = carousel.currentItemIndex;
}

//banner跳转
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    
}
- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return YES;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value;
        }
        case iCarouselOptionFadeMax:
        {
            if (self.carousel.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 0.0f;
            }
            return value;
        }
        case iCarouselOptionShowBackfaces:
        case iCarouselOptionRadius:
        case iCarouselOptionAngle:
        case iCarouselOptionArc:
        case iCarouselOptionTilt:
        case iCarouselOptionCount:
        case iCarouselOptionFadeMin:
        case iCarouselOptionFadeMinAlpha:
        case iCarouselOptionFadeRange:
        case iCarouselOptionOffsetMultiplier:
        case iCarouselOptionVisibleItems:
        {
            return value;
        }
    }
}
//Button跳转
-(void)FaBucheButtonClick
{
    WTCAddCarViewController *pubCarViewController = [WTCAddCarViewController new];
    [self.navigationController pushViewController:pubCarViewController animated:YES];
}

-(void)CheGuanLiButtonClick
{
    WTCCarManageController *carManViewController = [WTCCarManageController new];
    [self.navigationController pushViewController:carManViewController animated:YES];
}

-(void)DianPuSZButtonClick
{
    WTCShopSettingViewController *ShopSettingViewController = [WTCShopSettingViewController new];
    [self.navigationController pushViewController:ShopSettingViewController animated:YES];
}

-(void)ShangJPosButtonClick
{
    NSString *getPosToken = [[CommonVar sharedInstance]getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCGetPOSInfoRequest *request = [[WTCGetPOSInfoRequest alloc]initWithToken:getPosToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
        WTCGetPOSInfoResult *getPosResult = [request getResponse].data;
        if (getPosResult == NULL || getPosResult == nil) {
            WTCNotGetPOSViewController*NotGetPosViewController = [WTCNotGetPOSViewController new];
            NotGetPosViewController.posFag = 0;
            [self.navigationController pushViewController:NotGetPosViewController animated:YES];
        }
        
        else
        {
            int applyStatus = [getPosResult.applySatus intValue];
            int openStatus = [getPosResult.openStatus intValue];
            if (applyStatus == 1) {
                WTCNotGetPOSViewController*NotGetPosViewController = [WTCNotGetPOSViewController new];
                NotGetPosViewController.posFag = 1;
                [self.navigationController pushViewController:NotGetPosViewController animated:YES];
            }
            else if (applyStatus == 2)
            {
                if (openStatus == 1) {
                    WTCNotGetPOSViewController*NotGetPosViewController = [WTCNotGetPOSViewController new];
                    NotGetPosViewController.posFag = 2;
                    [self.navigationController pushViewController:NotGetPosViewController animated:YES];
                }
                else
                {
                    WTCPOSHasOpenedViewController *controller = [[WTCPOSHasOpenedViewController alloc]init];
                    [self.navigationController pushViewController:controller animated:YES];
                }
                
            }
        }
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];

}
-(void)navitoLoanConTroller:(id)sender
{
    LoanServiceViewController *loan = [[LoanServiceViewController alloc]init];
    [self.navigationController pushViewController:loan animated:YES];
    //LoginViewController *logCon = [[LoginViewController alloc]init];
    //[self.navigationController pushViewController:logCon animated:YES];
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
