//
//  lsg_SysInfoTableViewCell.h
//  Novel 系统消息
//
//  Created by user on 2018/2/27.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol lsg_SysInfoCellDelegate <NSObject>

@optional
- (void)lsg_xzBtnClicked:(NSIndexPath *)indexPath;
@end
@interface lsg_SysInfoTableViewCell : UITableViewCell
@property (nonatomic, assign) id<lsg_SysInfoCellDelegate> delegate;
@property (nonatomic, strong) NSIndexPath *cellIndexPath;

@property (nonatomic, strong) UIButton    *lsg_xzBtn;     //选中按钮
@property (nonatomic, strong) UILabel     *lsg_titleLabel;//title
@property (nonatomic, strong) UILabel     *lsg_timeLabel;
@property (nonatomic, strong) UIImageView *lsg_sysImage;  //>通知图标
@property (nonatomic, strong) UIImageView *lsg_idImage;   //>未读图标
@property (nonatomic, strong) UIView      *lsg_lineView;
@end
