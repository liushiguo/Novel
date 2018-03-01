//
//  lsg_BaseTitleScrollerView.m
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_BaseTitleScrollerView.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

@interface lsg_BaseTitleScrollerView()<UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *titleLengthArray;
@property (nonatomic, strong) NSMutableArray *titleTextLengthArray;
@property (nonatomic, strong) UIScrollView   *baseScrollerView;
@property (nonatomic, strong) UIButton       *lastSelectButton;
@property (nonatomic, assign) NSInteger      scrollerIndex;
@property (nonatomic, strong) UIView         *upLineView;
@property (nonatomic, strong) UIView         *lineView;

@end

@implementation lsg_BaseTitleScrollerView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

//- (instancetype)init{
//    self = [super init];
//    if (self) {
//        _selectBgColor = COMMON_C255;
//        _normalBgColor = COMMON_C255;
//        _titleFont = COMMON_F14;
//        _titleColor = COMMON_C99;
//        _selectTitleColor = WENZIHUANG;
//        _normalBgColor = COMMON_C244;
//        _selectBgColor = COMMON_C244;
//        _isTitleCanClick = YES;
//    }
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleFont = COMMON_F14;
        _titleColor = COMMON_C153;
        _selectTitleColor = NAVEGATION_COLOR;
        _normalBgColor = COMMON_C255;
        _selectBgColor = COMMON_C255;
        _isTitleCanClick = YES;
    }
    return self;
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    if (self) {
        self.baseScrollerView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    }
}

- (UIScrollView *)baseScrollerView{
    if (!_baseScrollerView) {
        _baseScrollerView = [[UIScrollView alloc] init];
        _baseScrollerView.backgroundColor = [UIColor clearColor];
        _baseScrollerView.delegate = self;
        _baseScrollerView.scrollsToTop = NO;
        _baseScrollerView.showsHorizontalScrollIndicator = NO;
        _baseScrollerView.showsVerticalScrollIndicator = NO;
        [self addSubview:_baseScrollerView];
        [_baseScrollerView bringSubviewToFront:self.upLineView];
    }
    return _baseScrollerView;
}

- (UIView *)upLineView{
    if (!_upLineView) {
        _upLineView = [[UIView alloc] init];
        [self.baseScrollerView addSubview:_upLineView];
        [self.baseScrollerView bringSubviewToFront:_upLineView];
        if (_upLineColor) {
            _upLineView.backgroundColor = _upLineColor;
        }else{
            _upLineView.backgroundColor = NAVEGATION_COLOR;//RGB(0, 0, 0, 0);//下划线不让它显示
        }
    }
    return _upLineView;
}

- (NSMutableArray *)titleLengthArray{
    if (!_titleLengthArray) {
        self.titleLengthArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _titleLengthArray;
}

- (NSMutableArray *)titleTextLengthArray{
    if (!_titleTextLengthArray) {
        self.titleTextLengthArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _titleTextLengthArray;
}

- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height - 0.5, self.bounds.size.width, 0.5)];
        _lineView.backgroundColor = FENGEXIAN_COLOR;
        if (_lineColor) {
            _lineView.backgroundColor = _lineColor;
        }
        [self addSubview:_lineView];
    }
    return self;
}

- (void)setLineColor:(UIColor *)lineColor{
    if (lineColor) {
        _lineColor = lineColor;
        if (_lineView) {
            _lineView.backgroundColor = lineColor;
        }
    }
}

- (void)setUpLineColor:(UIColor *)upLineColor{
    if (upLineColor) {
        _upLineColor = upLineColor;
        self.upLineView.backgroundColor = upLineColor;
    }
}

- (void)setTitleFont:(UIFont *)titleFont{
    if (titleFont) {
        _titleFont = titleFont;
        if (_titleArray) {
            [self createScrollerView];
        }
    }
}

- (void)setIsHaveBorder:(BOOL)isHaveBorder{
    _isHaveBorder = isHaveBorder;
    _upLineView.hidden = isHaveBorder;
    if (_titleArray) {
        [self createScrollerView];
    }
}

