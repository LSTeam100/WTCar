//
//  define.h
//  UPMeilin
//
//  Created by duanran on 15/7/14.
//  Copyright (c) 2015年 duanran. All rights reserved.
//

#ifndef UPMeilin_define_h
#define UPMeilin_define_h


#pragma mark -获取颜色

#define WXPayNotification     @"WXPayNotification"
//static NSString * const UPMShopOrderNotification=@"com.upmeilin.hohoda.upmshopordernotification";
//static NSString * const UPMMyOrderNotification=@"com.upmeilin.hohoda.upmmyordernotification";
//
//static NSString * const UPMRefreshNewOrderCountNotification=@"com.upmeilin.hohoda.refreshnewordercountnotification";
//static NSString * const UPMRefreshShopOrderNotification=@"com.upmeilin.hohoda.refreshshopOrdernotification";
//static NSString * const UPMRefreshMyOrderNotification=@"com.upmeilin.hohoda.refreshmyordernotification";



NS_INLINE id colorWithHexString(NSString *color,float costomAlpha)
{
    //ff9c00
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:costomAlpha];
}
/*
 获取tableView中的cell
 */

NS_INLINE id EIGetViewBySubView(UIView *t,Class c)
{
    UIView *view = t;
    do
    {
        if(nil == view || [view isKindOfClass:[UIWindow class]])
        {
            return nil;
        }
        view = [view superview];
    } while (![view isKindOfClass:c]);
    return view;
}
/*
 获取用户sessionId
 */
NS_INLINE id getSessionId()
{
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    NSString *sessionId=[userDefault objectForKey:@"sessionId"];
    return sessionId;
    
}

NS_INLINE NSString * getUserName(){
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    NSString *userName=[userDefault objectForKey:@"loginName"];
    return userName;
}

/*
 隐藏多余分割线
 */

NS_INLINE void setExtraCellLineHidden(UITableView * tableview)
{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableview setTableFooterView:view];
    [tableview setTableHeaderView:view];
}

NS_INLINE BOOL isiOS7(){
    float version=[[[UIDevice currentDevice]systemVersion]floatValue];
    return version>=7.0 && version<8.0;
}

#endif
