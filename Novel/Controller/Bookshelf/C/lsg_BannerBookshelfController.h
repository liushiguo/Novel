//
//  lsg_BannerBookshelfController.h
//  Novel
//
//  Created by user on 2018/2/26.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lsg_BaseCollectionView.h"
#import "lsg_BookshelfCollectionViewCell.h"

@interface lsg_BannerBookshelfController : UIViewController<lsg_BookshelfCellDelegate>
@property (nonatomic, strong) NSString *collectOrHistory;//书架(收藏或历史)
@end
