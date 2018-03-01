//
//  lsg_BaseViewController.m
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_BaseViewController.h"

@interface lsg_BaseViewController ()

@end

@implementation lsg_BaseViewController

- (UIView *)lsg_navigationView{
    if (!_lsg_navigationView) {
        _lsg_navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, NAV_HEIGHT)];
        _lsg_navigationView.backgroundColor = NAVEGATION_COLOR;
        _lsg_navigationView.userInteractionEnabled = YES;
    }
    return _lsg_navigationView;
}

- (UILabel *)lsg_navTitleLabel{
    if(!_lsg_navTitleLabel){
        int navW = DEVICE_WIDTH/375*180;
        _lsg_navTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake((DEVICE_WIDTH-navW)/2, 20+IPHONE_X+(50-20)/2, navW, 20)];
        _lsg_navTitleLabel.font = COMMON_F19;
        _lsg_navTitleLabel.textColor = COMMON_C255;
        _lsg_navTitleLabel.textAlignment = NSTextAlignmentCenter;
        _lsg_navTitleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;//中间文字...显示
    }
    return _lsg_navTitleLabel;
}

- (UIButton *)lsg_goBackButton{
    if(!_lsg_goBackButton){
        _lsg_goBackButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 20+IPHONE_X, 49, 49)];
        //_lsg_goBackButton.backgroundColor = [UIColor redColor];
        _lsg_goBackButton.imageEdgeInsets = UIEdgeInsetsMake(16.25, 15, 16.25, 26);
        [_lsg_goBackButton setImage:[UIImage imageNamed:@"novel_goback"] forState:UIControlStateNormal];
        [_lsg_goBackButton addTarget:self action:@selector(lsg_goBackBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _lsg_goBackButton;
}

- (UIButton *)lsg_editButton{
    if(!_lsg_editButton){
        _lsg_editButton = [[UIButton alloc] initWithFrame:CGRectMake(DEVICE_WIDTH-40-15, 20+5+IPHONE_X, 40, 40)];
        _lsg_editButton.titleLabel.font = COMMON_F16;
        [_lsg_editButton setTitleColor:COMMON_C255 forState:UIControlStateNormal];
        [_lsg_editButton addTarget:self action:@selector(lsg_editBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_lsg_editButton setTitle:@"编辑" forState:UIControlStateNormal];
        [_lsg_editButton setTitle:@"完成" forState:UIControlStateSelected];
        _lsg_editButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    return _lsg_editButton;
}

- (UIButton *)lsg_searchButton{
    if(!_lsg_searchButton){
        _lsg_searchButton = [[UIButton alloc] initWithFrame:CGRectMake(DEVICE_WIDTH-15-18-15, 20+IPHONE_X, 15+18+15, 44)];
        [_lsg_searchButton addTarget:self action:@selector(lsg_searchBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        //_searchButton.backgroundColor = COMMON_C242;
        //[self.navigationView addSubview:_searchButton];
        
        UIImageView *lsg_searchImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, (44-18)/2, 18, 18)];
        lsg_searchImage.image = [UIImage imageNamed:@"novel_classifi_search"];
        [_lsg_searchButton addSubview:lsg_searchImage];
    }
    return _lsg_searchButton;
}

- (UIView *)lsg_navlLineView {
    if (!_lsg_navlLineView) {
        _lsg_navlLineView = [[UIView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT - 0.5, DEVICE_WIDTH, 0.5)];
        _lsg_navlLineView.backgroundColor = FENGEXIAN_COLOR;
        //[self.lsg_navigationView addSubview:_lsg_navlLineView];
    }
    return _lsg_navlLineView;
}

- (void)lsg_goBackBtnClick:(UIButton *)sender{
    if ([self.baseViewDelegate respondsToSelector:@selector(lsg_goBackBtnClick:)]) {
        [self.baseViewDelegate lsg_goBackBtnClick:sender];
    }
}

- (void)lsg_editBtnClick:(UIButton *)sender{
    if ([self.baseViewDelegate respondsToSelector:@selector(lsg_editBtnClick:)]) {
        [self.baseViewDelegate lsg_editBtnClick:sender];
    }
}

- (void)lsg_searchBtnClick:(UIButton *)sender{
    if ([self.baseViewDelegate respondsToSelector:@selector(lsg_searchBtnClick:)]) {
        [self.baseViewDelegate lsg_searchBtnClick:sender];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.interactivePopGestureRecognizer.delegate = self;//手势返回
    [self.lsg_navigationView addSubview:_lsg_navlLineView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
