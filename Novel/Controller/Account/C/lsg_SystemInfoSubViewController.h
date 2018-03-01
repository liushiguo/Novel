//
//  lsg_SystemInfoSubViewController.h
//  Novel
//
//  Created by user on 2018/2/27.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lsg_BaseTableView.h"
#import "lsg_SysInfoTableViewCell.h"

@interface lsg_SystemInfoSubViewController : UIViewController<lsg_BaseTableViewDelegate, lsg_SysInfoCellDelegate>
@property (nonatomic, strong) NSString *ifReadOrDel;//系统消息(标记已读或删除)
@end
