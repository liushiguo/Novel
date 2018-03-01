//
//  lsg_AccountTableViewCell.m
//  Novel
//
//  Created by user on 2018/2/26.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_AccountTableViewCell.h"

@implementation lsg_AccountTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        int cellH = DEVICE_HEIGHT/667*53;
        
        _lsg_leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, (cellH-18.5)/2, 21, 18.5)];
        [self.contentView addSubview:_lsg_leftImage];
        
        _lsg_titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_lsg_leftImage.frame)+18, 0, 100, cellH)];
        _lsg_titleLabel.textColor = COMMON_C51;
        _lsg_titleLabel.font = COMMON_F15;
        [self.contentView addSubview:_lsg_titleLabel];
        
        _lsg_rightImage = [[UIImageView alloc] initWithFrame:CGRectMake(DEVICE_WIDTH-15-7, (cellH-12.5)/2, 7, 12.5)];
        _lsg_rightImage.image = [UIImage imageNamed:@"novel_account_go"];
        [self.contentView addSubview:_lsg_rightImage];
        
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
