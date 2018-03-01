//
//  lsg_RenqiSubViewController.m
//  Novel
//
//  Created by user on 2018/2/27.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_RenqiSubViewController.h"

@interface lsg_RenqiSubViewController ()

@property (nonatomic, strong) lsg_BaseTableView *lsg_renqiTableView;

@end

@implementation lsg_RenqiSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self lsg_initView];
}

- (void)lsg_initView {
    self.view.backgroundColor = COMMON_C255;
    
    self.lsg_renqiTableView = [[lsg_BaseTableView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT - NAV_HEIGHT - 48) style:UITableViewStylePlain];
    if (@available(iOS 11.0, *)) {
        _lsg_renqiTableView.estimatedRowHeight = 0;
        _lsg_renqiTableView.estimatedSectionHeaderHeight = 0;
        _lsg_renqiTableView.estimatedSectionFooterHeight = 0;
    }
    [_lsg_renqiTableView baseTableViewDelegate:self];
    //    [_lsg_renqiTableView baseTableViewAddLegendFooterWithRefreshing];
    //    [_lsg_renqiTableView baseTableViewAddLegendHeaderWithRefreshing];
    _lsg_renqiTableView.BaseTableViewDelegate = self;
    _lsg_renqiTableView.backgroundColor = [UIColor clearColor];
    _lsg_renqiTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_lsg_renqiTableView];
}

#pragma mark ------UITableViewDataSource---------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.row == 3){
        
        static NSString *identifier = @"adCell";
        lsg_ADMoreNovelTableViewCell *cell = (lsg_ADMoreNovelTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[lsg_ADMoreNovelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }else{
        static NSString *identifier = @"renqiCell";
        lsg_MoreNovelTableViewCell *cell = (lsg_MoreNovelTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[lsg_MoreNovelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.lsg_mcImage.hidden = YES;
        if(indexPath.row == 0){
            cell.lsg_mcImage.hidden = NO;
            cell.lsg_mcImage.image = [UIImage imageNamed:@"novel_renqi_one"];
        }else if(indexPath.row == 1){
            cell.lsg_mcImage.hidden = NO;
            cell.lsg_mcImage.image = [UIImage imageNamed:@"novel_renqi_two"];
        }else if(indexPath.row == 2){
            cell.lsg_mcImage.hidden = NO;
            cell.lsg_mcImage.image = [UIImage imageNamed:@"novel_renqi_three"];
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
