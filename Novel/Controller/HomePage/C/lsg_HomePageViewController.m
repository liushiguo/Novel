//
//  lsg_HomePageViewController.m
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_HomePageViewController.h"
#import "lsg_BaseSelectedButtonView.h"

@interface lsg_HomePageViewController ()

@property (nonatomic, strong) lsg_BaseSelectedButtonView *lsg_titleScroller; /* 精选、男生、女生 */
@property (nonatomic, strong) lsg_FSPageContentView      *lsg_pageContentView;

@end

@implementation lsg_HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self lsg_initNav];
    [self lsg_initView];
}

- (void)lsg_initNav{
    self.lsg_navigationView.backgroundColor = COMMON_C255;
    [self.view addSubview:self.lsg_navigationView];
}

- (void)lsg_initView{
    self.view.backgroundColor = COMMON_C255;
    _lsg_titleScroller = [[lsg_BaseSelectedButtonView alloc] initWithFrame:CGRectMake(0, 24+IPHONE_X, DEVICE_WIDTH/375*197, BANNER_HEIGHT)];
    _lsg_titleScroller.delegate = self;
    _lsg_titleScroller.scrollWidth = DEVICE_WIDTH/375*197;
    _lsg_titleScroller.upLineColor = NAVEGATION_COLOR;
    _lsg_titleScroller.backgroundColor = COMMON_C255;
    [_lsg_titleScroller titleScrollerViewScrollerToIndex:0];
    [self.view addSubview:_lsg_titleScroller];
    
    self.lsg_titleScroller.titleArray = [NSMutableArray arrayWithArray:@[@"精选", @"男生", @"女生"]];
    
    UIView *searchV = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_lsg_titleScroller.frame), NAV_HEIGHT-4-36, DEVICE_WIDTH/375*163, 36)];//搜索框背景
    searchV.backgroundColor = COMMON_C239;
    [lsg_HandleUtil lsg_handleRadius:searchV];
    [self.view addSubview:searchV];
    
    UIImageView *lsg_searchImage = [[UIImageView alloc] initWithFrame:CGRectMake(8, 10, 16, 16)];
    lsg_searchImage.image = [UIImage imageNamed:@"novel_homepage_search"];
    [searchV addSubview:lsg_searchImage];
    
    UILabel *searchLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lsg_searchImage.frame)+6, 11, searchV.frame.size.width-8-16-6-10, 14)];
    searchLabel.font = COMMON_F14;
    searchLabel.textColor = COMMON_C186;
    searchLabel.text = @"搜索或输入网址";
    [searchV addSubview:searchLabel];
    
    UIButton *lsg_searchBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, searchV.frame.size.width, 36)];
    [lsg_searchBtn addTarget:self action:@selector(lsg_searchBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [searchV addSubview:lsg_searchBtn];
    
    NSMutableArray *childVCs = [[NSMutableArray alloc] init];
    [childVCs removeAllObjects];
    for(int i = 0; i < 3; i++){
        lsg_BannerPageViewController *vc = [[lsg_BannerPageViewController alloc] init];
        //vc.newsType = arryID[i];
        [childVCs addObject:vc];
    }
    self.lsg_pageContentView = nil;
    self.lsg_pageContentView = [[lsg_FSPageContentView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - NAV_HEIGHT - TAB_HEIGHT) childVCs:childVCs parentVC:self delegate:self];
    //self.lsg_pageContentView.contentViewCurrentIndex = 0;
    //self.lsg_pageContentView.contentViewCanScroll = NO;//设置滑动属性
    [self.view addSubview:_lsg_pageContentView];
}

- (void)lsg_searchBtnClicked{
    lsg_CommentViewViewController *commentView = [[lsg_CommentViewViewController alloc] init];
    [self.navigationController pushViewController:commentView animated:YES];
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
            
        case 2:
            break;
            
        default:
            break;
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
