//
//  lsg_ADMoreNovelTableViewCell.m
//  Novel
//
//  Created by user on 2018/2/26.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_ADMoreNovelTableViewCell.h"

@implementation lsg_ADMoreNovelTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGFloat h = DEVICE_WIDTH/375*109;
        _lsg_adBgImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 6, DEVICE_WIDTH-30, h)];
        _lsg_adBgImage.backgroundColor = [UIColor blueColor];
        [lsg_HandleUtil lsg_handleRadius:_lsg_adBgImage];
        [self.contentView addSubview:_lsg_adBgImage];
        
        _lsg_lineView = [[UIView alloc] initWithFrame:CGRectMake(15, h+12-0.5, DEVICE_WIDTH-30, 0.5)];
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
