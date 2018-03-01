//
//  lsg_BookshelfCollectionViewCell.m
//  Novel
//
//  Created by LSG on 2018/2/25.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_BookshelfCollectionViewCell.h"

@implementation lsg_BookshelfCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _lsg_bookImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, frame.size.width-30, (frame.size.width-30)/180*254)];
        _lsg_bookImage.backgroundColor = [UIColor blueColor];
        [lsg_HandleUtil lsg_handleRadius:_lsg_bookImage];
        [self.contentView addSubview:_lsg_bookImage];
        
        _lsg_bNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_lsg_bookImage.frame.origin.x, CGRectGetMaxY(_lsg_bookImage.frame)+15, _lsg_bookImage.frame.size.width, 14)];
        _lsg_bNameLabel.font = COMMON_F13;
        _lsg_bNameLabel.textColor = COMMON_C51;
        _lsg_bNameLabel.text = @"凤九王妃";
        [self.contentView addSubview:_lsg_bNameLabel];
        
        _lsg_yuedubiLabel = [[UILabel alloc] initWithFrame:CGRectMake(_lsg_bookImage.frame.origin.x, CGRectGetMaxY(_lsg_bNameLabel.frame)+4, _lsg_bookImage.frame.size.width, 11)];
        _lsg_yuedubiLabel.font = COMMON_F11;
        _lsg_yuedubiLabel.textColor = COMMON_C184;
        _lsg_yuedubiLabel.text = @"已阅读：50%";
        [self.contentView addSubview:_lsg_yuedubiLabel];
        
        _lsg_newidImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_lsg_bookImage.frame)-39, _lsg_bookImage.frame.origin.y-2, 41, 39.5)];
        _lsg_newidImage.image = [UIImage imageNamed:@"novel_bookshelf_newid"];
        [self.contentView addSubview:_lsg_newidImage];
        
        _lsg_delBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_lsg_bookImage.frame)-10-26, CGRectGetMaxY(_lsg_bookImage.frame)-11-26, 26, 26)];
        [_lsg_delBtn setImage:[UIImage imageNamed:@"novel_bookshelf_wxzed"] forState:UIControlStateNormal];
        [_lsg_delBtn setImage:[UIImage imageNamed:@"novel_bookshelf_xzed"] forState:UIControlStateSelected];
        [_lsg_delBtn addTarget:self action:@selector(lsg_delBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_lsg_delBtn];
    }
    return self;
}

- (void)lsg_delBtnClicked:(UIButton *)sender{
    if(sender.isSelected){
        sender.selected = NO;
    }else{
        sender.selected = YES;
    }
    if ([self.delegate respondsToSelector:@selector(lsg_delBtnClicked:)]) {
        [self.delegate lsg_delBtnclicked:_cellIndexPath];
    }
}

@end
