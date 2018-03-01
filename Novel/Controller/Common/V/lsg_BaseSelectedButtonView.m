//
//  lsg_BaseSelectedButtonView.m
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_BaseSelectedButtonView.h"
@interface lsg_BaseSelectedButtonView()<UIScrollViewDelegate>{
    float jiangeWidth;//间隔
}

@end

@implementation lsg_BaseSelectedButtonView
- (instancetype)init{
    self = [super init];
    if (self) {
    
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
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
        _baseScrollerView = [[UIScrollView alloc]init];
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
        _upLineView = [[UIView alloc]init];
        [self.baseScrollerView addSubview:_upLineView];
        [self.baseScrollerView bringSubviewToFront:_upLineView];
        if (_upLineColor) {
            _upLineView.backgroundColor = _upLineColor;
        }else{
            //_upLineView.backgroundColor = WENZIHUANG;
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
    return _lineView;
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
- (void)setHidLineView:(BOOL)hidLineView {
    if (hidLineView) {
        self.lineView.hidden = YES;
    }else {
        self.lineView.hidden = NO;
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
        
        //----------------新加代码----------------
//        NSMutableArray *strAry = [[NSMutableArray alloc] init];//存储每个item的宽
//        if(_ifJF){
//            float allWidth = 0.0;//存储所有的item的宽
//            float strWidth = self.baseScrollerView.bounds.size.width / _titleArray.count;
//            for(NSString *title in _titleArray){
//                CGFloat width = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, self.bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:COMMON_F15} context:nil].size.width;
//                width = ceilf(width);
//                if(width <= strWidth){
//                    [strAry addObject:[NSString stringWithFormat:@"%.2lf", (float)width]];
//                    allWidth = allWidth + (float)width;
//                }else{
//                    [strAry addObject:[NSString stringWithFormat:@"%.2lf", (float)strWidth]];
//                    allWidth = allWidth + (float)strWidth;
//                }
//            }
//            jiangeWidth = (self.baseScrollerView.bounds.size.width-allWidth) / ((_titleArray.count+1)*2);//间隔
//        }
        //----------------新加代码----------------
        
        //CGFloat startX = 0;
        for (NSString *title in _titleArray) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag = i + 10000;
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            if (_titleFont) {
                btn.titleLabel.font = _titleFont;
            }else{
                btn.titleLabel.font = COMMON_F15;
            }
            if(_normalColor){
               [btn setTitleColor:_normalColor forState:UIControlStateNormal];
            }else{
               [btn setTitleColor:COMMON_C198 forState:UIControlStateNormal];
            }
            
            if (i == _scrollerIndex) {
                self.lastSelectButton = btn;
            }
            if (i == _scrollerIndex) {
                self.lastSelectButton = btn;
                [btn setTitleColor:NAVEGATION_COLOR forState:UIControlStateNormal];
                UITapGestureRecognizer *tapCgrTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTwoTap:)];
                tapCgrTwo.numberOfTapsRequired = 2;
                [btn addGestureRecognizer:tapCgrTwo];
            }
            [btn setTitle:title forState:UIControlStateNormal];
            
            CGFloat width = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, self.bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:btn.titleLabel.font} context:nil].size.width;
            width = ceilf(width);
            [self.titleTextLengthArray addObject:[NSNumber numberWithFloat:ceilf(width)]];
            width = width + 20.0;
            NSNumber *number = [NSNumber numberWithFloat:width];
            [self.titleLengthArray addObject:number];
            
//            if(_ifJF){
//                if(i == _titleArray.count-1){//最后一个
//                    btn.frame = CGRectMake(startX, 0, (jiangeWidth*4)+[strAry[i] floatValue], self.bounds.size.height);
//                    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//                }else{
//                    btn.frame = CGRectMake(startX, 0, (jiangeWidth*2)+[strAry[i] floatValue], self.bounds.size.height);
//                    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
//                }
//                startX = startX + (jiangeWidth*2) + [strAry[i] floatValue];
//                //btn.backgroundColor = RGB(i*50, i*50, i*50);
//            }else{
                CGFloat startX = 0;
                startX = startX + self.baseScrollerView.bounds.size.width / _titleArray.count * i;
                btn.frame = CGRectMake(startX, 0, self.baseScrollerView.bounds.size.width / _titleArray.count, self.bounds.size.height);//均分显示——征对字数一样的情况（旧代码）
//            }
            
            [self.baseScrollerView addSubview:btn];
            i++;
        }
        
        UIButton *sender = (UIButton *)[_baseScrollerView viewWithTag:_scrollerIndex + 10000];
        if(_ifJF){
           _upLineView.frame = CGRectMake(sender.bounds.size.width / 2.0 - [[_titleTextLengthArray objectAtIndex:0] floatValue] / 2.0 + sender.frame.origin.x - 13.0+(jiangeWidth*2)-10, self.bounds.size.height - 2.0, [[_titleTextLengthArray objectAtIndex:0] floatValue] + 26.0-(jiangeWidth*2)+20, 2.0);//改动 x：+(jiangeWidth*2)-10 y：-(jiangeWidth*2)+20
        }else{
           _upLineView.frame = CGRectMake(sender.bounds.size.width / 2.0 - [[_titleTextLengthArray objectAtIndex:0] floatValue] / 2.0 + sender.frame.origin.x, self.bounds.size.height - 4.0, [[_titleTextLengthArray objectAtIndex:0] floatValue], 2.5);//改动 x：+(jiangeWidth*2)-10 y：-(jiangeWidth*2)+20 - 13.0 + 26.0
            
            [lsg_HandleUtil lsg_handleRadius:_upLineView];//设置圆角
        }
        
        _baseScrollerView.contentSize = CGSizeMake(_scrollWidth, self.bounds.size.height);
        [self.baseScrollerView scrollRectToVisible:CGRectMake(0, 0, self.baseScrollerView.bounds.size.width, self.baseScrollerView.bounds.size.height) animated:NO];
    }
    [self bringSubviewToFront:self.lineView];
    [self bringSubviewToFront:self.baseScrollerView];
}

