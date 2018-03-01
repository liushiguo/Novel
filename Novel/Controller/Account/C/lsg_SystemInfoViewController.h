//
//  lsg_SystemInfoViewController.h
//  Novel 推送(系统)消息
//
//  Created by user on 2018/2/27.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_BaseViewController.h"

#import "lsg_PageDataEditView.h"
#import "lsg_FSPageContentView.h"
#import "lsg_BaseSelectedButtonView.h"
#import "lsg_SystemInfoSubViewController.h"

@interface lsg_SystemInfoViewController : lsg_BaseViewController<lsg_BaseSelectedButtonViewDelegate, lsg_FSPageContentViewDelegate, lsg_PageDataEditViewDelegate>

@end
