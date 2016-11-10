//
//  WTCCarShareViewController.m
//  WTCar
//
//  Created by apple on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCarShareViewController.h"
#import "WTCCarShanreTableViewCell.h"
#import "SharedItem.h"
#import "UMSocialUIManager.h"
@interface WTCCarShareViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)IBOutlet UITableView *tableView;
@end

@implementation WTCCarShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"车辆分享";
    // Do any additional setup after loading the view from its nib.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"WTCCarShanreTableViewCell";
    
    WTCCarShanreTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        NSArray *cellArr = [[NSBundle mainBundle]loadNibNamed:@"WTCCarShanreTableViewCell" owner:self options:nil];
        cell = [cellArr objectAtIndex:0];
        
        [cell.multipleShareBtn addTarget:self action:@selector(shareWX) forControlEvents:UIControlEventTouchUpInside];
        [cell.wechatBtn addTarget:self action:@selector(UMShareWechat) forControlEvents:UIControlEventTouchUpInside];
        [cell.firendsBtn addTarget:self action:@selector(UMShareWechatFirends) forControlEvents:UIControlEventTouchUpInside];
    }
    WTCASale *asale = self.ascale;
    NSString *imageUrl = [asale.primaryPicUrl objectAtIndex:0];
    [cell.shanreImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"defaultImage"]];
    cell.titleLabel.text = asale.productName;
    cell.dateLabel.text = [NSString stringWithFormat:@"%@",asale.firstUpTime];
    cell.priceLabel.text = asale.price;
    
    

    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
-(void)UMShareWechat
{
    [self share:nil];
}
-(void)UMShareWechatFirends
{
    [self share:nil];
}
- (IBAction)share:(id)sender {
    //显示分享面板
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMShareMenuSelectionView *shareSelectionView, UMSocialPlatformType platformType) {
        NSLog(@"platformType=%ld",(long)platformType);
        }];//如果需要获得用户信息直接跳转的话，需要先取消授权
    
}
-(void)shareWX{
    /** 图片数组*/
    //    NSArray *wechatArr = @[[[WeixinSessionActivity alloc] init], [[WeixinTimelineActivity alloc] init]];
    
    
    //    NSLog(@"wechatArr=%@",wechatArr);
    
    
    
//    NSArray *array_photo = @[@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt2fbZm38Zct4DH92p-ez7-fXt.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneiocd24Y6jK8uQA8-8y-47H6vRe7.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneiocdd94h6ld4kQJh8PcpjGSkORS.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneiocdd94h6ld4kQJh8PcpjGSkORS.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneioccpacV1LVg2AfG9fbYl8zN1So.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt0haf1zwepSkxx9okI0W34t05.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85"];
    
    
    NSArray *array_photo = [NSArray arrayWithArray:self.ascale.primaryPicUrl];
    
    
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
        [self presentViewController:activityViewController animated:TRUE completion:nil];
    }
    //    [self presentViewController:activityViewController animated:TRUE completion:nil];
    
    
    
    
    //    UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:array applicationActivities:wechatArr];
    //    activityView.excludedActivityTypes = @[UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypePrint];
    //    [self presentViewController:activityView animated:YES completion:nil];
    
    
    
    
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
