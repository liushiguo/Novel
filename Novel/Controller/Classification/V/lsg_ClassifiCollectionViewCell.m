//
//  lsg_ClassifiCollectionViewCell.m
//  Novel
//
//  Created by LSG on 2018/2/25.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_ClassifiCollectionViewCell.h"

@implementation lsg_ClassifiCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _lsg_classifiImage = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/125*((125-50)/2), 20, frame.size.width/125*50, frame.size.width/125*50)];
        _lsg_classifiImage.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:_lsg_classifiImage];
        
        _lsg_classifiNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_lsg_classifiImage.frame.origin.x, CGRectGetMaxY(_lsg_classifiImage.frame)+10, _lsg_classifiImage.frame.size.width, 13)];
        _lsg_classifiNameLabel.font = COMMON_F13;
        _lsg_classifiNameLabel.textColor = COMMON_C51;
        _lsg_classifiNameLabel.text = @"游戏";
        _lsg_classifiNameLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_lsg_classifiNameLabel];
    }
    return self;
}

@end
