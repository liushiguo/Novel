//
//  lsg_VodMainViewController.h
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lsg_AnimateTabbar.h"

@class lsg_HomePageViewController;
@class lsg_BookshelfViewController;
@class lsg_ClassificationViewController;
@class lsg_AccountViewController;

@interface lsg_VodMainViewController : UIViewController<lsg_AnimateTabbarDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate>
{
   lsg_VodMainViewController *lsg_vodMainController;
}
@property (nonatomic, strong) UIView                           *childView;

@property (nonatomic, strong) lsg_HomePageViewController       *oneViewController;
@property (nonatomic, strong) lsg_BookshelfViewController      *twoViewController;
@property (nonatomic, strong) lsg_ClassificationViewController *threeViewController;
@property (nonatomic, strong) lsg_AccountViewController        *fourViewController;

/*
 * 跳转到某个模块
 *
 * 1、首页; 2、书架; 3、分类; 4、账户;
 */
- (void)tabButtonClick:(NSInteger)num;

@end
