//
//  lsg_CommentViewViewController.m
//  Novel
//
//  Created by user on 2018/2/28.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_CommentViewViewController.h"

@interface lsg_CommentViewViewController ()
@property (nonatomic, strong) lsg_BaseTableView *lsg_commentTableView;
@end

@implementation lsg_CommentViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self lsg_initNav];
    [self lsg_initView];
}

- (void)lsg_initNav {
    [self.view addSubview:self.lsg_navigationView];
    self.lsg_navTitleLabel.text = @"评论";
    [self.lsg_navigationView addSubview:self.lsg_navTitleLabel];
    [self.lsg_navigationView addSubview:self.lsg_goBackButton];
}

- (void)lsg_initView {
    self.view.backgroundColor = COMMON_C246;
    
    self.lsg_commentTableView = [[lsg_BaseTableView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT, DEVICE_WIDTH, DEVICE_HEIGHT - NAV_HEIGHT) style:UITableViewStylePlain];
    if (@available(iOS 11.0, *)) {
        _lsg_commentTableView.estimatedRowHeight = 0;
        _lsg_commentTableView.estimatedSectionHeaderHeight = 0;
        _lsg_commentTableView.estimatedSectionFooterHeight = 0;
    }
    [_lsg_commentTableView baseTableViewDelegate:self];
    //    [_lsg_commentTableView baseTableViewAddLegendFooterWithRefreshing];
    //    [_lsg_commentTableView baseTableViewAddLegendHeaderWithRefreshing];
    _lsg_commentTableView.BaseTableViewDelegate = self;
    _lsg_commentTableView.backgroundColor = [UIColor clearColor];
    _lsg_commentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_lsg_commentTableView];
}

#pragma mark ------UITableViewDataSource---------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return 5;
    }else{
        return 5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //lsg_CommemtTableViewCell
    static NSString *identifier = @"commentCell";
    lsg_CommemtTableViewCell *cell = (lsg_CommemtTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[lsg_CommemtTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
    if(indexPath.row == 5){//加载更多评论

    }else{
        
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if(indexPath.row == 2){
//        return 44;
//    }else
        return 134;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_WIDTH/375*35)];
    headerView.backgroundColor = COMMON_C255;
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(15, headerView.frame.size.height-0.5, DEVICE_WIDTH-30, 0.5)];
    lineView.backgroundColor = FENGEXIAN_COLOR;
    [headerView addSubview:lineView];
    
    UIView *idView = [[UIView alloc] initWithFrame:CGRectMake(15, (headerView.frame.size.height-13)/2, 4, 13)];
    idView.backgroundColor = NAVEGATION_COLOR;
    [lsg_HandleUtil lsg_handleRadius:idView];
    [headerView addSubview:idView];
    
    UILabel *titLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(idView.frame)+11, idView.frame.origin.y-1, 100, 15)];
    titLabel.font = COMMON_F14;
    titLabel.textColor = COMMON_C51;
    titLabel.text = @"热门评论";
    [headerView addSubview:titLabel];
    
    return headerView;
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
