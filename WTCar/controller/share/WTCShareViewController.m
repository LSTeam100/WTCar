//
//  WTCShareViewController.m
//  WTCar
//
//  Created by apple on 2016/10/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCShareViewController.h"
#import "WTCShareTableViewCell.h"
#import "SharedItem.h"
#import "WTCOnSaleListRequest.h"
#import "WTCOnSaleList.h"
#import "CommonVar.h"
#import "NSObject+MJKeyValue.h"
@interface WTCShareViewController ()<UITableViewDelegate,UITableViewDataSource>{
//    NSCondition *_condition;
    NSTimer *timer;
    BOOL actionFlag;
    int cycleCount;
    BOOL isShowing;
    NSMutableArray *tempArr;
    NSMutableArray *selectArr;
    NSInteger shareNum;
    NSMutableArray *onsaleArr;
    NSMutableArray *selectShareArr;
}
@property(nonatomic,weak)IBOutlet UITableView *tableView;
//@property(nonatomic,weak)IBOutlet UIButton *allSelectBtn;
@property(nonatomic,weak)IBOutlet UILabel *allCarNum;
@property(nonatomic,weak)IBOutlet UIButton *shareBtn;
@end

@implementation WTCShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"分享";
    //初始化锁对象
//    _condition=[[NSCondition alloc]init];
    actionFlag = false;
    cycleCount = 0;
    timer =  [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(isHaveActivity) userInfo:nil repeats:YES];
    isShowing = false;
    
    NSDictionary *dic1= @{@"name":@"法拉利",
                          @"date":@"2015年10月|120万公里",
                          @"price":@"120万",
                          @"check":@"NO"};
    
    tempArr = [[NSMutableArray alloc]initWithArray:@[dic1,dic1,dic1]];
    
//    shareNum = [self getShareNum:tempArr];
    
    self.allCarNum.text = [NSString stringWithFormat:@"合计车辆%ld台",(long)shareNum];
    selectArr = [[NSMutableArray alloc]init];
    
    [self.selectAllBtn setBackgroundImage:[UIImage imageNamed:@"share_unselect"] forState:UIControlStateNormal];
    [self.selectAllBtn setBackgroundImage:[UIImage imageNamed:@"share_select"] forState:UIControlStateSelected];

    
//    [self.selectAllBtn setImage:[UIImage imageNamed:@"share_unselect"] forState:UIControlStateNormal];
//    [self.selectAllBtn setImage:[UIImage imageNamed:@"share_select"] forState:UIControlStateSelected];
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)getOnSaleList
{
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCOnSaleListRequest *request = [[WTCOnSaleListRequest alloc]initWithToken:loginToken CurPage:[NSNumber numberWithInt:0] PageSize:[NSNumber numberWithLong:DEFAULTPAGESIZE] successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        WTCOnSaleList *saleList = [request getResponse].data;
        
        onsaleArr = [[NSMutableArray alloc]init];
        for (int i = 0; i < saleList.rows.count; i++) {
//            onsaleArr = [[NSMutableArray alloc]initWithArray:saleList.rows];
            
            WTCASale *asale = [saleList.rows objectAtIndex:i];
            NSMutableDictionary *oneDic = [[NSMutableDictionary alloc]init];
//            NSString *modelJson = asale.JSONString;
            [oneDic setValue:asale forKey:@"class"];
            [oneDic setValue:@"NO" forKey:@"check"];
            [onsaleArr addObject:oneDic];
        }
        [self.tableView reloadData];
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
    }];
    [request start];
    
}
-(void)viewWillAppear:(BOOL)animated
{
//    [super viewWillAppear:animated];
    [[self WTCTabBarController] setTabBarHidden:NO animated:YES];
    [self getOnSaleList];

}
-(IBAction)selectALLItem:(id)sender
{
    for (int i = 0; i < onsaleArr.count; i++) {
        NSMutableDictionary *oneDic = [[NSMutableDictionary alloc]initWithDictionary:[onsaleArr objectAtIndex:i]];
        [oneDic setValue:@"YES" forKey:@"check"];
        [onsaleArr replaceObjectAtIndex:i withObject:oneDic];
    }
    [self.tableView reloadData];
    shareNum = [self getShareNum:onsaleArr];
    self.allCarNum.text = [NSString stringWithFormat:@"合计车辆%ld台",(long)shareNum];
}

-(void)dealloc
{
    [timer invalidate];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"WTCShareTableViewCell";
    WTCShareTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        NSArray *cellArr = [[NSBundle mainBundle]loadNibNamed:@"WTCShareTableViewCell" owner:self options:nil];
        cell = [cellArr objectAtIndex:0];
    }
    NSDictionary *oneDic;
    if (onsaleArr.count > 0) {
        oneDic = [onsaleArr objectAtIndex:indexPath.row];

    }
    else
    {
        oneDic = [tempArr objectAtIndex:indexPath.row];

    }
