//
//  lsg_MorePageViewController.m
//  Novel
//
//  Created by user on 2018/2/26.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_MorePageViewController.h"

@interface lsg_MorePageViewController ()

@property (nonatomic, strong) lsg_BaseTableView *lsg_moreNovelTableView;

@end

@implementation lsg_MorePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self lsg_initNav];
    [self lsg_initView];
}

- (void)lsg_initNav {
    [self.view addSubview:self.lsg_navigationView];
    self.lsg_navTitleLabel.text = _pageTitle;
    [self.lsg_navigationView addSubview:self.lsg_navTitleLabel];
    [self.lsg_navigationView addSubview:self.lsg_goBackButton];
}

- (void)lsg_initView {
    self.view.backgroundColor = COMMON_C255;
    
    self.lsg_moreNovelTableView = [[lsg_BaseTableView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT, DEVICE_WIDTH, DEVICE_HEIGHT - NAV_HEIGHT) style:UITableViewStylePlain];
    if (@available(iOS 11.0, *)) {
        _lsg_moreNovelTableView.estimatedRowHeight = 0;
        _lsg_moreNovelTableView.estimatedSectionHeaderHeight = 0;
        _lsg_moreNovelTableView.estimatedSectionFooterHeight = 0;
    }
    [_lsg_moreNovelTableView baseTableViewDelegate:self];
//    [_lsg_moreNovelTableView baseTableViewAddLegendFooterWithRefreshing];
//    [_lsg_moreNovelTableView baseTableViewAddLegendHeaderWithRefreshing];
	_lsg_moreNovelTableView.BaseTableViewDelegate = self;
    _lsg_moreNovelTableView.backgroundColor = [UIColor clearColor];
    _lsg_moreNovelTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_lsg_moreNovelTableView];
}

#pragma mark ------UITableViewDataSource---------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.row == 2){
        
        static NSString *identifier = @"adCell";
        lsg_ADMoreNovelTableViewCell *cell = (lsg_ADMoreNovelTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[lsg_ADMoreNovelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }else{
        static NSString *identifier = @"moreNovelCell";
        lsg_MoreNovelTableViewCell *cell = (lsg_MoreNovelTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[lsg_MoreNovelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 2){
        return 12+(DEVICE_WIDTH/375*109);
    }else
        return (DEVICE_WIDTH/375*93)+30;
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
