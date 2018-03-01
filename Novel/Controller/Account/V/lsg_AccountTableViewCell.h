//
//  lsg_AccountTableViewCell.h
//  Novel
//
//  Created by user on 2018/2/26.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lsg_AccountTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *lsg_leftImage; //左边图标
@property (nonatomic, strong) UILabel     *lsg_titleLabel;//title
@property (nonatomic, strong) UIImageView *lsg_rightImage;//右边图标
@property (nonatomic, strong) UIView      *lsg_lineView;

@end