//- (void)setIsHaveFenGeLine:(BOOL)isHaveFenGeLine{
//    if (isHaveFenGeLine) {
//        _isHaveFenGeLine = isHaveFenGeLine;
//    }else{
//        _isHaveFenGeLine = YES;
//    }
//}

- (void)setTitleColor:(UIColor *)titleColor{
    if (titleColor) {
        _titleColor = titleColor;
        if (_titleArray) {
            for (UIButton *btn in [self.baseScrollerView subviews]) {
                if (btn.tag != _scrollerIndex  && [btn isKindOfClass:[UIButton class]]) {
                    [btn setTitleColor:titleColor forState:UIControlStateNormal];
                }
            }
        }
    }
}

- (void)setSelectBgColor:(UIColor *)selectBgColor{
    if (selectBgColor) {
        _selectBgColor = selectBgColor;
        for (UIButton *btn in [self.baseScrollerView subviews]) {
            if ([btn isKindOfClass:[UIButton class]]) {
                btn.backgroundColor = _normalBgColor;
                if (btn.tag == _scrollerIndex) {
                    btn.backgroundColor = _selectBgColor;
                }
            }
        }
    }
}

- (void)setNormalBgColor:(UIColor *)normalBgColor{
    if (normalBgColor) {
        _normalBgColor = normalBgColor;
        for (UIButton *btn in [self.baseScrollerView subviews]) {
            if ([btn isKindOfClass:[UIButton class]]) {
                btn.backgroundColor = _normalBgColor;
                if (btn.tag == _scrollerIndex) {
                    btn.backgroundColor = _selectBgColor;
                }
            }
        }
    }
}

- (void)setSelectTitleColor:(UIColor *)selectTitleColor{
    if (selectTitleColor) {
        _selectTitleColor = selectTitleColor;
        for (UIButton *btn in [self.baseScrollerView subviews]) {
            if (btn.tag == _scrollerIndex && [btn isKindOfClass:[UIButton class]]) {
                [btn setTitleColor:selectTitleColor forState:UIControlStateNormal];
            }
        }
    }
}

- (void)setTitleArray:(NSMutableArray *)titleArray{
    if (titleArray) {
        _titleArray = titleArray;
        _scrollerIndex = 0;
        [self createScrollerView];
    }
}

