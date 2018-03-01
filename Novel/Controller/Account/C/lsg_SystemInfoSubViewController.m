//
//  lsg_SystemInfoSubViewController.m
//  Novel
//
//  Created by user on 2018/2/27.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_SystemInfoSubViewController.h"

#define SysInfoCellH DEVICE_HEIGHT/667*50

@interface lsg_SystemInfoSubViewController (){
    BOOL ifTableEdit;
}
@property (nonatomic, strong) lsg_BaseTableView *lsg_infoTableView;
@end

@implementation lsg_SystemInfoSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ifTableEdit = NO;
    [self lsg_initView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lsg_tableViewEdit) name:[NSString stringWithFormat:@"%@_SYSINFO_EDIT", _ifReadOrDel] object:nil];//列表编辑
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lsg_tableViewEditS) name:[NSString stringWithFormat:@"%@_SYSINFO_EDIT_S", _ifReadOrDel] object:nil];//编辑完成
}

- (void)lsg_tableViewEdit{
    _lsg_infoTableView.frame = CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT-48-NAV_HEIGHT-58);
    ifTableEdit = YES;
    [_lsg_infoTableView reloadData];
}

- (void)lsg_tableViewEditS{//编辑完成
    _lsg_infoTableView.frame = CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT-48-NAV_HEIGHT);
    ifTableEdit = NO;
    [_lsg_infoTableView reloadData];
}

- (void)lsg_initView {
    self.view.backgroundColor = COMMON_C246;
    
    self.lsg_infoTableView = [[lsg_BaseTableView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT - NAV_HEIGHT - 48) style:UITableViewStylePlain];
    if (@available(iOS 11.0, *)) {
        _lsg_infoTableView.estimatedRowHeight = 0;
        _lsg_infoTableView.estimatedSectionHeaderHeight = 0;
        _lsg_infoTableView.estimatedSectionFooterHeight = 0;
    }
    [_lsg_infoTableView baseTableViewDelegate:self];
    _lsg_infoTableView.BaseTableViewDelegate = self;
    // 允许在编辑模式进行多选操作
    _lsg_infoTableView.allowsMultipleSelectionDuringEditing = YES;
    _lsg_infoTableView.backgroundColor = [UIColor clearColor];
    _lsg_infoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_lsg_infoTableView];
}

#pragma mark ------UITableViewDataSource---------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"sysInfoCell";
    lsg_SysInfoTableViewCell *cell = (lsg_SysInfoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[lsg_SysInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.delegate = self;
    if(ifTableEdit){
        cell.lsg_xzBtn.hidden = NO;
        cell.lsg_sysImage.frame = CGRectMake(CGRectGetMaxX(cell.lsg_xzBtn.frame), (SysInfoCellH-20)/2, 21, 20);
        cell.lsg_idImage.frame = CGRectMake(cell.lsg_sysImage.frame.origin.x+12, cell.lsg_sysImage.frame.origin.y-6, 10.5, 10.5);
        cell.lsg_titleLabel.frame = CGRectMake(CGRectGetMaxX(cell.lsg_sysImage.frame)+17, 0, 100, SysInfoCellH);
    }else{
        cell.lsg_xzBtn.hidden = YES;
        cell.lsg_sysImage.frame = CGRectMake(15, (SysInfoCellH-20)/2, 21, 20);
        cell.lsg_idImage.frame = CGRectMake(27, cell.lsg_sysImage.frame.origin.y-6, 10.5, 10.5);
        cell.lsg_titleLabel.frame = CGRectMake(CGRectGetMaxX(cell.lsg_sysImage.frame)+17, 0, 100, SysInfoCellH);
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return SysInfoCellH;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark --- lsg_SysInfoCellDelegate ---
- (void)lsg_xzBtnClicked:(NSIndexPath *)indexPath{
    
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
