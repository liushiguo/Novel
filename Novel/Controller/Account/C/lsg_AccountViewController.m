//
//  lsg_AccountViewController.m
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_AccountViewController.h"

@interface lsg_AccountViewController ()
@property (nonatomic, strong) lsg_BaseTableView *lsg_accountTableView;
@end

@implementation lsg_AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self lsg_initNav];
    [self lsg_initView];
}

- (void)lsg_initNav{
    self.view.backgroundColor = COMMON_C255;
    
    [self.view addSubview:self.lsg_navigationView];
    self.lsg_navTitleLabel.text = @"账户";
    [self.lsg_navigationView addSubview:self.lsg_navTitleLabel];
}

- (void)lsg_initView {
    self.view.backgroundColor = COMMON_C255;
    
    self.lsg_accountTableView = [[lsg_BaseTableView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT, DEVICE_WIDTH, DEVICE_HEIGHT - NAV_HEIGHT - TAB_HEIGHT) style:UITableViewStylePlain];
    if (@available(iOS 11.0, *)) {
        _lsg_accountTableView.estimatedRowHeight = 0;
        _lsg_accountTableView.estimatedSectionHeaderHeight = 0;
        _lsg_accountTableView.estimatedSectionFooterHeight = 0;
    }
    [_lsg_accountTableView baseTableViewDelegate:self];
    //    [_lsg_accountTableView baseTableViewAddLegendFooterWithRefreshing];
    //    [_lsg_accountTableView baseTableViewAddLegendHeaderWithRefreshing];
    //_lsg_accountTableView.BaseTableViewDelegate = self;
    _lsg_accountTableView.backgroundColor = [UIColor clearColor];
    _lsg_accountTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_lsg_accountTableView];
    
    _lsg_accountTableView.tableHeaderView = [self lsg_headerView:YES];
}

- (UIView *)lsg_headerView:(BOOL)ifIsLogin{
    UIView *headerView = [[UIView alloc] init];
    UIImageView *headImage = [[UIImageView alloc] init];
	headImage.image = [[UIImage imageNamed:@"novel_nologin_head"] lsg_circleImage];
    [headerView addSubview:headImage];
    UILabel *nameLabel = nil;
    UIButton *loginBtn = nil;
    UIButton *infoEditBtn = nil;
    if(ifIsLogin){
        headerView.frame = CGRectMake(0, 0, DEVICE_WIDTH, 26+67+12+17+47);
        headImage.frame = CGRectMake((DEVICE_WIDTH-67)/2, 26, 67, 67);
        
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(headImage.frame)+12, DEVICE_WIDTH-30, 17)];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.font = COMMON_F17;
        nameLabel.textColor = COMMON_C51;
        nameLabel.text = @"宋慧乔";
        [headerView addSubview:nameLabel];
        
        infoEditBtn = [[UIButton alloc] initWithFrame:CGRectMake(headImage.frame.origin.x, headImage.frame.origin.y, headImage.frame.size.width, headImage.frame.size.height)];
        [infoEditBtn addTarget:self action:@selector(lsg_infoEditBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:infoEditBtn];
    }else{
        headerView.frame = CGRectMake(0, 0, DEVICE_WIDTH, 54+67+18+31+27);
        headImage.frame = CGRectMake((DEVICE_WIDTH-67)/2, 54, 67, 67);
        
        loginBtn = [[UIButton alloc] initWithFrame:CGRectMake((DEVICE_WIDTH-144)/2, CGRectGetMaxY(headImage.frame)+18, 144, 31)];
        loginBtn.backgroundColor = COMMON_C246;
        loginBtn.titleLabel.font = COMMON_F17;
        [loginBtn setTitle:@"立即登录" forState:UIControlStateNormal];
        [loginBtn setTitleColor:NAVEGATION_COLOR forState:UIControlStateNormal];
        [loginBtn addTarget:self action:@selector(lsg_loginBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [lsg_HandleUtil lsg_handleRadius:loginBtn];
        [headerView addSubview:loginBtn];
    }
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headerView.frame)-0.5, DEVICE_WIDTH, 0.5)];
    lineView.backgroundColor = FENGEXIAN_COLOR;
    [headerView addSubview:lineView];
    
    return headerView;
}

- (void)lsg_infoEditBtnClicked{//资料编辑
    lsg_AccountInfoEditViewController *accountInfoEditView = [[lsg_AccountInfoEditViewController alloc] init];
    [self.navigationController pushViewController:accountInfoEditView animated:YES];
}

- (void)lsg_loginBtnClicked{
    NSLog(@"---loginBtnClicked");
}

#pragma mark ------UITableViewDataSource---------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"accountCell";
    lsg_AccountTableViewCell *cell = (lsg_AccountTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[lsg_AccountTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    int cellH = DEVICE_HEIGHT/667*53;
    if(indexPath.row == 0){
        cell.lsg_titleLabel.text = @"消息";
        cell.lsg_leftImage.frame = CGRectMake(15, (cellH-18.5)/2, 21, 18.5);
        cell.lsg_leftImage.image = [UIImage imageNamed:@"novel_account_info"];
    }else if(indexPath.row == 1){
        cell.lsg_titleLabel.text = @"设置";
        cell.lsg_leftImage.frame = CGRectMake(15, (cellH-21.5)/2, 21, 21.5);
        cell.lsg_leftImage.image = [UIImage imageNamed:@"novel_account_set"];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return DEVICE_HEIGHT/667*53;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0){
        lsg_SystemInfoViewController *systemInfoView = [[lsg_SystemInfoViewController alloc] init];
        [self.navigationController pushViewController:systemInfoView animated:YES];
    }
    else if(indexPath.row == 1){
        lsg_SettingViewController *settingView = [[lsg_SettingViewController alloc] init];
        [self.navigationController pushViewController:settingView animated:YES];
    }
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
