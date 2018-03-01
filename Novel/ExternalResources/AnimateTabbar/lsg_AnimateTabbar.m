//
//  lsg_AnimateTabbar.h
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_AnimateTabbar.h"

@implementation lsg_AnimateTabbarView

@synthesize oneBtn, twoBtn, threeBtn, fourBtn, delegate;//, fiveBtn

enum barsize{
//    TAB_HEIGHT = TAB_HEIGHT,
//    other_offtop = 1,
//    img_height = 50,
//    img_width = 50,
    tab_num = 4,//tab个数
//    img_y = 0
};

- (id)initWithFrame:(CGRect)frame {
    CGRect frame1 = CGRectMake(frame.origin.x, frame.size.height - TAB_HEIGHT, frame.size.width, TAB_HEIGHT);
    
    self = [super initWithFrame:frame1];
    if (self) {
        [self setup];
        
        UILabel *tabLabel;
        //首页
        oneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [oneBtn setImage:[UIImage imageNamed:@"novel_homepage_b"] forState:UIControlStateSelected];
        [oneBtn setImage:[UIImage imageNamed:@"novel_homepage"] forState:UIControlStateNormal];
        oneBtn.imageEdgeInsets = UIEdgeInsetsMake(-5.0-IPHONE_X/2, ((DEVICE_WIDTH/4)-50)/2, 5.0+IPHONE_X/2, ((DEVICE_WIDTH/4)-50)/2);
//        oneBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
        [oneBtn setFrame:CGRectMake(0, 0.5, DEVICE_WIDTH/tab_num, TAB_HEIGHT - 0.5)];
        [oneBtn setTag:1];
        [oneBtn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        oneBtn.selected = YES;
        
        tabLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, TAB_HEIGHT-15-IPHONE_X, DEVICE_WIDTH/4, 10)];
        tabLabel.font = COMMON_F9;
        tabLabel.text = @"首页";
        tabLabel.textAlignment = NSTextAlignmentCenter;
        tabLabel.textColor = NAVEGATION_COLOR;
        [oneBtn addSubview:tabLabel];
        
        //书架
        twoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [twoBtn setImage:[UIImage imageNamed:@"novel_bookshelf_b"] forState:UIControlStateSelected];
        [twoBtn setImage:[UIImage imageNamed:@"novel_bookshelf"] forState:UIControlStateNormal];
        twoBtn.imageEdgeInsets = UIEdgeInsetsMake(-5.0-IPHONE_X/2, ((DEVICE_WIDTH/4)-50)/2, 5.0+IPHONE_X/2, ((DEVICE_WIDTH/4)-50)/2);
        [twoBtn setFrame:CGRectMake(frame.size.width/tab_num, 0.5, frame.size.width/tab_num, TAB_HEIGHT-0.5)];
        [twoBtn setTag:2];
        [twoBtn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        tabLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, TAB_HEIGHT-15-IPHONE_X, DEVICE_WIDTH/4, 10)];
        tabLabel.font = COMMON_F9;
        tabLabel.text = @"书架";
        tabLabel.textAlignment = NSTextAlignmentCenter;
        tabLabel.textColor = RGB(118, 126, 135);
        [twoBtn addSubview:tabLabel];
        
        //分类
        threeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [threeBtn setImage:[UIImage imageNamed:@"novel_classifi_b"] forState:UIControlStateSelected];
        [threeBtn setImage:[UIImage imageNamed:@"novel_classifi"] forState:UIControlStateNormal];
        threeBtn.imageEdgeInsets = UIEdgeInsetsMake(-5.0-IPHONE_X/2, ((DEVICE_WIDTH/4)-50)/2, 5.0+IPHONE_X/2, ((DEVICE_WIDTH/4)-50)/2);
        [threeBtn setFrame:CGRectMake(frame.size.width/tab_num*2, 0.5, frame.size.width/tab_num, TAB_HEIGHT - 0.5)];
        [threeBtn setTag:3];
        [threeBtn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        tabLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, TAB_HEIGHT-15-IPHONE_X, DEVICE_WIDTH/4, 10)];
        tabLabel.font = COMMON_F9;
        tabLabel.text = @"分类";
        tabLabel.textAlignment = NSTextAlignmentCenter;
        tabLabel.textColor = RGB(118, 126, 135);
        [threeBtn addSubview:tabLabel];
        
        //账户
        fourBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [fourBtn setImage:[UIImage imageNamed:@"novel_account_b"] forState:UIControlStateSelected];
        [fourBtn setImage:[UIImage imageNamed:@"novel_account"] forState:UIControlStateNormal];
        fourBtn.imageEdgeInsets = UIEdgeInsetsMake(-5.0-IPHONE_X/2, ((DEVICE_WIDTH/4)-50)/2, 5.0+IPHONE_X/2, ((DEVICE_WIDTH/4)-50)/2);
        [fourBtn setFrame:CGRectMake(frame.size.width/tab_num*3, 0.5, frame.size.width/tab_num, TAB_HEIGHT-0.5)];
        [fourBtn setTag:4];
        [fourBtn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        tabLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, TAB_HEIGHT-15-IPHONE_X, DEVICE_WIDTH/4, 10)];
        tabLabel.font = COMMON_F9;
        tabLabel.text = @"账户";
        tabLabel.textAlignment = NSTextAlignmentCenter;
        tabLabel.textColor = RGB(118, 126, 135);
        [fourBtn addSubview:tabLabel];
        
        //去遮住那黑色的线条
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, -0.5, DEVICE_WIDTH, 1)];//分割线
        line1.backgroundColor = COMMON_C255;
        [self addSubview:line1];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, -0.5, DEVICE_WIDTH, 1)];//分割线
        line.backgroundColor = FENGEXIAN_COLOR;
        [self addSubview:line];
        
        oneBtn.backgroundColor = COMMON_C255;
        twoBtn.backgroundColor = COMMON_C255;
        threeBtn.backgroundColor = COMMON_C255;
        fourBtn.backgroundColor = COMMON_C255;
        
        [self addSubview:oneBtn];
        [self addSubview:twoBtn];
        [self addSubview:threeBtn];
        [self addSubview:fourBtn];
    }
    return self;
}

