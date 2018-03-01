//
//  lsg_RenqiHotViewController.m
//  Novel
//
//  Created by user on 2018/2/27.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_RenqiHotViewController.h"

@interface lsg_RenqiHotViewController ()
@property (nonatomic, strong) lsg_BaseSelectedButtonView *lsg_titleScroller; /* 收藏、历史 */
@property (nonatomic, strong) lsg_FSPageContentView      *lsg_pageContentView;
@end

@implementation lsg_RenqiHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self lsg_initNav];
    [self lsg_initView];
}

- (void)lsg_initNav {
    [self.view addSubview:self.lsg_navigationView];
    self.lsg_navTitleLabel.text = @"人气最热";
    [self.lsg_navigationView addSubview:self.lsg_navTitleLabel];
    [self.lsg_navigationView addSubview:self.lsg_goBackButton];
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
    
    self.lsg_titleScroller.titleArray = [NSMutableArray arrayWithArray:@[@"周榜", @"总榜"]];
    
    NSMutableArray *childVCs = [[NSMutableArray alloc] init];
    [childVCs removeAllObjects];
    for(int i = 0; i < 2; i++){
        lsg_RenqiSubViewController *vc = [[lsg_RenqiSubViewController alloc] init];
        //vc.collectOrHistory = [NSString stringWithFormat:@"%d", i];
        [childVCs addObject:vc];
    }
    self.lsg_pageContentView = nil;
    self.lsg_pageContentView = [[lsg_FSPageContentView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT+48, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - NAV_HEIGHT - 48) childVCs:childVCs parentVC:self delegate:self];
    //self.lsg_pageContentView.contentViewCurrentIndex = 0;
    //self.lsg_pageContentView.contentViewCanScroll = NO;//设置滑动属性
    [self.view addSubview:_lsg_pageContentView];
}

- (void)lsg_FSContenViewDidEndDecelerating:(lsg_FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    [self.lsg_titleScroller titleScrollerViewScrollerToIndex:endIndex];
    //    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@_notification", arryID[endIndex]] forKey:@"NEW_NOTIFICATION"];
}

- (void)lsg_baseTitleScrollerView:(lsg_BaseSelectedButtonView *)titleScrollerView scrollerToIndex:(NSInteger)index{
    self.lsg_pageContentView.contentViewCurrentIndex = index;
    
    switch (index) {
            
        case 0:
            break;
            
        case 1:
            break;
    }
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
