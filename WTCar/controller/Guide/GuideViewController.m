//
//  GuideViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GuideViewController.h"

@interface GuideViewController ()
<iCarouselDataSource,iCarouselDelegate>
@property (nonatomic,strong) iCarousel *carousel;
@property (nonatomic,assign) CGFloat carouselHeight;
@property (nonatomic,strong) UIPageControl *pageControl;
//@property(nonatomic,strong)NSArray *guideArr;
@end

@implementation GuideViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _carouselHeight = 0;
        _fromMore = NO;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"引导";
    self.view.backgroundColor = [UIColor colorWithRed:210/255.0f green:250/255.0f blue:218/255.0f alpha:1];
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
//    NSString *leadPage=[userDefault objectForKey:@"leadPage"];
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
    [userDefault setValue:version forKey:@"leadPage"];
    
    CGFloat offset = 0;
    if (IOS7_OR_LATER) {
        offset = 64;
    }
    
    _carousel = [[iCarousel alloc]initWithFrame:CGRectMake(0, offset, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - offset)];
    _carousel.backgroundColor = [UIColor clearColor];
    _carousel.type = iCarouselTypeLinear;
    _carousel.pagingEnabled = YES;
    _carousel.delegate = self;
    _carousel.dataSource = self;
    _carousel.backgroundColor = [UIColor clearColor];
    
    offset = 60;
    if (IOS7_OR_LATER) {
        offset = 20;
    }
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame) - 40) / 2, CGRectGetMaxY(_carousel.frame) - offset, 40, 10)];
    _pageControl.layer.cornerRadius = 5;
    _pageControl.layer.masksToBounds = YES;
    _pageControl.numberOfPages = 2;
    _pageControl.backgroundColor = [UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPage = 0;
    
    [self.view addSubview:_carousel];
    
    [self.view addSubview:_pageControl];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - iCarouselDataSource

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 3;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UIImageView *imageView = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        CGFloat offset = 0;
        if (IOS7_OR_LATER) {
            offset = 64;
        }
        
        CGFloat height = CGRectGetHeight(self.view.frame) - offset;
        CGFloat width = CGRectGetWidth(self.view.frame);
        UIImage *image = [UIImage imageNamed:@"img_shop_default@2x"];
        width = (height / image.size.height) * image.size.width;
        
        offset = -22;
        if (IOS7_OR_LATER) {
            offset = 0;
        }
        
        view = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame) - width) / 2, offset, CGRectGetWidth(self.view.frame), height)];
        //        view.contentMode = UIViewContentModeCenter;
        
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame) - width) / 2, offset, width, height)];
        imageView.backgroundColor = [UIColor clearColor];
        imageView.tag = 5002;
        
        [view addSubview:imageView];
    }
    else
    {
        //get a reference to the label in the recycled view
        imageView = (UIImageView *)[view viewWithTag:5002];
    }
    
    NSString *imageName = [NSString stringWithFormat:@"guide@%ldx",index + 1];
    imageView.image = [UIImage imageNamed:imageName];
    
    return view;
    
}
- (void)carouselDidScroll:(iCarousel *)carousel
{
   
}
- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
    if (carousel.currentItemIndex == 1) {
        if (!_fromMore) {
            
        }
    }
    else {
        
    }
    _pageControl.currentPage = carousel.currentItemIndex;
}
- (void)guideBack:(id)sender
{
    if (!_fromMore) {
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setValue:@"1" forKey:@"ShowGuide"];
        [userDefault synchronize];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
//banner跳转
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    if (index == 1) {
        [self guideBack:nil];
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    
}

- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return NO;
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
        {
            return 1;
        }
        case iCarouselOptionVisibleItems:
        {
            return value;
        }
    }
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
