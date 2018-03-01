//
//  lsg_MorePageViewController.h
//  Novel 更多小说
//
//  Created by user on 2018/2/26.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_BaseViewController.h"

#import "lsg_BaseTableView.h"
#import "lsg_MoreNovelTableViewCell.h"
#import "lsg_ADMoreNovelTableViewCell.h"

@interface lsg_MorePageViewController : lsg_BaseViewController<lsg_BaseTableViewDelegate>

@property (nonatomic, strong) NSString *pageTitle;

@end
