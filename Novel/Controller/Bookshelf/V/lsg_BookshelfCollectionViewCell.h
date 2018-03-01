//
//  lsg_BookshelfCollectionViewCell.h
//  Novel
//
//  Created by LSG on 2018/2/25.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lsg_HandleUtil.h"

@protocol lsg_BookshelfCellDelegate <NSObject>

@optional
- (void)lsg_delBtnclicked:(NSIndexPath *)indexPath;
@end

@interface lsg_BookshelfCollectionViewCell : UICollectionViewCell

@property (nonatomic, assign) id<lsg_BookshelfCellDelegate> delegate;
@property (nonatomic, strong) NSIndexPath *cellIndexPath;

@property (nonatomic, strong) UILabel     *lsg_bNameLabel;
@property (nonatomic, strong) UILabel     *lsg_yuedubiLabel;//阅读占比
@property (nonatomic, strong) UIImageView *lsg_bookImage;   //封面
@property (nonatomic, strong) UIImageView *lsg_newidImage;  //最新标识
@property (nonatomic, strong) UIButton    *lsg_delBtn;      //删除选择按钮

@end
