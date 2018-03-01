//
//  lsg_HandleUtil.h
//  Novel
//
//  Created by user on 2018/2/24.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lsg_HandleUtil : NSObject

+ (void)lsg_handleRadius:(UIView *)subV;
+ (void)lsg_handleRadius:(UIView *)subV :(CGFloat)radius;
+ (CGFloat)lsg_labelWidthWithString:(NSString *)str1 :(UIFont *)font1 :(int)height;

@end