- (void)btnClicked:(UIButton *)sender{
    if (sender == _lastSelectButton) {
        return;
    }
    if ([_lastSelectButton.gestureRecognizers lastObject]) {
        [_lastSelectButton removeGestureRecognizer:[_lastSelectButton.gestureRecognizers lastObject]];
    }
    if(_normalColor){
        [_lastSelectButton setTitleColor:_normalColor forState:UIControlStateNormal];
    }else{
        [_lastSelectButton setTitleColor:COMMON_C198 forState:UIControlStateNormal];
    }
    //[_lastSelectButton setTitleColor:COMMON_C198 forState:UIControlStateNormal];
    [sender setTitleColor:NAVEGATION_COLOR forState:UIControlStateNormal];
    UITapGestureRecognizer *tapCgrTwo =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTwoTap:)];
    tapCgrTwo.numberOfTapsRequired = 2;
    [sender addGestureRecognizer:tapCgrTwo];
    self.lastSelectButton = sender;
    _scrollerIndex = sender.tag;
    [UIView animateWithDuration:0.2 animations:^{
        if(sender.tag - 10000 != _titleArray.count-1){
//            if(_ifJF){
//                _upLineView.frame = CGRectMake(sender.bounds.size.width / 2.0 - [[_titleTextLengthArray objectAtIndex:sender.tag - 10000] floatValue] / 2.0 + sender.frame.origin.x - 13.0+(jiangeWidth*2)-10, self.bounds.size.height - 2.0, [[_titleTextLengthArray objectAtIndex:sender.tag - 10000] floatValue] + 26.0-(jiangeWidth*2)+20, 2.0);//新加
//            }else
                _upLineView.frame = CGRectMake(sender.bounds.size.width / 2.0 - [[_titleTextLengthArray objectAtIndex:sender.tag - 10000] floatValue] / 2.0 + sender.frame.origin.x, self.bounds.size.height - 4.0, [[_titleTextLengthArray objectAtIndex:sender.tag - 10000] floatValue], 2.5);//原代码 - 13.0+5  + 26.0-10
                [lsg_HandleUtil lsg_handleRadius:_upLineView];//设置圆角
            
        }else
            _upLineView.frame = CGRectMake(sender.bounds.size.width / 2.0 - [[_titleTextLengthArray objectAtIndex:sender.tag - 10000] floatValue] / 2.0 + sender.frame.origin.x, self.bounds.size.height - 4.0, [[_titleTextLengthArray objectAtIndex:sender.tag - 10000] floatValue], 2.5);//原代码 - 13.0+5  + 26.0-10
            [lsg_HandleUtil lsg_handleRadius:_upLineView];//设置圆角
    }];
    if ([self.delegate respondsToSelector:@selector(lsg_baseTitleScrollerView:scrollerToIndex:)]) {
        [self.delegate lsg_baseTitleScrollerView:self scrollerToIndex:sender.tag - 10000];
    }
}
- (void)handleTwoTap:(UITapGestureRecognizer *)sender {
    if ([self.delegate respondsToSelector:@selector(lsg_baseTitleScrollerView:reloadToIndex:)]) {
        [self.delegate lsg_baseTitleScrollerView:self reloadToIndex:sender.view.tag - 10000];
    }
}
- (void)titleScrollerViewScrollerToIndex:(NSInteger)index{
    if (_titleLengthArray) {
        if (index < _titleLengthArray.count) {
            _scrollerIndex = index;
            UIButton *btn = (UIButton *)[self.baseScrollerView viewWithTag:index + 10000];
            if(_normalColor){
                [_lastSelectButton setTitleColor:_normalColor forState:UIControlStateNormal];
            }else{
                [_lastSelectButton setTitleColor:COMMON_C198 forState:UIControlStateNormal];
            }
            //[_lastSelectButton setTitleColor:COMMON_C198 forState:UIControlStateNormal];
            [btn setTitleColor:NAVEGATION_COLOR forState:UIControlStateNormal];
            [UIView animateWithDuration:0.2 animations:^{
                if(btn.tag - 10000 != _titleArray.count-1){
//                    if(_ifJF){
//                        _upLineView.frame = CGRectMake(btn.bounds.size.width / 2.0 - [[_titleTextLengthArray objectAtIndex:btn.tag - 10000] floatValue] / 2.0 + btn.frame.origin.x - 13.0+(jiangeWidth*2)-10, self.bounds.size.height - 2.0, [[_titleTextLengthArray objectAtIndex:btn.tag - 10000] floatValue] + 26.0-(jiangeWidth*2)+20, 2.0);//新加
//                    }else
                        _upLineView.frame = CGRectMake(btn.bounds.size.width / 2.0 - [[_titleTextLengthArray objectAtIndex:btn.tag - 10000] floatValue] / 2.0 + btn.frame.origin.x, self.bounds.size.height - 4.0, [[_titleTextLengthArray objectAtIndex:btn.tag - 10000] floatValue], 2.5);//原代码 - 13.0+5  + 26.0-10
                        [lsg_HandleUtil lsg_handleRadius:_upLineView];//设置圆角
                    
                }else
                    _upLineView.frame = CGRectMake(btn.bounds.size.width / 2.0 - [[_titleTextLengthArray objectAtIndex:btn.tag - 10000] floatValue] / 2.0 + btn.frame.origin.x, self.bounds.size.height - 4.0, [[_titleTextLengthArray objectAtIndex:btn.tag - 10000] floatValue], 2.5);//原代码 - 13.0+5  + 26.0-10
                    [lsg_HandleUtil lsg_handleRadius:_upLineView];//设置圆角
            }];
            if ([_lastSelectButton.gestureRecognizers lastObject]) {
                [_lastSelectButton removeGestureRecognizer:[_lastSelectButton.gestureRecognizers lastObject]];
            }
            UITapGestureRecognizer *tapCgrTwo =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTwoTap:)];
            tapCgrTwo.numberOfTapsRequired = 2;
            [btn addGestureRecognizer:tapCgrTwo];
            self.lastSelectButton = btn;
        }
    }
}

@end
