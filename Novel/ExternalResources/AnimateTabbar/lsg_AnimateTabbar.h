//
//  lsg_AnimateTabbar.h
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol lsg_AnimateTabbarDelegate<NSObject>
@required

- (void)oneBtnClick;
- (void)twoBtnClick;
- (void)threeBtnClick;
- (void)fourBtnClick;

@end

@interface lsg_AnimateTabbarView : UIView <UIGestureRecognizerDelegate>

@property(nonatomic,strong) UIColor   *blurTintColor;
@property(nonatomic,strong) UIToolbar *toolbar;
@property(nonatomic,strong) CALayer   *blurLayer;
@property(nonatomic,strong) id<lsg_AnimateTabbarDelegate> delegate;
@property(nonatomic,strong) UIButton  *oneBtn;
@property(nonatomic,strong) UIButton  *twoBtn;
@property(nonatomic,strong) UIButton  *threeBtn;
@property(nonatomic,strong) UIButton  *fourBtn;
//@property(nonatomic,strong) UIButton *fiveBtn;

- (void)buttonClickAction:(id)sender;

@end
