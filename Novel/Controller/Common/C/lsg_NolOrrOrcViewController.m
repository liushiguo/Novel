//
//  lsg_NolOrrOrcViewController.m
//  Novel
//
//  Created by user on 2018/2/26.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_NolOrrOrcViewController.h"

@interface lsg_NolOrrOrcViewController ()

@end

@implementation lsg_NolOrrOrcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (void)initView{
    self.view.backgroundColor = COMMON_C255;
    
    UIButton *goBackButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 30+IPHONE_X, 49, 49)];
    goBackButton.imageEdgeInsets = UIEdgeInsetsMake(16.25, 15, 16.25, 26);
    [goBackButton setImage:[UIImage imageNamed:@"novel_goback_black"] forState:UIControlStateNormal];
    [goBackButton addTarget:self action:@selector(lsg_goBackBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackButton];
    
    UIImageView *nologinImage = [[UIImageView alloc] initWithFrame:CGRectMake((DEVICE_WIDTH-375)/2, (DEVICE_HEIGHT-154)/3, 375, 154)];
    [self.view addSubview:nologinImage];
    
    UIButton *handleBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(nologinImage.frame)+DEVICE_HEIGHT/667*160, DEVICE_WIDTH-30, DEVICE_HEIGHT/667*45)];
    handleBtn.backgroundColor = NAVEGATION_COLOR;
    [handleBtn addTarget:self action:@selector(lsg_handleBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [handleBtn setTitleColor:COMMON_C255 forState:UIControlStateNormal];
    handleBtn.titleLabel.font = COMMON_F17;
    [lsg_HandleUtil lsg_handleRadius:handleBtn :45/2];
    [self.view addSubview:handleBtn];
    
    [handleBtn setTitle:@"前往看书" forState:UIControlStateNormal];
    if(self.handleType == 1){
        nologinImage.image = [UIImage imageNamed:@"novel_nologin"];
        [handleBtn setTitle:@"立即登录" forState:UIControlStateNormal];
    }else if(self.handleType == 2){
        nologinImage.image = [UIImage imageNamed:@"novel_nochognzhi"];
        
    }else if(self.handleType == 3){
        nologinImage.image = [UIImage imageNamed:@"novel_noxiaofei"];
    }
}

- (void)lsg_handleBtnClicked{
    
}

- (void)lsg_goBackBtnClick:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
