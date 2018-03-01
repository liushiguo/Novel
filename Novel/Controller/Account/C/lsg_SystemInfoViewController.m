//
//  lsg_SystemInfoViewController.m
//  Novel
//
//  Created by user on 2018/2/27.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_SystemInfoViewController.h"

@interface lsg_SystemInfoViewController (){
    int titleScrollerIndex;
}
@property (nonatomic, strong) lsg_BaseSelectedButtonView *lsg_titleScroller;   /* 系统消息、用户消息 */
@property (nonatomic, strong) lsg_FSPageContentView      *lsg_pageContentView;
@property (nonatomic, strong) lsg_PageDataEditView       *lsg_pageDataEditView;//底部view
@end

@implementation lsg_SystemInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    titleScrollerIndex = 0;
    [self lsg_initNav];
    [self lsg_initView];
}

- (void)lsg_initNav {
    [self.view addSubview:self.lsg_navigationView];
    self.lsg_navTitleLabel.text = @"消息";
    [self.lsg_navigationView addSubview:self.lsg_navTitleLabel];
    [self.lsg_navigationView addSubview:self.lsg_goBackButton];
    [self.lsg_navigationView addSubview:self.lsg_editButton];
}

- (void)lsg_initView {
    self.view.backgroundColor = COMMON_C246;
    
    _lsg_titleScroller = [[lsg_BaseSelectedButtonView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT, DEVICE_WIDTH, 48)];
    _lsg_titleScroller.delegate = self;
    _lsg_titleScroller.titleFont = COMMON_F14;
    _lsg_titleScroller.normalColor = RGB(64, 64, 71);
    _lsg_titleScroller.upLineColor = NAVEGATION_COLOR;
    _lsg_titleScroller.backgroundColor = COMMON_C255;
    [_lsg_titleScroller titleScrollerViewScrollerToIndex:0];
    [self.view addSubview:_lsg_titleScroller];
    
    self.lsg_titleScroller.titleArray = [NSMutableArray arrayWithArray:@[@"系统消息", @"用户消息"]];
    
    NSMutableArray *childVCs = [[NSMutableArray alloc] init];
    [childVCs removeAllObjects];
    for(int i = 0; i < 2; i++){
        lsg_SystemInfoSubViewController *vc = [[lsg_SystemInfoSubViewController alloc] init];
        vc.ifReadOrDel = [NSString stringWithFormat:@"%d", i];
        [childVCs addObject:vc];
    }
    self.lsg_pageContentView = nil;
    self.lsg_pageContentView = [[lsg_FSPageContentView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT+48, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - NAV_HEIGHT - 48) childVCs:childVCs parentVC:self delegate:self];
    //self.lsg_pageContentView.contentViewCurrentIndex = 0;
    //self.lsg_pageContentView.contentViewCanScroll = NO;//设置滑动属性
    [self.view addSubview:_lsg_pageContentView];
    
    _lsg_pageDataEditView = [[lsg_PageDataEditView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT-58, DEVICE_WIDTH, 58)];
    _lsg_pageDataEditView.leftBtnStr = @"设为已读";
    _lsg_pageDataEditView.rightBtnStr = @"删除";
    _lsg_pageDataEditView.delegate = self;
    _lsg_pageDataEditView.hidden = YES;
    [self.view addSubview:_lsg_pageDataEditView];
}

- (void)lsg_FSContenViewDidEndDecelerating:(lsg_FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    titleScrollerIndex = (int)endIndex;
    [self.lsg_titleScroller titleScrollerViewScrollerToIndex:endIndex];
    //    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@_notification", arryID[endIndex]] forKey:@"NEW_NOTIFICATION"];
}


- (void)lsg_baseTitleScrollerView:(lsg_BaseSelectedButtonView *)titleScrollerView scrollerToIndex:(NSInteger)index {
    titleScrollerIndex = (int)index;
    self.lsg_pageContentView.contentViewCurrentIndex = index;
    switch (index) {
            
        case 0:
            break;
            
        case 1:
            break;
            
        case 2:
            break;
            
        default:
            break;
    }
}

- (void)lsg_editBtnClick:(UIButton *)sender{
    if(sender.isSelected){
        sender.selected = NO;
        _lsg_pageDataEditView.hidden = YES;
        self.lsg_pageContentView.contentViewCanScroll = YES;
        _lsg_titleScroller.userInteractionEnabled = YES;
        self.lsg_pageContentView.frame = CGRectMake(0, NAV_HEIGHT+48, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - NAV_HEIGHT - 48);
        
        [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%d_SYSINFO_EDIT_S", titleScrollerIndex] object:nil];
    }else{
        sender.selected = YES;
        _lsg_pageDataEditView.hidden = NO;
        self.lsg_pageContentView.contentViewCanScroll = NO;
        _lsg_titleScroller.userInteractionEnabled = NO;
        self.lsg_pageContentView.frame = CGRectMake(0, NAV_HEIGHT+48, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - NAV_HEIGHT - 58 - 48);
        [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%d_SYSINFO_EDIT", titleScrollerIndex] object:nil];
    }
}

- (void)lsg_goBackBtnClick:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark --- lsg_PageDataEditViewDelegate ---
- (void)lsg_leftXZBtnClicked:(UIButton *)btn{
    
}

- (void)lsg_delBtnClicked:(UIButton *)btn{
    
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
