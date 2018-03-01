//
//  lsg_BaseTitleScrollerView.h
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lsg_HandleUtil.h"

@class lsg_BaseTitleScrollerView;

@protocol lsg_BaseTitleScrollerViewDelegate<NSObject>

@optional
/** BaseTitleScrollerView 点击 title 代理方法 */
- (void)lsg_baseTitleScrollerView:(lsg_BaseTitleScrollerView *)titleScrollerView scrollerToIndex:(NSInteger)index;

@end

@interface lsg_BaseTitleScrollerView : UIView

@property (nonatomic, strong) NSMutableArray *titleArray;       /**< button 字体数组 */
@property (nonatomic, assign) UIFont         *titleFont;       /**< button 字体大小 */
@property (nonatomic, strong) UIColor        *selectTitleColor;/**< button 选中字体颜色 */
@property (nonatomic, strong) UIColor        *normalBgColor;   /**< 正常状态下背景颜色 */
@property (nonatomic, strong) UIColor        *selectBgColor;   /**< button 选中字体背景颜色 */
@property (nonatomic, strong) UIColor        *titleColor;      /**< button 字体颜色 */
@property (nonatomic, strong) UIColor        *upLineColor;     /**< button 下划线颜色 */
@property (nonatomic, strong) UIColor        *lineColor;       /**< 分割线颜色 */
@property (nonatomic, assign) id<lsg_BaseTitleScrollerViewDelegate> delegate;

@property (nonatomic, assign) BOOL           isTitleCanClick;  /**< 标题是否可以点击，默认为YES */
@property (nonatomic, assign) BOOL           isHaveBorder;     /**< 是否为标签形式的，默认为 NO */
@property (nonatomic, assign) BOOL           isHaveFenGeLine;  /**< 是否显示分割线 */
/**
 * index (0~...)
 */
- (void)titleScrollerViewScrollerToIndex:(NSInteger)index;

@end
