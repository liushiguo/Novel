//
//  lsg_BaseViewController.h
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseViewControllerDelegate <NSObject>
@optional

/** 导航栏返回按钮代理方法 */
- (void)lsg_goBackBtnClick:(UIButton *)sender;
/** 导航栏编辑按钮代理方法 */
- (void)lsg_editBtnClick:(UIButton *)sender;
/** 导航栏搜索按钮代理方法 */
- (void)lsg_searchBtnClick:(UIButton *)sender;

@end

@interface lsg_BaseViewController : UIViewController<UIGestureRecognizerDelegate>

@property (nonatomic, assign) id<BaseViewControllerDelegate>baseViewDelegate;

@property (nonatomic, strong) UIView      *lsg_navigationView;
@property (nonatomic, strong) UIView      *lsg_navlLineView;
@property (nonatomic, strong) UILabel     *lsg_navTitleLabel;
@property (nonatomic, strong) UIButton    *lsg_goBackButton;
@property (nonatomic, strong) UIButton    *lsg_editButton;//编辑
@property (nonatomic, strong) UIButton    *lsg_searchButton;

@end