- (void)createScrollerView{
    if (_titleArray) {
        int i = 0;
        [self.titleLengthArray removeAllObjects];
        for (UIView *view in [self.baseScrollerView subviews]) {
            if (view != self.upLineView) {
                [view removeFromSuperview];
            }
        }
        for (id object in _titleArray) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag = i + 10000;
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            btn.titleLabel.font = _titleFont;
            btn.backgroundColor = _normalBgColor;
            [btn setTitleColor:_titleColor forState:UIControlStateNormal];
            if (_isHaveBorder) {
                btn.layer.borderColor = [UIColor clearColor].CGColor;
                btn.layer.borderWidth = 0.5;
                btn.layer.cornerRadius = 15.0;
                btn.layer.masksToBounds = YES;
            }
            if (i == _scrollerIndex) {
                self.lastSelectButton = btn;
                btn.selected = YES;
                [btn setTitleColor:_selectTitleColor forState:UIControlStateNormal];
                if (_isHaveBorder) {
                    btn.layer.borderColor = NAVEGATION_COLOR.CGColor;
                }
                btn.backgroundColor = _selectBgColor;
            }
            NSString *title = @"";
            if ([object isKindOfClass:[NSString class]]) {
                title = object;
            }else if ([object isKindOfClass:[NSDictionary class]]){
                title = [object objectForKey:@"title"];
            }
            [btn setTitle:title forState:UIControlStateNormal];
            CGFloat width = [title boundingRectWithSize:CGSizeMake(160.0, self.bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:btn.titleLabel.font} context:nil].size.width;
            width = ceilf(width);
            [self.titleTextLengthArray addObject:[NSNumber numberWithFloat:ceilf(width)]];
            width = width + 30.0;//加上按钮之间的间距
            if ([object isKindOfClass:[NSDictionary class]]) {
                NSString *titleType = [object objectForKey:@"title_type"];
                NSString *titleImage = [object objectForKey:@"title_image"];
                NSString *selectImage = [object objectForKey:@"title_image_selected"];
                if ([titleType isEqualToString:@"2"]) {
                    if (titleImage) {
                        [btn sd_setImageWithURL:[NSURL URLWithString:titleImage] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
                    }
                    if (selectImage) {
                        [btn sd_setImageWithURL:[NSURL URLWithString:selectImage] forState:UIControlStateSelected placeholderImage:[UIImage imageNamed:@""]];
                    }
                }
            }
            NSNumber *number =  [NSNumber numberWithFloat:width];
            [self.titleLengthArray addObject:number];
            
            CGFloat startX = 0;
            if (_isHaveBorder) {
                startX = 10.0;
            }
            for (int j = 0; j < i ; j++) {
                if (_isHaveBorder) {
                    startX = startX + [[self.titleLengthArray objectAtIndex:j] floatValue] + 10.0;
                }else{
                    startX = startX + [[self.titleLengthArray objectAtIndex:j] floatValue];
                }
            }
            if (_isHaveBorder) {
                //btn.frame = CGRectMake(startX, 7.0, width, self.bounds.size.height-14.0);
                btn.frame = CGRectMake(startX, 0.0, width, self.bounds.size.height);
            }else{
                btn.frame = CGRectMake(startX, 0, width, self.bounds.size.height-1);
            }
            
            [self.baseScrollerView addSubview:btn];
            
            //中间分割线
            if(i > 0){
                UIView *fengeLineView = [[UIView alloc] initWithFrame:CGRectMake(startX, (self.bounds.size.height-20)/2, 0.5, 20)];
                fengeLineView.backgroundColor = RGB(233, 236, 243);
                fengeLineView.hidden = self.isHaveFenGeLine;
                [self.baseScrollerView addSubview:fengeLineView];
            }
            i++;
        }
        
        UIButton *sender = (UIButton *)[_baseScrollerView viewWithTag:_scrollerIndex + 10000];
        _upLineView.frame = CGRectMake(sender.bounds.size.width / 2.0 - [[_titleTextLengthArray objectAtIndex:0] floatValue] / 2.0 + sender.frame.origin.x-10, self.bounds.size.height - 2.0, [[_titleTextLengthArray objectAtIndex:0] floatValue]+20, 2.0);
        
        CGFloat totleWidth = 0;
        for (NSNumber *number in self.titleLengthArray) {
            if (_isHaveBorder) {
                totleWidth = totleWidth + [number floatValue] + 10.0;
            }else{
                totleWidth = totleWidth + [number floatValue];
            }
            
        }
        if (_isHaveBorder) {
            totleWidth += 10;
        }
        _baseScrollerView.contentSize = CGSizeMake(totleWidth, self.bounds.size.height);
        [self.baseScrollerView scrollRectToVisible:CGRectMake(0, 0, self.baseScrollerView.bounds.size.width, self.baseScrollerView.bounds.size.height) animated:NO];
    }
    [self bringSubviewToFront:self.lineView];
    [self bringSubviewToFront:self.baseScrollerView];
}

