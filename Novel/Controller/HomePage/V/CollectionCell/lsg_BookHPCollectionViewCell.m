//
//  lsg_BookHPCollectionViewCell.m
//  Novel
//
//  Created by user on 2018/2/24.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_BookHPCollectionViewCell.h"

@implementation lsg_BookHPCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //NSLog(@"-----%lf", frame.size.width);
        _lsg_bookImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width/146*196)];
        _lsg_bookImage.backgroundColor = [UIColor blueColor];
        [lsg_HandleUtil lsg_handleRadius:_lsg_bookImage];
        [self.contentView addSubview:_lsg_bookImage];
        
        _lsg_bNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_lsg_bookImage.frame.origin.x, CGRectGetMaxY(_lsg_bookImage.frame)+6, _lsg_bookImage.frame.size.width, 11)];
        _lsg_bNameLabel.font = COMMON_F12;
        _lsg_bNameLabel.textColor = COMMON_C51;
        _lsg_bNameLabel.text = @"凤九王妃";
        [self.contentView addSubview:_lsg_bNameLabel];
        
        _lsg_authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(_lsg_bookImage.frame.origin.x, CGRectGetMaxY(_lsg_bNameLabel.frame)+5, _lsg_bookImage.frame.size.width, 8)];
        _lsg_authorLabel.font = COMMON_F10;
        _lsg_authorLabel.textColor = COMMON_C184;
        _lsg_authorLabel.text = @"张阿三";
        [self.contentView addSubview:_lsg_authorLabel];
    }
    return self;
}

@end
