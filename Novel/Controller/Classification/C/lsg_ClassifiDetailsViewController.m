//
//  lsg_ClassifiDetailsViewController.m
//  Novel
//
//  Created by user on 2018/2/28.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_ClassifiDetailsViewController.h"

@interface lsg_ClassifiDetailsViewController ()
@property (nonatomic, strong) lsg_BaseTitleScrollerView *lsg_BaseTitleSV;
@property (nonatomic, strong) lsg_BaseTitleScrollerView *lsg_BaseTitleSVZS;//字数
@property (nonatomic, strong) lsg_BaseTitleScrollerView *lsg_BaseTitleSVZT;
@property (nonatomic, strong) lsg_BaseTitleScrollerView *lsg_BaseTitleSVSF;
@property (nonatomic, strong) lsg_BaseTitleScrollerView *lsg_BaseTitleSVGS;//更新和收藏

@property (nonatomic, strong) lsg_BaseTableView         *lsg_classifiTableView;
@end

@implementation lsg_ClassifiDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self lsg_initNav];
    [self lsg_initView];
}

- (void)lsg_initNav {
    [self.view addSubview:self.lsg_navigationView];
    self.lsg_navTitleLabel.text = @"分类详情";
    [self.lsg_navigationView addSubview:self.lsg_navTitleLabel];
    [self.lsg_navigationView addSubview:self.lsg_goBackButton];
    [self.lsg_navigationView addSubview:self.lsg_searchButton];
}

- (void)lsg_initView {
    self.view.backgroundColor = COMMON_C246;
    
    //lsg_classifiTableView
    self.lsg_classifiTableView = [[lsg_BaseTableView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT, DEVICE_WIDTH, DEVICE_HEIGHT - NAV_HEIGHT) style:UITableViewStylePlain];
    if (@available(iOS 11.0, *)) {
        _lsg_classifiTableView.estimatedRowHeight = 0;
        _lsg_classifiTableView.estimatedSectionHeaderHeight = 0;
        _lsg_classifiTableView.estimatedSectionFooterHeight = 0;
    }
    [_lsg_classifiTableView baseTableViewDelegate:self];
    //    [_lsg_classifiTableView baseTableViewAddLegendFooterWithRefreshing];
    //    [_lsg_classifiTableView baseTableViewAddLegendHeaderWithRefreshing];
    _lsg_classifiTableView.BaseTableViewDelegate = self;
    _lsg_classifiTableView.backgroundColor = [UIColor clearColor];
    _lsg_classifiTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_lsg_classifiTableView];
    
    _lsg_classifiTableView.tableHeaderView = [self lsg_initHeaderView];
}