//    NSDictionary *oneDic = [tempArr objectAtIndex:indexPath.row];
//    NSString *modelJson = [oneDic objectForKey:@"class"];
    WTCASale *ascle = [oneDic objectForKey:@"class"];
    cell.titleLabel.text = ascle.productName;
    cell.dateLabel.text = ascle.firstUpTime;
    cell.priceLabel.text = ascle.price;
    if (ascle.primaryPicUrl.count > 0) {
        [cell.titleImageView sd_setImageWithURL:[NSURL URLWithString:[ascle.primaryPicUrl objectAtIndex:0]] placeholderImage:[UIImage imageNamed:@"defaultImage"]];
    }
    
    
    NSString *check = [oneDic objectForKey:@"check"];
    if ([check isEqualToString:@"YES"]) {
        cell.selectImageView.image = [UIImage imageNamed:@"share_select"];
    }
    else
    {
        cell.selectImageView.image = [UIImage imageNamed:@"share_unselect"];
    }
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WTCShareTableViewCell *cell = (WTCShareTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    NSMutableDictionary *oneDic = [[NSMutableDictionary alloc]initWithDictionary: [onsaleArr objectAtIndex:indexPath.row]];
    
    NSString *check = [oneDic objectForKey:@"check"];
    if ([check isEqualToString:@"YES"]) {
        [oneDic setValue:@"NO" forKey:@"check"];
        [cell setChecked:NO];
    }
    else
    {
        [oneDic setValue:@"YES" forKey:@"check"];
        [cell setChecked:YES];
    }
    [onsaleArr replaceObjectAtIndex:indexPath.row withObject:oneDic];
    
    shareNum = [self getShareNum:onsaleArr];
    self.allCarNum.text = [NSString stringWithFormat:@"合计车辆%ld台",(long)shareNum];


}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (onsaleArr.count > 0) {
        return onsaleArr.count;
    }
    else
    {
        return tempArr.count;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(IBAction)share:(NSArray *)sender
{
    selectShareArr = [[NSMutableArray alloc]init];
    NSMutableArray *selectTempArr = [[NSMutableArray alloc]init];
    for (int i = 0; i < onsaleArr.count; i++) {
        NSDictionary *oneDic = [onsaleArr objectAtIndex:i];
        
        NSString *key = [oneDic objectForKey:@"check"];
        if ([key isEqualToString:@"YES"]) {
            [selectTempArr addObject:oneDic];
        }
    }
    int cycle = floor(selectTempArr.count/8.0);
    if (cycle == 0) {
        cycle = 1;
    }
    actionFlag = true;
    cycleCount = cycle;
    
    for (int j = 0; j < cycle; j++) {
        NSMutableArray *onePartArr = [[NSMutableArray alloc]init];
        if (selectTempArr.count > 7) {
            for (int k = 0; k < 8; k++) {
                NSDictionary *oneDic = [selectTempArr objectAtIndex:k];
                [onePartArr addObject:oneDic];
            }
            [selectShareArr addObject:onePartArr];
        }
        else
        {
            for (int k = 0; k < selectTempArr.count; k ++) {
                NSDictionary *oneDic = [selectTempArr objectAtIndex:k];
                [onePartArr addObject:oneDic];
            }
            [selectShareArr addObject:onePartArr];

        }
    }
    
    
    if (selectShareArr.count > 0) {
        NSMutableArray *onePartArr = [selectShareArr objectAtIndex:0];
        [self loadImage:onePartArr];
    }
    
//    for (int i = 0; i < cycleCount; i++) {
//        [self loadImage:onsaleArr];
//    }
}

-(NSInteger)getShareNum:(NSArray *)arr
{
    NSInteger num = 0;
    for (int i = 0; i < arr.count; i++) {
        NSDictionary *oneDic = [arr objectAtIndex:i];
        NSString *checkStatus = [oneDic objectForKey:@"check"];
        if ([checkStatus isEqualToString:@"YES"]) {
            num ++;
        }
    }
    return num;
}
-(void)shareWX:(NSMutableArray *)shareArr{
    cycleCount--;
    isShowing = YES;
    NSMutableArray *array_photo = [[NSMutableArray alloc]init];
    for (int i = 0; i < shareArr.count; i ++) {
        NSDictionary *oneDic = [shareArr objectAtIndex:i];
        WTCASale *asacle = [oneDic objectForKey:@"class"];
        [array_photo addObject:[asacle.primaryPicUrl objectAtIndex:0]];
    }
    /** 图片数组*/
    //    NSArray *wechatArr = @[[[WeixinSessionActivity alloc] init], [[WeixinTimelineActivity alloc] init]];
    
    
    //    NSLog(@"wechatArr=%@",wechatArr);
    [self setBusyIndicatorVisible:YES];
//    NSArray *array_photo = [NSArray arrayWithArray:selectShareArr];
//    NSArray *array_photo = @[@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt2fbZm38Zct4DH92p-ez7-fXt.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneiocd24Y6jK8uQA8-8y-47H6vRe7.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneiocdd94h6ld4kQJh8PcpjGSkORS.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneiocdd94h6ld4kQJh8PcpjGSkORS.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneioccpacV1LVg2AfG9fbYl8zN1So.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt0haf1zwepSkxx9okI0W34t05.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85"];
    NSLog(@"array_photo=%@",array_photo);
    
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i = 0; i <array_photo.count; i++) {
        NSString *URL = array_photo[i];
        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:URL]];
        UIImage *imagerang = [UIImage imageWithData:data];
        
        NSString *path_sandox = NSHomeDirectory();
        NSString *imagePath = [path_sandox stringByAppendingString:[NSString stringWithFormat:@"/Documents/ShareWX%d.jpg",i]];
        [UIImagePNGRepresentation(imagerang) writeToFile:imagePath atomically:YES];
        
        NSURL *shareobj = [NSURL fileURLWithPath:imagePath];
        
        /** 这里做个解释 imagerang : UIimage 对象  shareobj:NSURL 对象 这个方法的实际作用就是 在吊起微信的分享的时候 传递给他 UIimage对象,在分享的时候 实际传递的是 NSURL对象 达到我们分享九宫格的目的 */
        
        SharedItem *item = [[SharedItem alloc] initWithData:imagerang andFile:shareobj];
        
        [array addObject:item];
        
    }
    
    NSLog(@"array=%@",array);
    
    //    UIActivityViewController *activityViewController =[[UIActivityViewController alloc] initWithActivityItems:array
    //                                                                                        applicationActivities:wechatArr];
    
    //    activityViewController.excludedActivityTypes = @[UIActivityTypePostToFacebook,UIActivityTypeAirDrop];
    
    UIActivityViewController *activityViewController =[[UIActivityViewController alloc] initWithActivityItems:array
                                                                                        applicationActivities:nil];
    activityViewController.excludedActivityTypes = @[UIActivityTypePostToFacebook,UIActivityTypeAirDrop];
    
    if (activityViewController) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:activityViewController animated:TRUE completion:^
            {
                isShowing = false;
                [self setBusyIndicatorVisible:NO];
                NSLog(@"展示分享页面");
            }];
            
        });
    }
    
}
-(BOOL)isHaveActivity
{
    BOOL ret = false;
    if (self.presentedViewController == nil) {
        if (actionFlag == true && cycleCount > 0 ) {
            if (cycleCount <= selectShareArr.count) {
                NSMutableArray *onePartArr = [selectShareArr objectAtIndex:cycleCount];
                [self loadImage:onePartArr];

            }
        }
        ret = false;
    }
    else
    {
        ret = true;
    }
    return ret;
}
-(BOOL)jugeActivity
{
    BOOL ret = false;
    if (self.presentedViewController == nil) {
        ret = false;
    }
    else
    {
        ret = true;
    }
    return ret;
}
#pragma mark-监听
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 加载图片
-(void)loadImage:(NSMutableArray *)shareArr{
    //加锁
//    [_condition lock];
    //如果当前有图片资源则加载，否则等待
    BOOL ret = [self jugeActivity];
    if (ret == false && cycleCount > 0) {
        NSLog(@"可以分享微信");
        if (isShowing == false) {
            [self shareWX:shareArr];
        }
    }
    else
    {
        NSLog(@"不能分享微信");
    }
    
    //解锁
//    [_condition unlock];
}
//-(void)createImageName{
//    [_condition lock];
//    //如果当前已经有图片了则不再创建，线程处于等待状态
//    if (_imageNames.count>0) {
//        NSLog(@"createImageName wait, current:%i",_currentIndex);
//        [_condition wait];
//    }else{
//        NSLog(@"createImageName work, current:%i",_currentIndex);
//        //生产者，每次生产1张图片
//        [_imageNames addObject:[NSString stringWithFormat:@"http://images.cnblogs.com/cnblogs_com/kenshincui/613474/o_%i.jpg",_currentIndex++]];
//        
//        //创建完图片则发出信号唤醒其他等待线程
//        [_condition signal];
//    }
//    [_condition unlock];
//}
//#pragma mark 多线程下载图片
//-(void)loadAnUpdateImageWithIndex:(int )index{
//    //请求数据
//    NSData *data= [self requestData:index];
//    //更新UI界面,此处调用了GCD主线程队列的方法
//    dispatch_queue_t mainQueue= dispatch_get_main_queue();
//    dispatch_sync(mainQueue, ^{
//        UIImage *image=[UIImage imageWithData:data];
//        UIImageView *imageView= _imageViews[index];
//        imageView.image=image;
//    });
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
