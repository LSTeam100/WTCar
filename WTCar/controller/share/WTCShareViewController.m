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
@interface WTCShareViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSCondition *_condition;
    NSTimer *timer;
    BOOL actionFlag;
    int cycleCount;
    BOOL isShowing;
    NSMutableArray *tempArr;
    NSMutableArray *selectArr;
    NSInteger shareNum;
}
@property(nonatomic,weak)IBOutlet UITableView *tableView;
//@property(nonatomic,weak)IBOutlet UIButton *allSelectBtn;
@property(nonatomic,weak)IBOutlet UILabel *allCarNum;
@property(nonatomic,weak)IBOutlet UIButton *shareBtn;
@end

@implementation WTCShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"分享";
    //初始化锁对象
    _condition=[[NSCondition alloc]init];
    actionFlag = false;
    cycleCount = 0;
    timer =  [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(isHaveActivity) userInfo:nil repeats:YES];
    isShowing = false;
    
    NSDictionary *dic1= @{@"name":@"法拉利",
                          @"date":@"2015年10月|120万公里",
                          @"price":@"120万",
                          @"check":@"NO"};
    
    tempArr = [[NSMutableArray alloc]initWithArray:@[dic1,dic1,dic1]];
    
    shareNum = [self getShareNum:tempArr];
    
    self.allCarNum = [NSString stringWithFormat:@"合计车辆%ld台",(long)shareNum];
    selectArr = [[NSMutableArray alloc]init];
    
    [self.selectAllBtn setBackgroundImage:[UIImage imageNamed:@"share_unselect"] forState:UIControlStateNormal];
    [self.selectAllBtn setBackgroundImage:[UIImage imageNamed:@"share_select"] forState:UIControlStateSelected];

    
//    [self.selectAllBtn setImage:[UIImage imageNamed:@"share_unselect"] forState:UIControlStateNormal];
//    [self.selectAllBtn setImage:[UIImage imageNamed:@"share_select"] forState:UIControlStateHighlighted];
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
//    [super viewWillAppear:animated];
    [[self WTCTabBarController] setTabBarHidden:NO animated:YES];
    
}
-(IBAction)selectALLItem:(id)sender
{
    for (int i = 0; i < tempArr.count; i++) {
        NSMutableDictionary *oneDic = [[NSMutableDictionary alloc]initWithDictionary:[tempArr objectAtIndex:i]];
        [oneDic setValue:@"YES" forKey:@"check"];
        [tempArr replaceObjectAtIndex:i withObject:oneDic];
    }
    [self.tableView reloadData];
    shareNum = [self getShareNum:tempArr];
    self.allCarNum = [NSString stringWithFormat:@"合计车辆%ld台",(long)shareNum];
    NSLog(@"allCarNum=%@",self.allCarNum);
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
    NSDictionary *oneDic = [tempArr objectAtIndex:indexPath.row];
    cell.titleLabel.text = [oneDic objectForKey:@"name"];
    cell.dateLabel.text = [oneDic objectForKey:@"date"];
    cell.priceLabel.text = [oneDic objectForKey:@"price"];
    
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
    NSMutableDictionary *oneDic = [[NSMutableDictionary alloc]initWithDictionary: [tempArr objectAtIndex:indexPath.row]];
    
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
    [tempArr replaceObjectAtIndex:indexPath.row withObject:oneDic];
    
    shareNum = [self getShareNum:tempArr];
    self.allCarNum = [NSString stringWithFormat:@"合计车辆%ld台",(long)shareNum];


}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tempArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(IBAction)share:(id)sender
{
    actionFlag = true;
    cycleCount = 1;
    for (int i = 0; i < cycleCount; i++) {
        [self loadImage:[NSNumber numberWithInt:i]];
    }
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
-(void)shareWX{
    cycleCount--;
    isShowing = YES;
    NSLog(@"cycleCount=%d",cycleCount);
    /** 图片数组*/
    //    NSArray *wechatArr = @[[[WeixinSessionActivity alloc] init], [[WeixinTimelineActivity alloc] init]];
    
    
    //    NSLog(@"wechatArr=%@",wechatArr);
    [self setBusyIndicatorVisible:YES];
    NSArray *array_photo = @[@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt2fbZm38Zct4DH92p-ez7-fXt.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneiocd24Y6jK8uQA8-8y-47H6vRe7.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneiocdd94h6ld4kQJh8PcpjGSkORS.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneiocdd94h6ld4kQJh8PcpjGSkORS.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneioccpacV1LVg2AfG9fbYl8zN1So.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt0haf1zwepSkxx9okI0W34t05.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85"];
    
    
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i = 0; i <8; i++) {
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
//    [_condition unlock];

    
    
    
    
    //    UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:array applicationActivities:wechatArr];
    //    activityView.excludedActivityTypes = @[UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypePrint];
    //    [self presentViewController:activityView animated:YES completion:nil];
    
   
}
-(BOOL)isHaveActivity
{
    BOOL ret = false;
    if (self.presentedViewController == nil) {
        if (actionFlag == true && cycleCount > 0 ) {
            [self loadImage:[NSNumber numberWithInt:1]];
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
-(void)loadImage:(NSNumber *)index{
    //加锁
//    [_condition lock];
    //如果当前有图片资源则加载，否则等待
    BOOL ret = [self jugeActivity];
    if (ret == false && cycleCount > 0) {
        NSLog(@"可以分享微信");
        if (isShowing == false) {
            [self shareWX];
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
