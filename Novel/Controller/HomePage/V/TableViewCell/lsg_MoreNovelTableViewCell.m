//
//  lsg_MoreNovelTableViewCell.m
//  Novel
//
//  Created by user on 2018/2/26.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_MoreNovelTableViewCell.h"

@implementation lsg_MoreNovelTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat w = DEVICE_WIDTH/375*68;
        CGFloat h = DEVICE_WIDTH/375*93;
        
        _lsg_bookImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, w, h)];
        _lsg_bookImage.backgroundColor = [UIColor blueColor];
        [lsg_HandleUtil lsg_handleRadius:_lsg_bookImage];
        [self.contentView addSubview:_lsg_bookImage];
        
        _lsg_mcImage = [[UIImageView alloc] initWithFrame:CGRectMake(DEVICE_WIDTH/375*6, DEVICE_WIDTH/375*4, 29.5, 26.5)];
        _lsg_mcImage.hidden = YES;
        [self.contentView addSubview:_lsg_mcImage];
        
        _lsg_bookNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_lsg_bookImage.frame)+21, 15, DEVICE_WIDTH-15-21-CGRectGetMaxX(_lsg_bookImage.frame), 14)];
        _lsg_bookNameLabel.font = COMMON_F15;
        _lsg_bookNameLabel.textColor = COMMON_C51;
        _lsg_bookNameLabel.text = @"金雷爵士舞";
        [self.contentView addSubview:_lsg_bookNameLabel];
        
        _lsg_authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_lsg_bookImage.frame)+21, CGRectGetMaxY(_lsg_bookNameLabel.frame)+7, DEVICE_WIDTH-15-21-CGRectGetMaxX(_lsg_bookImage.frame), 14)];
        _lsg_authorLabel.font = COMMON_F13;
        _lsg_authorLabel.textColor = COMMON_C153;
        _lsg_authorLabel.text = @"张三丰";
        [self.contentView addSubview:_lsg_authorLabel];
        
        _lsg_infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_lsg_bookImage.frame)+21, CGRectGetMaxY(_lsg_bookImage.frame)-32, DEVICE_WIDTH-15-21-CGRectGetMaxX(_lsg_bookImage.frame), 32)];
        _lsg_infoLabel.font = COMMON_F13;
        _lsg_infoLabel.numberOfLines = 2;
        _lsg_infoLabel.textColor = COMMON_C191;
        _lsg_infoLabel.text = @"简介:中间库书阿帆反馈你但凡放假啊龙卷风拉发的你看吧书哪款女考虑呢";
        [self.contentView addSubview:_lsg_infoLabel];
        
        int x = _lsg_bookNameLabel.frame.origin.x;
        
        for(int i = 0; i < 4; i++){
            UILabel *biaoqianLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, CGRectGetMaxY(_lsg_authorLabel.frame)+7, 40, 15)];
            biaoqianLabel.font = COMMON_F10;
            biaoqianLabel.textColor = RGB(114, 27, 118);//RGB(29, 23, 120)蓝色 RGB(241, 158, 194)粉红
            biaoqianLabel.layer.borderColor = RGB(114, 27, 118).CGColor;
            if(i == 1){
                biaoqianLabel.textColor = RGB(29, 23, 120);
                biaoqianLabel.layer.borderColor = RGB(29, 23, 120).CGColor;
            }else if(i == 2){
                biaoqianLabel.textColor = RGB(241, 158, 194);
                biaoqianLabel.layer.borderColor = RGB(241, 158, 194).CGColor;
            }
            biaoqianLabel.text = @"都市";
            biaoqianLabel.layer.borderWidth = 1.0;
            biaoqianLabel.layer.cornerRadius = 6.0;
            biaoqianLabel.layer.masksToBounds = YES;
            biaoqianLabel.textAlignment = NSTextAlignmentCenter;
            [self.contentView addSubview:biaoqianLabel];
            
            x+=10+40;
        }
        
        _lsg_lineView = [[UIView alloc] initWithFrame:CGRectMake(15, h+30-0.5, DEVICE_WIDTH-30, 0.5)];
        _lsg_lineView.backgroundColor = FENGEXIAN_COLOR;
        [self.contentView addSubview:_lsg_lineView];
    }
    return self;
}

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
