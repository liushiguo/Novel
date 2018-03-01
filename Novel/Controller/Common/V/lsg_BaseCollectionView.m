//
//  lsg_BaseCollectionView.m
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_BaseCollectionView.h"
#import "MJRefresh.h"

@implementation lsg_BaseCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


//下拉刷新
- (void)baseCollectionViewAddRefreshingData{
    __weak typeof(self) weakSelf = self;
    [self addLegendHeaderWithRefreshingBlock:^{
        if ([weakSelf.baseCollectionViewDelegate respondsToSelector:@selector(baseCollectionViewRefreshingData:)]) {
            [weakSelf.baseCollectionViewDelegate baseCollectionViewRefreshingData:weakSelf];
        }else{
            [weakSelf.header endRefreshing];
        }
        //[weakSelf.header setTitle:@"更新完成" forState:MJRefreshHeaderStateIdle];
    }];
    self.header.updatedTimeHidden = YES;
}

//是否隐藏刷新时间标签
- (void)hideBaseCollectionViewUpdatedTimeHidden:(BOOL)hiedden{
    self.header.updatedTimeHidden = hiedden;
}

//是否隐藏footer,默认显示
- (void)hideBaseCollectionViewFooterHidden:(BOOL)hiedden{
    self.footer.hidden = hiedden;
}

//上拉加载更多
- (void)baseCollectionViewAddRefreshingMoreData{
    __weak typeof(self) weakSelf = self;
    [self addLegendFooterWithRefreshingBlock:^{
        if ([weakSelf.baseCollectionViewDelegate respondsToSelector:@selector(baseCollectionViewRefreshingMoreData:)]) {
            [weakSelf.baseCollectionViewDelegate baseCollectionViewRefreshingMoreData:weakSelf];
        }else{
            [weakSelf.footer endRefreshing];
        }
    }];
}

//停止下拉刷新动画
- (void)endBaseCollectionViewHeaderRefreshing{
    [self.header endRefreshing];
}

//停止上拉加载动画
- (void)endBaseCollectionViewFooterRefreshing{
    [self.footer endRefreshing];
}

//停止上拉加载、下拉刷新动画
- (void)endBaseCollectionViewRefreshingAnimation{
    [self.header endRefreshing];
    [self.footer endRefreshing];
}

//上拉加载没有更多数据
- (void)baseCollectionViewHaveNoMoreData{
    [self.footer noticeNoMoreData];
}

//设置collectionView的代理对象

- (void)baseCollectionViewDelegate:(id)viewController{
    self.dataSource = viewController;
    self.delegate = viewController;
}

//设置collecctionView 的属性
- (instancetype)initWithCollectionViewFrame:(CGRect)frame andCollectionViewLayout:(UICollectionViewFlowLayout *)flowLayout{
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        
    }
    return self;
}

+ (instancetype)shareCollectionViewFrame:(CGRect)frame andCollectionViewLayout:(UICollectionViewFlowLayout *)flowLayout{
    return [[self alloc]initWithCollectionViewFrame:frame andCollectionViewLayout:flowLayout];
}

- (void)customCollectionItemSize:(CGSize)itemSize sectionInset:(UIEdgeInsets)sectionInset andminimumLineSpacing:(CGFloat)miniSpacing{}

@end
