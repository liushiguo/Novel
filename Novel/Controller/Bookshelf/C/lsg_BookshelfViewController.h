//
//  BookshelfViewController.h
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_BaseViewController.h"

#import "lsg_PageDataEditView.h"
#import "lsg_FSPageContentView.h"
#import "lsg_BaseSelectedButtonView.h"
#import "lsg_BannerBookshelfController.h"

@interface lsg_BookshelfViewController : lsg_BaseViewController<lsg_BaseSelectedButtonViewDelegate, lsg_FSPageContentViewDelegate, lsg_PageDataEditViewDelegate>

@end