- (UIView *)lsg_initHeaderView{
    UIView *lsg_svBg = [[UIView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT, DEVICE_WIDTH, (6*15)+(30*5)+7)];
    lsg_svBg.backgroundColor = COMMON_C255;
    
    //全部分类
    if (_lsg_BaseTitleSV) {
        [_lsg_BaseTitleSV removeFromSuperview];
    }
    _lsg_BaseTitleSV = [[lsg_BaseTitleScrollerView alloc] initWithFrame:CGRectMake(0, 15, DEVICE_WIDTH, 30)];
    _lsg_BaseTitleSV.delegate = self;
    _lsg_BaseTitleSV.normalBgColor = COMMON_C255;
    _lsg_BaseTitleSV.selectBgColor = COMMON_C255;
    _lsg_BaseTitleSV.backgroundColor = [UIColor clearColor];//COMMON_C246;//
    _lsg_BaseTitleSV.isHaveFenGeLine = YES;
    _lsg_BaseTitleSV.isHaveBorder = YES;
    _lsg_BaseTitleSV.lineColor = [UIColor clearColor];
    _lsg_BaseTitleSV.upLineColor = [UIColor clearColor];
    [lsg_svBg addSubview:_lsg_BaseTitleSV];
    
    _lsg_BaseTitleSV.titleArray = [[NSMutableArray alloc] initWithObjects:@"全部", @"异能", @"重生", @"热血", @"江湖", @"奇幻", @"其他", nil];
    //全部字数
    if (_lsg_BaseTitleSVZS) {
        [_lsg_BaseTitleSVZS removeFromSuperview];
    }
    _lsg_BaseTitleSVZS = [[lsg_BaseTitleScrollerView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_lsg_BaseTitleSV.frame)+15, DEVICE_WIDTH, 30)];
    _lsg_BaseTitleSVZS.delegate = self;
    _lsg_BaseTitleSVZS.normalBgColor = COMMON_C255;
    _lsg_BaseTitleSVZS.selectBgColor = COMMON_C255;
    _lsg_BaseTitleSVZS.backgroundColor = [UIColor clearColor];//COMMON_C246;//
    _lsg_BaseTitleSVZS.isHaveFenGeLine = YES;
    _lsg_BaseTitleSVZS.isHaveBorder = YES;
    _lsg_BaseTitleSVZS.lineColor = [UIColor clearColor];
    _lsg_BaseTitleSVZS.upLineColor = [UIColor clearColor];
    [lsg_svBg addSubview:_lsg_BaseTitleSVZS];
    
    _lsg_BaseTitleSVZS.titleArray = [[NSMutableArray alloc] initWithObjects:@"全部", @"20万字以下", @"20-100万字", @"100万字以上", @"150万字以上", @"200万字以上", @"其他", nil];
    //全部状态
    if (_lsg_BaseTitleSVZT) {
        [_lsg_BaseTitleSVZT removeFromSuperview];
    }
    _lsg_BaseTitleSVZT = [[lsg_BaseTitleScrollerView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_lsg_BaseTitleSVZS.frame)+15, DEVICE_WIDTH, 30)];
    _lsg_BaseTitleSVZT.delegate = self;
    _lsg_BaseTitleSVZT.normalBgColor = COMMON_C255;
    _lsg_BaseTitleSVZT.selectBgColor = COMMON_C255;
    _lsg_BaseTitleSVZT.backgroundColor = [UIColor clearColor];//COMMON_C246;//
    _lsg_BaseTitleSVZT.isHaveFenGeLine = YES;
    _lsg_BaseTitleSVZT.isHaveBorder = YES;
    _lsg_BaseTitleSVZT.lineColor = [UIColor clearColor];
    _lsg_BaseTitleSVZT.upLineColor = [UIColor clearColor];
    [lsg_svBg addSubview:_lsg_BaseTitleSVZT];
    
    _lsg_BaseTitleSVZT.titleArray = [[NSMutableArray alloc] initWithObjects:@"全部", @"连接中", @"已完结", nil];
    //收费类型
    if (_lsg_BaseTitleSVSF) {
        [_lsg_BaseTitleSVSF removeFromSuperview];
    }
    _lsg_BaseTitleSVSF = [[lsg_BaseTitleScrollerView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_lsg_BaseTitleSVZT.frame)+15, DEVICE_WIDTH, 30)];
    _lsg_BaseTitleSVSF.delegate = self;
    _lsg_BaseTitleSVSF.normalBgColor = COMMON_C255;
    _lsg_BaseTitleSVSF.selectBgColor = COMMON_C255;
    _lsg_BaseTitleSVSF.backgroundColor = [UIColor clearColor];//COMMON_C246;//
    _lsg_BaseTitleSVSF.isHaveFenGeLine = YES;
    _lsg_BaseTitleSVSF.isHaveBorder = YES;
    _lsg_BaseTitleSVSF.lineColor = [UIColor clearColor];
    _lsg_BaseTitleSVSF.upLineColor = [UIColor clearColor];
    [lsg_svBg addSubview:_lsg_BaseTitleSVSF];
    
    _lsg_BaseTitleSVSF.titleArray = [[NSMutableArray alloc] initWithObjects:@"全部", @"免费", @"收费", @"包月", nil];
    //全部指数
    if (_lsg_BaseTitleSVGS) {
        [_lsg_BaseTitleSVGS removeFromSuperview];
    }
    _lsg_BaseTitleSVGS = [[lsg_BaseTitleScrollerView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_lsg_BaseTitleSVSF.frame)+15, DEVICE_WIDTH, 30)];
    _lsg_BaseTitleSVGS.delegate = self;
    _lsg_BaseTitleSVGS.normalBgColor = COMMON_C255;
    _lsg_BaseTitleSVGS.selectBgColor = COMMON_C255;
    _lsg_BaseTitleSVGS.backgroundColor = [UIColor clearColor];//COMMON_C246;//
    _lsg_BaseTitleSVGS.isHaveFenGeLine = YES;
    _lsg_BaseTitleSVGS.isHaveBorder = YES;
    _lsg_BaseTitleSVGS.lineColor = [UIColor clearColor];
    _lsg_BaseTitleSVGS.upLineColor = [UIColor clearColor];
    [lsg_svBg addSubview:_lsg_BaseTitleSVGS];
    
    _lsg_BaseTitleSVGS.titleArray = [[NSMutableArray alloc] initWithObjects:@"全部", @"最新更新", @"更多收藏", nil];
    
    UIView *lsg_fengeView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_lsg_BaseTitleSVGS.frame)+15, DEVICE_WIDTH, 7)];
    lsg_fengeView.backgroundColor = COMMON_C246;
    [lsg_svBg addSubview:lsg_fengeView];
    
    return lsg_svBg;
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


#pragma mark --- lsg_BaseTitleScrollerViewdelegate ---
- (void)lsg_baseTitleScrollerView:(lsg_BaseTitleScrollerView *)titleScrollerView scrollerToIndex:(NSInteger)index {
}

- (void)lsg_goBackBtnClick:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)lsg_searchBtnClick:(UIButton *)sender{
    
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
