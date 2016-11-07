//
//  ScrollImageItem.h
//  UIForMall
//
//  Created by YaNan_L on 14-8-22.
//  Copyright (c) 2014年 YaNan L. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SGTitle @"title"
#define SGImage @"image"
#define SGTag   @"tag"
#define SGURL   @"imageURL"

@interface ScrollImageItem : NSObject

@property (nonatomic, retain)  NSString     *title;
@property (nonatomic, retain)  NSString      *image;
@property (nonatomic, assign)  NSInteger     tag;
@property (nonatomic, retain)  NSString *imageURL;

- (id)initWithTitle:(NSString *)title image:(NSString *)image tag:(NSInteger)tag imageURL:(NSString *)imageURL;
- (id)initWithDict:(NSDictionary *)dict tag:(NSInteger)tag;

@end
