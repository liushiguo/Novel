//
//  lsg_FSPageContentView.h
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>
@class lsg_FSPageContentView;

@protocol lsg_FSPageContentViewDelegate <NSObject>

@optional

/**
 FSPageContentView开始滑动

 @param contentView FSPageContentView
 */
- (void)lsg_FSContentViewWillBeginDragging:(lsg_FSPageContentView *)contentView;

/**
 FSPageContentView滑动调用

 @param contentView FSPageContentView
 @param startIndex 开始滑动页面索引
 @param endIndex 结束滑动页面索引
 @param progress 滑动进度
 */
- (void)lsg_FSContentViewDidScroll:(lsg_FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex progress:(CGFloat)progress;

/**
 FSPageContentView结束滑动

 @param contentView FSPageContentView
 @param startIndex 开始滑动索引
 @param endIndex 结束滑动索引
 */
- (void)lsg_FSContenViewDidEndDecelerating:(lsg_FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex;

/**
 scrollViewDidEndDragging

 @param contentView FSPageContentView
 */
- (void)lsg_FSContenViewDidEndDragging:(lsg_FSPageContentView *)contentView;

@end

@interface lsg_FSPageContentView : UIView

/**
 对象方法创建FSPageContentView

 @param frame frame
 @param childVCs 子VC数组
 @param parentVC 父视图VC
 @param delegate delegate
 @return FSPageContentView
 */
- (instancetype)initWithFrame:(CGRect)frame childVCs:(NSArray *)childVCs parentVC:(UIViewController *)parentVC delegate:(id<lsg_FSPageContentViewDelegate>)delegate;

@property (nonatomic, weak) id<lsg_FSPageContentViewDelegate>delegate;

/**
 设置contentView当前展示的页面索引，默认为0
 */
@property (nonatomic, assign) NSInteger contentViewCurrentIndex;

/**
 设置contentView能否左右滑动，默认YES
 */
@property (nonatomic, assign) BOOL contentViewCanScroll;

@end
