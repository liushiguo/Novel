//
//  lsg_BookHPCollectionViewCell.h
//  Novel
//
//  Created by user on 2018/2/24.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lsg_HandleUtil.h"

@interface lsg_BookHPCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel     *lsg_bNameLabel;
@property (nonatomic, strong) UILabel     *lsg_authorLabel;
@property (nonatomic, strong) UIImageView *lsg_bookImage;//封面

@end
