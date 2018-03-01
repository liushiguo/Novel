//
//  lsg_PageDataEditView.m
//  Novel
//
//  Created by user on 2018/2/28.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_PageDataEditView.h"

@implementation lsg_PageDataEditView

//@property (nonatomic, strong) UIView   *bgView;
//@property (nonatomic, strong) UIView   *lineView;
//@property (nonatomic, strong) UIButton *leftBtn;//左右按钮
//@property (nonatomic, strong) UIButton *delBtn; //右边按钮
//@property (nonatomic, strong) UIView   *fengeView;

//- (instancetype)initWithFrame:(CGRect)frame{
//    self = [super initWithFrame:frame];
//    if (self) {
//        
//    }
//    return self;
//}

- (void)setLeftBtnStr:(NSString *)leftBtnStr{
    if (leftBtnStr) {
        _leftBtnStr = leftBtnStr;
        if (_leftBtnStr) {
            [_leftBtn setTitle:_leftBtnStr forState:UIControlStateNormal];
        }
    }
}

- (void)setRightBtnStr:(NSString *)rightBtnStr{
    if (rightBtnStr) {
        _rightBtnStr = rightBtnStr;
        if (_rightBtnStr) {
            [_delBtn setTitle:_rightBtnStr forState:UIControlStateNormal];
        }
    }
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    if (self) {
        _bgView = [[UIView alloc] init];
        _bgView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        _bgView.backgroundColor = COMMON_C255;
        [self addSubview:_bgView];
        
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 0.5)];
        _lineView.backgroundColor = FENGEXIAN_COLOR;
        [_bgView addSubview:_lineView];
        
        _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0.5, DEVICE_WIDTH/2-0.5, 58-0.5)];
        _leftBtn.titleLabel.font = COMMON_F16;
        //[_leftBtn setTitle:_leftBtnStr forState:UIControlStateNormal];
        [_leftBtn setTitleColor:RGB(64, 64, 71) forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(lsg_leftXZBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:_leftBtn];
        
        _delBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICE_WIDTH/2+0.5, 0.5, DEVICE_WIDTH/2-0.5, 58-0.5)];//删除按钮
        _delBtn.titleLabel.font = COMMON_F16;
        //[_delBtn setTitle:_rightBtnStr forState:UIControlStateNormal];
        [_delBtn setTitleColor:RGB(248, 63, 68) forState:UIControlStateNormal];
        [_delBtn addTarget:self action:@selector(lsg_delBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:_delBtn];
        
        _fengeView = [[UIView alloc] initWithFrame:CGRectMake(DEVICE_WIDTH/2-0.5, (58-36)/2, 1, 36)];
        _fengeView.backgroundColor = FENGEXIAN_COLOR;
        [_bgView addSubview:_fengeView];
    }
}

//- (UIView *)bgView{
//    if(!_bgView){
//        _bgView = [[UIView alloc] init];
//        _bgView.backgroundColor = COMMON_C255;
//        [self addSubview:_bgView];
//
//        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 0.5)];
//        _lineView.backgroundColor = FENGEXIAN_COLOR;
//        [_bgView addSubview:_lineView];
//
//        _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0.5, DEVICE_WIDTH/2-0.5, 58-0.5)];
//        _leftBtn.titleLabel.font = COMMON_F16;
//        [_leftBtn setTitle:@"全选" forState:UIControlStateNormal];
//        [_leftBtn setTitleColor:RGB(64, 64, 71) forState:UIControlStateNormal];
//        [_leftBtn addTarget:self action:@selector(lsg_leftXZBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [_bgView addSubview:_leftBtn];
//
//        _delBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICE_WIDTH/2+0.5, 0.5, DEVICE_WIDTH/2-0.5, 58-0.5)];//删除按钮
//        _delBtn.titleLabel.font = COMMON_F16;
//        [_delBtn setTitle:@"删除" forState:UIControlStateNormal];
//        [_delBtn setTitleColor:RGB(248, 63, 68) forState:UIControlStateNormal];
//        [_delBtn addTarget:self action:@selector(lsg_delBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [_bgView addSubview:_delBtn];
//
//        _fengeView = [[UIView alloc] initWithFrame:CGRectMake(DEVICE_WIDTH/2-0.5, (58-36)/2, 1, 36)];
//        _fengeView.backgroundColor = FENGEXIAN_COLOR;
//        [_bgView addSubview:_fengeView];
//    }
//    return _bgView;
//}

- (void)lsg_leftXZBtnClicked:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(lsg_leftXZBtnClicked:)]) {
        [self.delegate lsg_leftXZBtnClicked:btn];
    }
}

- (void)lsg_delBtnClicked:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(lsg_delBtnClicked:)]) {
        [self.delegate lsg_delBtnClicked:btn];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
