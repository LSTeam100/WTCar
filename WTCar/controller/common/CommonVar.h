//
//  CommonVar.h
//  libObaby
//
//  Created by apple on 16/9/18.
//
//

#import <Foundation/Foundation.h>

@interface CommonVar : NSObject

+ (instancetype)sharedInstance;
@property(nonatomic,strong)NSString *loginToken;

-(NSString *)getLoginToken;

-(void)showMessage:(NSString *)message ShowController:(UIViewController *)showController;

@end
