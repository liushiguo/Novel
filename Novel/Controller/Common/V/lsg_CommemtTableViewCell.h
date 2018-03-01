//
//  lsg_CommemtTableViewCell.h
//  Novel 评论cell
//
//  Created by user on 2018/2/28.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lsg_HandleUtil.h"

@interface lsg_CommemtTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *lsg_headImage;
@property (nonatomic, strong) UILabel     *lsg_nameLabel;
@property (nonatomic, strong) UILabel     *lsg_timeLabel;
@property (nonatomic, strong) UIButton    *lsg_zanBtn;
@property (nonatomic, strong) UILabel     *lsg_zanNum;   //赞数量
@property (nonatomic, strong) UIImageView *lsg_moreImage;
@property (nonatomic, strong) UILabel     *lsg_commentWZ;//评论文字
@property (nonatomic, strong) UIView      *lsg_lineView;

@end
