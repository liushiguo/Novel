//
//  lsg_TitleHeaderCollectionViewCell.h
//  Novel
//
//  Created by user on 2018/2/24.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lsg_HandleUtil.h"

@interface lsg_TitleHeaderCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIView      *lsg_hBgView;
@property (nonatomic, strong) UIView      *lsg_wBgView;
@property (nonatomic, strong) UIView      *lsg_idView;//标识view
@property (nonatomic, strong) UILabel     *lsg_titLabel;
@property (nonatomic, strong) UILabel     *lsg_changeDLabel;//改变数据提示
@property (nonatomic, strong) UIImageView *lsg_rightImage;//右边的图标

@end
