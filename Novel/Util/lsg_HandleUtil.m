//
//  lsg_HandleUtil.m
//  Novel
//
//  Created by user on 2018/2/24.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_HandleUtil.h"

@implementation lsg_HandleUtil

+ (void)lsg_handleRadius:(UIView *)subV{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:subV.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(6, 6)];//指定圆角位置 大小
    
    CAShapeLayer *masklayer = [[CAShapeLayer alloc] init];
    masklayer.frame = subV.bounds;
    masklayer.path = path.CGPath;
    subV.layer.mask = masklayer;
}

+ (void)lsg_handleRadius:(UIView *)subV :(CGFloat)radius{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:subV.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];//指定圆角位置 大小
    
    CAShapeLayer *masklayer = [[CAShapeLayer alloc] init];
    masklayer.frame = subV.bounds;
    masklayer.path = path.CGPath;
    subV.layer.mask = masklayer;
}

+ (CGFloat)lsg_labelWidthWithString:(NSString *)str1 :(UIFont *)font1 :(int)height {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:str1 attributes:@{NSFontAttributeName:font1, NSForegroundColorAttributeName:COMMON_C51}];
    
    CGFloat w = [attr boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size.width;
    
    return w;
}

@end
