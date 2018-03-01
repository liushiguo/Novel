//
//  lsg_CommemtTableViewCell.m
//  Novel
//
//  Created by user on 2018/2/28.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_CommemtTableViewCell.h"

@implementation lsg_CommemtTableViewCell
//@property (nonatomic, strong) UIImageView *lsg_headImage;
//@property (nonatomic, strong) UILabel     *lsg_nameLabel;
//@property (nonatomic, strong) UILabel     *lsg_timeLabel;
//@property (nonatomic, strong) UIButton    *lsg_zanBtn;
//@property (nonatomic, strong) UILabel     *lsg_zanNum;   //赞数量
//@property (nonatomic, strong) UIImageView *lsg_moreImage;
//@property (nonatomic, strong) UILabel     *lsg_commentWZ;//评论文字

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _lsg_headImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 18, 49, 49)];
        _lsg_headImage.backgroundColor = COMMON_C242;
        [self.contentView addSubview:_lsg_headImage];
        
        _lsg_nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_lsg_headImage.frame)+15, _lsg_headImage.frame.origin.y+2, DEVICE_WIDTH-15-CGRectGetMaxX(_lsg_headImage.frame), 14)];
        _lsg_nameLabel.text = @"妞妞";
        _lsg_nameLabel.textColor = COMMON_C102;
        _lsg_nameLabel.font = COMMON_F15;
        [self.contentView addSubview:_lsg_nameLabel];
        
        _lsg_timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_lsg_nameLabel.frame.origin.x, CGRectGetMaxY(_lsg_nameLabel.frame)+13, 100, 10)];
        _lsg_timeLabel.text = @"2017-02-22 22:22";
        _lsg_timeLabel.textColor = COMMON_C153;
        _lsg_timeLabel.font = COMMON_F11;
        [self.contentView addSubview:_lsg_timeLabel];
        
        _lsg_commentWZ = [[UILabel alloc] initWithFrame:CGRectMake(_lsg_nameLabel.frame.origin.x, CGRectGetMaxY(_lsg_timeLabel.frame)+12, DEVICE_WIDTH-15-_lsg_nameLabel.frame.origin.x, 54)];
        _lsg_commentWZ.text = @"我女哦啊反女爬到女帝拿掉你的是能看到女欧尼我女哦啊反女爬到女帝拿掉你的是能看到女欧尼我女哦啊反女爬到女帝拿掉你的是能看到女欧尼";
        _lsg_commentWZ.numberOfLines = 3;
        _lsg_commentWZ.textColor = COMMON_C51;
        _lsg_commentWZ.font = COMMON_F15;
        [self.contentView addSubview:_lsg_commentWZ];
        
        _lsg_lineView = [[UIView alloc] initWithFrame:CGRectMake(15, 134-0.5, DEVICE_WIDTH-30, 0.5)];
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
