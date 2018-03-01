//
//  lsg_SettingViewController.m
//  Novel
//
//  Created by user on 2018/2/27.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_SettingViewController.h"

@interface lsg_SettingViewController ()
@property (nonatomic, strong) lsg_BaseTableView *lsg_settingTableView;
@end

@implementation lsg_SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self lsg_initNav];
    [self lsg_initView];
}

- (void)lsg_initNav {
    [self.view addSubview:self.lsg_navigationView];
    self.lsg_navTitleLabel.text = @"设置";
    [self.lsg_navigationView addSubview:self.lsg_navTitleLabel];
    [self.lsg_navigationView addSubview:self.lsg_goBackButton];
}

- (void)lsg_initView {
    self.view.backgroundColor = COMMON_C246;
    
    self.lsg_settingTableView = [[lsg_BaseTableView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT, DEVICE_WIDTH, DEVICE_HEIGHT - NAV_HEIGHT) style:UITableViewStylePlain];
    if (@available(iOS 11.0, *)) {
        _lsg_settingTableView.estimatedRowHeight = 0;
        _lsg_settingTableView.estimatedSectionHeaderHeight = 0;
        _lsg_settingTableView.estimatedSectionFooterHeight = 0;
    }
    [_lsg_settingTableView baseTableViewDelegate:self];
    _lsg_settingTableView.BaseTableViewDelegate = self;
    _lsg_settingTableView.backgroundColor = [UIColor clearColor];
    _lsg_settingTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_lsg_settingTableView];
    
    _lsg_settingTableView.tableFooterView = [self lsg_footerView];
}

- (UIView *)lsg_footerView{
    UIView *bgV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT/667*229)];
    bgV.backgroundColor = COMMON_C246;
    
    UIButton *logoutBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bgV.frame)-(DEVICE_HEIGHT/667*53), DEVICE_WIDTH, DEVICE_HEIGHT/667*53)];
    logoutBtn.backgroundColor = COMMON_C255;
    logoutBtn.layer.borderWidth = 0.5;
    logoutBtn.titleLabel.font = COMMON_F17;
    logoutBtn.layer.borderColor = FENGEXIAN_COLOR.CGColor;
    [logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [logoutBtn setTitleColor:RGB(255, 82, 82) forState:UIControlStateNormal];
    [bgV addSubview:logoutBtn];
    
    return bgV;
}

#pragma mark ------UITableViewDataSource---------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"settingCell";
    lsg_SettingTableViewCell *cell = (lsg_SettingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[lsg_SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.lsg_rightLabel.hidden = NO;
    cell.lsg_rightImage.hidden = YES;
    cell.lsg_switchBtn.hidden = YES;
    if(indexPath.row == 0){
        cell.lsg_leftLabel.text = @"清理应用缓存";
        cell.lsg_rightLabel.text = @"128M";
        cell.lsg_rightLabel.textColor = RGB(142, 142, 147);
        cell.lsg_rightLabel.font = COMMON_F13;
    }else if(indexPath.row == 1){
        cell.lsg_rightLabel.hidden = YES;
        cell.lsg_leftLabel.text = @"章节自动购买";
        cell.lsg_switchBtn.hidden = NO;
    }else if(indexPath.row == 2){
        cell.lsg_rightLabel.hidden = YES;
        cell.lsg_rightImage.hidden = NO;
        cell.lsg_leftLabel.text = @"隐私条款";
    }else{
        cell.lsg_leftLabel.text = @"版本";
        cell.lsg_rightLabel.text = @"1.0";
        cell.lsg_rightLabel.textColor = COMMON_C153;
        cell.lsg_rightLabel.font = COMMON_F15;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return DEVICE_HEIGHT/667*53;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
