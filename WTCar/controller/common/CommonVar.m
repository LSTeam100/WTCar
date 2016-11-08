//
//  CommonVar.m
//  libObaby
//
//  Created by apple on 16/9/18.
//
//

#import "CommonVar.h"

@implementation CommonVar
+ (instancetype)sharedInstance {
    static CommonVar *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.loginToken = @"";
    
    });
    return sharedInstance;
}
-(NSString *)getLoginToken
{
    self.loginToken = [[NSUserDefaults standardUserDefaults]objectForKey:@"token"];
    return self.loginToken;
}

@end
