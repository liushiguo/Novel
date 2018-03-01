//
//  lsg_SettingTableViewCell.h
//  Novel
//
//  Created by user on 2018/2/27.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lsg_SettingTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel     *lsg_leftLabel; //title
@property (nonatomic, strong) UILabel     *lsg_rightLabel;
@property (nonatomic, strong) UIImageView *lsg_rightImage;//>图标
@property (nonatomic, strong) UISwitch    *lsg_switchBtn;
@property (nonatomic, strong) UIView      *lsg_lineView;

@end
