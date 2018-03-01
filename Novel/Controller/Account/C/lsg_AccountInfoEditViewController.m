//
//  AccountInfoEditViewController.m
//  Novel
//
//  Created by user on 2018/2/27.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_AccountInfoEditViewController.h"

@interface lsg_AccountInfoEditViewController ()

@property (nonatomic, strong) lsg_BaseTableView *lsg_infoTableView;

@end

@implementation lsg_AccountInfoEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self lsg_initNav];
    [self lsg_initView];
}

- (void)lsg_initNav {
    [self.view addSubview:self.lsg_navigationView];
    self.lsg_navTitleLabel.text = @"资料编辑";
    [self.lsg_navigationView addSubview:self.lsg_navTitleLabel];
    [self.lsg_navigationView addSubview:self.lsg_goBackButton];
    
    [self.lsg_editButton setTitle:@"保存" forState:UIControlStateNormal];//编辑按钮代用成保存按钮
    [self.lsg_navigationView addSubview:self.lsg_editButton];
}

- (void)lsg_initView {
    self.view.backgroundColor = COMMON_C255;
    
    self.lsg_infoTableView = [[lsg_BaseTableView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT, DEVICE_WIDTH, DEVICE_HEIGHT - NAV_HEIGHT) style:UITableViewStylePlain];
    if (@available(iOS 11.0, *)) {
        _lsg_infoTableView.estimatedRowHeight = 0;
        _lsg_infoTableView.estimatedSectionHeaderHeight = 0;
        _lsg_infoTableView.estimatedSectionFooterHeight = 0;
    }
    [_lsg_infoTableView baseTableViewDelegate:self];
    //    [_lsg_infoTableView baseTableViewAddLegendFooterWithRefreshing];
    //    [_lsg_infoTableView baseTableViewAddLegendHeaderWithRefreshing];
    _lsg_infoTableView.BaseTableViewDelegate = self;
    _lsg_infoTableView.backgroundColor = [UIColor clearColor];
    _lsg_infoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_lsg_infoTableView];
}

#pragma mark ------UITableViewDataSource---------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"editInfoCell";
    lsg_InfoEditTableViewCell *cell = (lsg_InfoEditTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[lsg_InfoEditTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.lsg_headImage.hidden = YES;
    cell.lsg_rightLabel.hidden = NO;
    cell.lsg_lineView.frame = CGRectMake(0, (DEVICE_HEIGHT/667*67-0.5), DEVICE_WIDTH, 0.5);
    if(indexPath.row == 0){
        cell.lsg_leftLabel.text = @"头像";
        cell.lsg_headImage.hidden = NO;
        cell.lsg_rightLabel.hidden = YES;
        cell.lsg_headImage.image = [[UIImage imageNamed:@"novel_nologin_head"] lsg_circleImage];
        cell.lsg_lineView.frame = CGRectMake(0, (DEVICE_HEIGHT/667*72-5), DEVICE_WIDTH, 5);
    }else if(indexPath.row == 1){
        cell.lsg_leftLabel.text = @"昵称";
        cell.lsg_rightLabel.text = @"宋慧乔";
    }else{
        cell.lsg_leftLabel.text = @"性别";
        cell.lsg_rightLabel.text = @"女";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0){
        return DEVICE_HEIGHT/667*72;
    }else
        return DEVICE_HEIGHT/667*67;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)lsg_editBtnClick:(UIButton *)sender{//保存资料
    NSLog(@"保存资料");
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
