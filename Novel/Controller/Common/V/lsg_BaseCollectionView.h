//
//  lsg_BaseCollectionView.h
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>
@class lsg_BaseCollectionView;

@protocol BaseCollectionViewDelegate <NSObject>

@optional
/**
 *下拉刷新调用代理方法
 */
- (void)baseCollectionViewRefreshingData:(lsg_BaseCollectionView *)collectionView;
/**
 *上拉加载更多调用代理方法
 */
- (void)baseCollectionViewRefreshingMoreData:(lsg_BaseCollectionView *)collectionView;

@end

@interface lsg_BaseCollectionView : UICollectionView

@property (nonatomic, assign) id<BaseCollectionViewDelegate> baseCollectionViewDelegate;

/**
 * 设置collectionView的代理对象
 */
- (void)baseCollectionViewDelegate:(id)viewController;

/**
 *添加下拉刷新功能（必须添加 BaseCollectionViewDelegate 代理方法后才能正常使用）
 */
- (void)baseCollectionViewAddRefreshingData;

/**
 *添加上拉加载功能（必须添加 BaseCollectionViewDelegate 代理方法后才能正常使用）
 */
- (void)baseCollectionViewAddRefreshingMoreData;

/**
 * 停止下拉刷新动画
 */
-(void)endBaseCollectionViewHeaderRefreshing;

/**
 * 停止上拉加载动画
 */
-(void)endBaseCollectionViewFooterRefreshing;

/**
 * 停止上拉加载、下拉刷新动画
 */
-(void)endBaseCollectionViewRefreshingAnimation;

/**
 * 上拉加载没有更多数据
 */
-(void)baseCollectionViewHaveNoMoreData;

/**
 *是否隐藏刷新时间标签,默认显示
 */
- (void)hideBaseCollectionViewUpdatedTimeHidden:(BOOL)hiedden;

/**
 *是否隐藏footer,默认显示
 */
- (void)hideBaseCollectionViewFooterHidden:(BOOL)hiedden;

/**
 * 设置collectionview的item
 */
- (void)customCollectionItemSize:(CGSize)itemSize sectionInset:(UIEdgeInsets)sectionInset andminimumLineSpacing:(CGFloat)miniSpacing;

/**
 *设置collecctionView 的属性
 */
- (instancetype)initWithCollectionViewFrame:(CGRect)frame andCollectionViewLayout:(UICollectionViewFlowLayout *)flowLayout;

/**
 *设置collecctionView 的属性
 */
+ (instancetype)shareCollectionViewFrame:(CGRect)frame andCollectionViewLayout:(UICollectionViewFlowLayout *)flowLayout;

@end
