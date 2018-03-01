//
//  lsg_BaseSelectedButtonView.h
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lsg_HandleUtil.h"
@class lsg_BaseSelectedButtonView;
@protocol lsg_BaseSelectedButtonViewDelegate<NSObject>

@optional
/** BaseSelectedButtonView 点击 title 代理方法 */
- (void)lsg_baseTitleScrollerView:(lsg_BaseSelectedButtonView *)titleScrollerView scrollerToIndex:(NSInteger)index;

- (void)lsg_baseTitleScrollerView:(lsg_BaseSelectedButtonView *)titleScrollerView reloadToIndex:(NSInteger)index;

@end

@interface lsg_BaseSelectedButtonView : UIView
@property (nonatomic, strong) NSMutableArray *titleArray;  /**< button 字体数组 */
@property (nonatomic, assign) UIFont         *titleFont;   /**< button 字体大小 */
@property (nonatomic, strong) UIColor        *upLineColor; /**< button 下划线颜色 */
@property (nonatomic, strong) UIColor        *normalColor; /**< button 默认颜色 */
@property (nonatomic, strong) UIColor        *lineColor;   /**< 分割线颜色 */
@property (nonatomic, strong) NSMutableArray *titleLengthArray;
@property (nonatomic, strong) NSMutableArray *titleTextLengthArray;
@property (nonatomic, strong) UIScrollView   *baseScrollerView;
@property (nonatomic, strong) UIButton       *lastSelectButton;
@property (nonatomic, assign) NSInteger      scrollerIndex;
@property (nonatomic, strong) UIView         *upLineView;
@property (nonatomic, strong) UIView         *lineView;
@property (nonatomic, assign) int            scrollWidth;
@property (nonatomic, assign) BOOL           hidLineView;  /**< 是否隐藏下面的横线 */
@property (nonatomic, assign) BOOL           ifJF;         /**< 如果按钮需要均分屏幕的宽度 */
@property (nonatomic, assign) id<lsg_BaseSelectedButtonViewDelegate> delegate;

/**
 * index (0~...)
 */
- (void)titleScrollerViewScrollerToIndex:(NSInteger)index;
@end
