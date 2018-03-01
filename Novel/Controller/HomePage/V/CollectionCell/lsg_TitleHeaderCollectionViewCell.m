//
//  lsg_TitleHeaderCollectionViewCell.m
//  Novel
//
//  Created by user on 2018/2/24.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_TitleHeaderCollectionViewCell.h"

@implementation lsg_TitleHeaderCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _lsg_hBgView = [[UIView alloc] initWithFrame:CGRectMake(-15, 0, frame.size.width, frame.size.height)];
        _lsg_hBgView.backgroundColor = COMMON_C242;
        [self.contentView addSubview:_lsg_hBgView];
        
        _lsg_wBgView = [[UIView alloc] initWithFrame:CGRectMake(-15, 6, frame.size.width, frame.size.height-6)];
        _lsg_wBgView.backgroundColor = COMMON_C255;//[UIColor redColor];//
        [self.contentView addSubview:_lsg_wBgView];
        
        _lsg_idView = [[UIView alloc] initWithFrame:CGRectMake(15, 13, 5, _lsg_wBgView.frame.size.height-26)];
        _lsg_idView.backgroundColor = NAVEGATION_COLOR;
        [lsg_HandleUtil lsg_handleRadius:_lsg_idView];
        [_lsg_wBgView addSubview:_lsg_idView];
        
        _lsg_titLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_lsg_idView.frame)+15, _lsg_idView.frame.origin.y+(_lsg_idView.frame.size.height-15)/2, 100, 15)];
        _lsg_titLabel.font = COMMON_F16;
        _lsg_titLabel.textColor = COMMON_C51;
        _lsg_titLabel.text = @"热门分类";
        [_lsg_wBgView addSubview:_lsg_titLabel];
        
        CGFloat w = [lsg_HandleUtil lsg_labelWidthWithString:@"换一换" :COMMON_F13 :12];
        
        _lsg_changeDLabel = [[UILabel alloc] initWithFrame:CGRectMake(DEVICE_WIDTH-14-15-w-5, _lsg_idView.frame.origin.y+(_lsg_idView.frame.size.height-12)/2, w, 12)];
        _lsg_changeDLabel.font = COMMON_F13;
        _lsg_changeDLabel.textColor = COMMON_C51;
        _lsg_changeDLabel.text = @"换一换";
        [_lsg_wBgView addSubview:_lsg_changeDLabel];
        
        _lsg_rightImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_lsg_changeDLabel.frame)+5, _lsg_idView.frame.origin.y+(_lsg_idView.frame.size.height-14)/2, 14, 14)];
        _lsg_rightImage.backgroundColor = COMMON_C242;
        [_lsg_wBgView addSubview:_lsg_rightImage];
    }
    return self;
}

@end
