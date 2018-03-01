//
//  lsg_ADCollectionViewCell.m
//  Novel
//
//  Created by user on 2018/2/24.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_ADCollectionViewCell.h"

@implementation lsg_ADCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //self.contentView.backgroundColor = [UIColor blackColor];
        
        _lsg_adImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [lsg_HandleUtil lsg_handleRadius:_lsg_adImage];
        _lsg_adImage.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_lsg_adImage];
    }
    return self;
}

@end