- (void)setup {
    [self setToolbar:[[UIToolbar alloc] initWithFrame:[self bounds]]];
    [self setBlurLayer:[[self toolbar] layer]];
    
    UIView *blurView = [UIView new];
    [blurView setUserInteractionEnabled:NO];
    [blurView.layer addSublayer:[self blurLayer]];
    [blurView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [blurView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [self insertSubview:blurView atIndex:0];
    
    if (self.superview) {
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[blurView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(blurView)]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[blurView]-(0)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(blurView)]];
    }
    
    [self setBackgroundColor:[UIColor clearColor]];
}

- (void)setBlurTintColor:(UIColor *)blurTintColor {
    [self.toolbar setBarTintColor:blurTintColor];
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self.blurLayer setFrame:[self bounds]];
}

- (void)callButtonAction:(UIButton *)sender{
    long value = sender.tag;
    if (value == 1) {
        [self.delegate oneBtnClick];
    }
    if (value == 2) {
        [self.delegate twoBtnClick];
    }
    if (value == 3) {
        [self.delegate threeBtnClick];
    }
    if (value == 4) {
        [self.delegate fourBtnClick];
    }
}

long g_selectedTag = 1;
- (void)buttonClickAction:(id)sender{
    UIButton *btn = (UIButton *)sender;
    if(g_selectedTag == btn.tag){
        if(btn.tag == 1){
            //[[NSNotificationCenter defaultCenter] postNotificationName:@"NewTabSecondClicked" object:nil];//刷新列表
//            [[NSNotificationCenter defaultCenter] postNotificationName:[[NSUserDefaults standardUserDefaults] objectForKey:@"NEW_NOTIFICATION"] object:nil];//刷新列表
        }else if(btn.tag == 3){
            //[[NSNotificationCenter defaultCenter] postNotificationName:@"VideoTabSecondClicked" object:nil];//刷新列表
//            [[NSNotificationCenter defaultCenter] postNotificationName:[[NSUserDefaults standardUserDefaults] objectForKey:@"VIDEO_NOTIFICATION"] object:nil];//刷新列表
        }
        return;
    }else
        g_selectedTag = btn.tag;
    
    if (oneBtn.tag != btn.tag) {
        oneBtn.selected = NO;
        ((UILabel *)oneBtn.subviews[1]).textColor = RGB(118, 126, 135);
    }
    
    if (twoBtn.tag != btn.tag) {
        twoBtn.selected = NO;
        ((UILabel *)twoBtn.subviews[1]).textColor = RGB(118, 126, 135);
    }
    
    if (threeBtn.tag != btn.tag) {
        threeBtn.selected = NO;
        ((UILabel *)threeBtn.subviews[1]).textColor = RGB(118, 126, 135);
    }
    
    if (fourBtn.tag != btn.tag) {
        fourBtn.selected = NO;
        ((UILabel *)fourBtn.subviews[1]).textColor = RGB(118, 126, 135);
    }
    
    //[self imgAnimate:btn];//tab点击动画
    ((UIButton *)btn).selected = YES;
    ((UILabel *)btn.subviews[1]).textColor = NAVEGATION_COLOR;
    
    [self callButtonAction:btn];
    
    return;
}

- (void)imgAnimate:(UIButton*)btn{
    
    UIView *view = btn.subviews[0];
    UIView *viewLabel = btn.subviews[1];
    
    [UIView animateWithDuration:0.1 animations:
     ^(void){
         view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
         viewLabel.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
     } completion:^(BOOL finished){//do other thing
         [UIView animateWithDuration:0.2 animations:
          ^(void){
              view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
              viewLabel.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
          } completion:^(BOOL finished){//do other thing
              [UIView animateWithDuration:0.1 animations:
               ^(void){
                   view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                   viewLabel.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
               } completion:^(BOOL finished){//do other thing
               }];
          }];
     }];
}

@end
