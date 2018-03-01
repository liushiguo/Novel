//
//  lsg_SettingTableViewCell.m
//  Novel
//
//  Created by user on 2018/2/27.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_SettingTableViewCell.h"

@implementation lsg_SettingTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        int cellH = DEVICE_HEIGHT/667*53;
        
        _lsg_leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 150, cellH)];
        _lsg_leftLabel.font = COMMON_F17;
        _lsg_leftLabel.textColor = COMMON_C51;
        [self.contentView addSubview:_lsg_leftLabel];
        
        _lsg_rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(DEVICE_WIDTH-15-100, 0, 100, cellH)];
        _lsg_rightLabel.hidden = YES;
        _lsg_rightLabel.font = COMMON_F15;
        _lsg_rightLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_lsg_rightLabel];
        
        _lsg_rightImage = [[UIImageView alloc] initWithFrame:CGRectMake(DEVICE_WIDTH-15-7, (cellH-12.5)/2, 7, 12.5)];
        _lsg_rightImage.image = [UIImage imageNamed:@"novel_account_go"];
        _lsg_rightImage.hidden = YES;
        [self.contentView addSubview:_lsg_rightImage];
        
        _lsg_switchBtn = [[UISwitch alloc] initWithFrame:CGRectMake(DEVICE_WIDTH-15-50, (cellH-30)/2, 50, 30)];
        _lsg_switchBtn.hidden = YES;
        [self.contentView addSubview:_lsg_switchBtn];
        
        _lsg_lineView = [[UIView alloc] initWithFrame:CGRectMake(0, cellH-0.5, DEVICE_WIDTH, 0.5)];
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
