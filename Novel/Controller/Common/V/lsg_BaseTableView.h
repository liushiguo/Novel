//
//  lsg_BaseTableView.h
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol lsg_BaseTableViewDelegate <NSObject>

@optional
/** 下拉刷新代理方法 */
-(void)baseTableViewRefreshingData:(UITableView *)tableView;
/** 上拉加载更多代理方法 */
-(void)baseTableViewRefreshingMoreData:(UITableView *)tableView;
@end

@interface lsg_BaseTableView : UITableView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) id<lsg_BaseTableViewDelegate> BaseTableViewDelegate;

- (void)removeHeaderRefresh;
- (void)removeFooterRefresh;

/**
 * 设置TableView的代理对象
 */
- (void)baseTableViewDelegate:(id)viewController;

/**
 * 添加下拉刷新功能（必须添加 BaseTableViewDelegate 代理方法后才能正常使用）
 */
-(void)baseTableViewAddLegendHeaderWithRefreshing;

/**
 * 添加上拉加载更多功能（必须添加 BaseTableViewDelegate 代理方法后才能正常使用）
 */
-(void)baseTableViewAddLegendFooterWithRefreshing;

/**
 *是否隐藏刷新时间标签,默认显示
 */
- (void)hideBaseTableViewUpdatedTimeHidden:(BOOL)hiedden;

/**
 *是否隐藏footer,默认显示
 */
- (void)hideBaseTableViewFooterHidden:(BOOL)hiedden;

/**
 * 停止下拉刷新动画
 */
-(void)endBaseTableViewHeaderRefreshing;

/**
 * 停止上拉加载动画
 */
-(void)endBaseTableViewFooterRefreshing;

/**
 * 停止上拉加载、下拉刷新的动画
 */
-(void)endBaseTableViewRefreshingAnimation;

/**
 * 上拉加载没有更多数据
 */
-(void)baseTableViewHaveNoMoreData;

///**
// * 设置TableView的属性
// */
- (instancetype)initWithTableViewFrame:(CGRect)frame tableViewStyle:(UITableViewStyle)tableViewStyle andSeparatorStyle:(UITableViewCellSeparatorStyle)separatorStyle;
//
///**
// * 设置TableView的属性
// */
+ (instancetype)shareTableViewFrame:(CGRect)frame tableViewStyle:(UITableViewStyle)tableViewStyle andSeparatorStyle:(UITableViewCellSeparatorStyle)separatorStyle;

@end
