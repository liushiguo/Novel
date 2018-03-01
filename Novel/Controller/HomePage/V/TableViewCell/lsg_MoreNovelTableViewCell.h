//
//  lsg_MoreNovelTableViewCell.h
//  Novel
//
//  Created by user on 2018/2/26.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lsg_HandleUtil.h"

@interface lsg_MoreNovelTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *lsg_mcImage;      //名次图标
@property (nonatomic, strong) UIImageView *lsg_bookImage;    //书封面图
@property (nonatomic, strong) UILabel     *lsg_bookNameLabel;//书名
@property (nonatomic, strong) UILabel     *lsg_authorLabel;  //作者名
@property (nonatomic, strong) UILabel     *lsg_infoLabel;    //简介
@property (nonatomic, strong) UIView      *lsg_lineView;

@end
