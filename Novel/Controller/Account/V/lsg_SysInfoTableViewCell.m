//
//  lsg_SysInfoTableViewCell.m
//  Novel
//
//  Created by user on 2018/2/27.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_SysInfoTableViewCell.h"

#define SysInfoCellH DEVICE_HEIGHT/667*50

@implementation lsg_SysInfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _lsg_xzBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, (SysInfoCellH-50)/2, 50, 50)];
        [_lsg_xzBtn setImage:[UIImage imageNamed:@"novel_sysinfo_xz"] forState:UIControlStateNormal];
        [_lsg_xzBtn setImage:[UIImage imageNamed:@"novel_sysinfo_xzed"] forState:UIControlStateSelected];
        _lsg_xzBtn.hidden = YES;
        [_lsg_xzBtn addTarget:self action:@selector(lsg_xzBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_lsg_xzBtn];
        
        _lsg_sysImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, (SysInfoCellH-20)/2, 21, 20)];
        _lsg_sysImage.image = [UIImage imageNamed:@"novel_sys_noread"];
        [self.contentView addSubview:_lsg_sysImage];
        
        _lsg_idImage = [[UIImageView alloc] initWithFrame:CGRectMake(27, _lsg_sysImage.frame.origin.y-6, 10.5, 10.5)];
        _lsg_idImage.image = [UIImage imageNamed:@"novel_sys_new"];
        [self.contentView addSubview:_lsg_idImage];
        
        _lsg_titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_lsg_sysImage.frame)+17, 0, 100, SysInfoCellH)];
        _lsg_titleLabel.text = @"系统消息";
        _lsg_titleLabel.font = COMMON_F15;
        _lsg_titleLabel.textColor = COMMON_C51;
        [self.contentView addSubview:_lsg_titleLabel];
        
        _lsg_timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(DEVICE_WIDTH-15-100, 0, 100, SysInfoCellH)];
        _lsg_timeLabel.text = @"2018-2-22";
        _lsg_timeLabel.font = COMMON_F12;
        _lsg_timeLabel.textColor = COMMON_C51;
        _lsg_timeLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_lsg_timeLabel];
        
        _lsg_lineView = [[UIView alloc] initWithFrame:CGRectMake(0, SysInfoCellH-0.5, DEVICE_WIDTH, 0.5)];
        _lsg_lineView.backgroundColor = FENGEXIAN_COLOR;
        [self.contentView addSubview:_lsg_lineView];
    }
    return self;
}

- (void)lsg_xzBtnClicked:(UIButton *)sender{
    if(sender.isSelected){
        sender.selected = NO;
    }else{
        sender.selected = YES;
    }
    if ([self.delegate respondsToSelector:@selector(lsg_xzBtnClicked:)]) {
        [self.delegate lsg_xzBtnClicked:_cellIndexPath];
    }
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
