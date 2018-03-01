//
//  lsg_BannerHPCollectionViewCell.m
//  Novel
//
//  Created by user on 2018/2/24.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_BannerHPCollectionViewCell.h"

@implementation lsg_BannerHPCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _lsg_bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _lsg_bgImage.backgroundColor = [UIColor brownColor];
        [self.contentView addSubview:_lsg_bgImage];
    }
    return self;
}

@end
