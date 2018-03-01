//
//  lsg_InfoEditTableViewCell.h
//  Novel
//
//  Created by user on 2018/2/27.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lsg_InfoEditTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *lsg_headImage; //头像
@property (nonatomic, strong) UILabel     *lsg_leftLabel; //title
@property (nonatomic, strong) UILabel     *lsg_rightLabel;//名称/性别
@property (nonatomic, strong) UIImageView *lsg_rightImage;//>图标
@property (nonatomic, strong) UIView      *lsg_lineView;

@end