- (void)btnClicked:(UIButton *)sender{
    if (sender == _lastSelectButton) {
        return;
    }
    if (!_isTitleCanClick) {
        return;
    }
    [_lastSelectButton setTitleColor:_titleColor forState:UIControlStateNormal];
    _lastSelectButton.backgroundColor = _normalBgColor;
    _lastSelectButton.selected = NO;
    [sender setTitleColor:_selectTitleColor forState:UIControlStateNormal];
    sender.backgroundColor = _selectBgColor;
    if (_isHaveBorder) {
        self.lastSelectButton.layer.borderColor = [UIColor clearColor].CGColor;
        sender.layer.borderColor = NAVEGATION_COLOR.CGColor;
    }
    self.lastSelectButton = sender;
    sender.selected = YES;
    _scrollerIndex = sender.tag;
    NSInteger scrollerIndex = (long)(sender.tag - 1 - 10000);
    CGFloat scroX = 0;
    for (int j = 0; j < scrollerIndex; j++) {
        NSNumber *number = _titleLengthArray[j];
        if (_isHaveBorder) {
            scroX = scroX + [number floatValue] + 10;
        }else{
            scroX = scroX + [number floatValue];
        }
    }
    if (_isHaveBorder) {
        scroX += 10;
    }
    if (sender.tag == 10000) {
        //scroX -= 10;
        scroX = 0;//后期更改
    }
    [self.baseScrollerView scrollRectToVisible:CGRectMake(scroX, 0, self.baseScrollerView.bounds.size.width, self.baseScrollerView.bounds.size.height) animated:YES];
    
    [UIView animateWithDuration:0.2 animations:^{
        _upLineView.frame = CGRectMake(sender.bounds.size.width / 2.0 - [[_titleTextLengthArray objectAtIndex:sender.tag - 10000] floatValue] / 2.0 + sender.frame.origin.x-10, self.bounds.size.height - 2.0, [[_titleTextLengthArray objectAtIndex:sender.tag - 10000] floatValue]+20, 2.0);
    }];
    if ([self.delegate respondsToSelector:@selector(lsg_baseTitleScrollerView:scrollerToIndex:)]) {
        [self.delegate lsg_baseTitleScrollerView:self scrollerToIndex:sender.tag - 10000];
    }
}

- (void)titleScrollerViewScrollerToIndex:(NSInteger)index{
    if (_titleLengthArray) {
        if (index < _titleLengthArray.count) {
            _scrollerIndex = index;
            CGFloat scroX = 0;
            for (int j = 0; j < index - 1; j++) {
                NSNumber *number = _titleLengthArray[j];
                scroX = scroX + [number floatValue];
                if (_isHaveBorder) {
                    scroX += 10;
                }
            }
            if (_isHaveBorder) {
                scroX += 10;
            }
            if (index == 0) {
                scroX -= 10;
            }
            [self.baseScrollerView scrollRectToVisible:CGRectMake(scroX, 0, self.baseScrollerView.bounds.size.width, self.baseScrollerView.bounds.size.height) animated:YES];
            
            UIButton *btn = (UIButton *)[self.baseScrollerView viewWithTag:index + 10000];
            if (btn) {
                if (_isHaveBorder) {
                    self.lastSelectButton.layer.borderColor = [UIColor clearColor].CGColor;
                    btn.layer.borderColor = NAVEGATION_COLOR.CGColor;
                }
                _lastSelectButton.backgroundColor = _normalBgColor;
                _lastSelectButton.selected = NO;
                [_lastSelectButton setTitleColor:_titleColor forState:UIControlStateNormal];
                [btn setTitleColor:_selectTitleColor forState:UIControlStateNormal];
                btn.backgroundColor = _selectBgColor;
                btn.selected = YES;
                [UIView animateWithDuration:0.2 animations:^{
                    _upLineView.frame = CGRectMake(btn.bounds.size.width / 2.0 - [[_titleTextLengthArray objectAtIndex:btn.tag - 10000] floatValue] / 2.0 + btn.frame.origin.x-10, self.bounds.size.height - 2.0, [[_titleTextLengthArray objectAtIndex:btn.tag - 10000] floatValue]+20, 2.0);
                }];
                self.lastSelectButton = btn;
            }
            /*
             for (UIButton *btn in [self.baseScrollerView subviews]) {
             if ([btn isKindOfClass:[UIButton class]] && btn.tag == _scrollerIndex) {
             if (_titleColor) {
             [_lastSelectButton setTitleColor:_titleColor forState:UIControlStateNormal];
             }else{
             [_lastSelectButton setTitleColor:COMMON_C0 forState:UIControlStateNormal];
             }
             if (_selectTitleColor) {
             [btn setTitleColor:_selectTitleColor forState:UIControlStateNormal];
             }else{
             [btn setTitleColor:WENZIHUANG forState:UIControlStateNormal];
             }
             [UIView animateWithDuration:0.2 animations:^{
             self.upLineView.frame = CGRectMake(btn.frame.origin.x, self.upLineView.frame.origin.y, btn.bounds.size.width, 2.0);
             }];
             self.lastSelectButton = btn;
             break;
             }
             }
             */
        }
    }
}

@end
