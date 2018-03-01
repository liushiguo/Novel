//
//  lsg_PageDataEditView.h
//  Novel 书架和
//
//  Created by user on 2018/2/28.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol lsg_PageDataEditViewDelegate<NSObject>

@optional
- (void)lsg_leftXZBtnClicked:(UIButton *)btn;
- (void)lsg_delBtnClicked:(UIButton *)btn;
@end

@interface lsg_PageDataEditView : UIView

@property (nonatomic, assign) id<lsg_PageDataEditViewDelegate> delegate;

@property (nonatomic, strong) NSString *leftBtnStr;//左边按钮title
@property (nonatomic, strong) NSString *rightBtnStr;//左边按钮title

@property (nonatomic, strong) UIView   *bgView;
@property (nonatomic, strong) UIView   *lineView;
@property (nonatomic, strong) UIButton *leftBtn;   //左右按钮
@property (nonatomic, strong) UIButton *delBtn;    //右边按钮
@property (nonatomic, strong) UIView   *fengeView;

@end
