//
//  ScrollImageItem.m
//  UIForMall
//
//  Created by YaNan_L on 14-8-22.
//  Copyright (c) 2014年 YaNan L. All rights reserved.
//

#import "ScrollImageItem.h"

@implementation ScrollImageItem

@synthesize title = _title;
@synthesize image = _image;
@synthesize tag = _tag;
@synthesize imageURL = _imageURL;

- (void)dealloc
{
    self.title = nil;
    self.image = nil;
    self.imageURL = nil;
}
- (id)initWithTitle:(NSString *)title image:(NSString *)image tag:(NSInteger)tag imageURL:(NSString *)imageURL
{
    self = [super init];
    if (self) {
        self.title = title;
        self.image = image;
        self.tag = tag;
        self.imageURL = imageURL;
    }
    
    return self;
}

- (id)initWithDict:(NSDictionary *)dict tag:(NSInteger)tag
{
    self = [super init];
    if (self)
    {
        if ([dict isKindOfClass:[NSDictionary class]])
        {
            self.title = [dict valueForKey:SGTitle];
            self.image = [dict valueForKey:SGImage];
            self.tag = [[dict valueForKey:SGTag] intValue];
            self.imageURL = [dict valueForKey:SGURL];
            //...
        }
    }
    return self;
}

@end
