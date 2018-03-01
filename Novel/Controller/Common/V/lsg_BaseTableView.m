//
//  lsg_BaseTableView.m
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_BaseTableView.h"
#import "MJRefresh.h"

@implementation lsg_BaseTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//设置TableView的属性
- (instancetype)initWithTableViewFrame:(CGRect)frame tableViewStyle:(UITableViewStyle)tableViewStyle andSeparatorStyle:(UITableViewCellSeparatorStyle)separatorStyle{
    self = [super initWithFrame:frame style:tableViewStyle];
    if (self) {
        self.separatorStyle = separatorStyle;
    }
    return self;
}

//设置TableView的属性
+ (instancetype)shareTableViewFrame:(CGRect)frame tableViewStyle:(UITableViewStyle)tableViewStyle andSeparatorStyle:(UITableViewCellSeparatorStyle)separatorStyle{
    return [[self alloc] initWithTableViewFrame:frame tableViewStyle:tableViewStyle andSeparatorStyle:separatorStyle];
}

//添加上拉加载更多方法
- (void)baseTableViewAddLegendFooterWithRefreshing{
    typeof(self) __weak weakSelf = self;
    [self addLegendFooterWithRefreshingBlock:^{
        if ([weakSelf.BaseTableViewDelegate respondsToSelector:@selector(baseTableViewRefreshingMoreData:)]) {
            [weakSelf.BaseTableViewDelegate baseTableViewRefreshingMoreData:weakSelf];
        }else{
            [weakSelf.footer endRefreshing];
        }
    }];
}

//添加下拉刷新方法
- (void)baseTableViewAddLegendHeaderWithRefreshing{
    __weak typeof(self) weakSelf = self;
    [self addLegendHeaderWithRefreshingBlock:^{
        if ([weakSelf.BaseTableViewDelegate respondsToSelector:@selector(baseTableViewRefreshingData:)]) {
            [weakSelf.BaseTableViewDelegate baseTableViewRefreshingData:weakSelf];
        }
    }];
    self.header.updatedTimeHidden = YES;
}

- (UIImage *)scaleToSize:(UIImage *)img{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(CGSizeMake(75, 75));
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, 75, 75)];
    // 从当前context中创建一个改变大小后的图片
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return scaledImage;
}

- (void)removeHeaderRefresh{
    [self removeHeader];
}

- (void)removeFooterRefresh{
    [self removeFooter];
}

//是否隐藏刷新时间标签
- (void)hideBaseTableViewUpdatedTimeHidden:(BOOL)hiedden{
    self.header.updatedTimeHidden = hiedden;
}

//是否隐藏footer,默认显示
- (void)hideBaseTableViewFooterHidden:(BOOL)hiedden{
    self.footer.hidden = hiedden;
}

//停止上拉加载动画
- (void)endBaseTableViewFooterRefreshing{
    [self.footer endRefreshing];
}

//停止下拉刷新动画
- (void)endBaseTableViewHeaderRefreshing{
    [self.header endRefreshing];
}

//停止上拉加载、下拉刷新的动画
- (void)endBaseTableViewRefreshingAnimation{
    [self.footer endRefreshing];
    [self.header endRefreshing];
}

//上拉加载没有更多数据
- (void)baseTableViewHaveNoMoreData{
    [self.footer noticeNoMoreData];
}

//设置tableView的代理对象
- (void)baseTableViewDelegate:(id)viewController{
    self.dataSource = viewController;
    self.delegate = viewController;
}

@end
