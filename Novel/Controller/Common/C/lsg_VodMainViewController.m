//
//  lsg_VodMainViewController.m
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_VodMainViewController.h"

#import "lsg_AccountViewController.h"
#import "lsg_HomePageViewController.h"
#import "lsg_BookshelfViewController.h"
#import "lsg_ClassificationViewController.h"

@interface lsg_VodMainViewController (){
    
}
@end

@implementation lsg_VodMainViewController
{
    lsg_AnimateTabbarView        *tabbar;
}

lsg_HomePageViewController       *oneViewController;
lsg_BookshelfViewController      *twoViewController;
lsg_ClassificationViewController *threeViewController;
lsg_AccountViewController        *fourViewController;

UIViewController                 *currentViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//- (AppDelegate *)delegate {
//    if (!_delegate) {
//        _delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    }
//    return _delegate;
//}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;//第一层级禁掉手势返回
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;//将进入第二层级打开手势返回
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;//手势返回
    
    _childView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
    [self.view addSubview:_childView];
    
    tabbar = [[lsg_AnimateTabbarView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
    tabbar.delegate = self;
    [self.view addSubview:tabbar];
    
    [self createAllControllersView];
    [self checkVersionUpdate];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(initDelBookshelfView) name:@"BOOKSHELFEDIT" object:nil];//编辑
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bookshelfEditSuccess) name:@"BOOKSHELFEDIT_SUCCESS" object:nil];//编辑完成
}

- (void)initDelBookshelfView{//编辑书架
    tabbar.hidden = YES;
}

- (void)bookshelfEditSuccess{//编辑完成
    tabbar.hidden = NO;
}

//创建所有的视图控制器
- (void)createAllControllersView {
    oneViewController = [[lsg_HomePageViewController alloc] init];
    oneViewController.view.frame = CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT);
    [self addChildViewController:oneViewController];

    twoViewController = [[lsg_BookshelfViewController alloc] init];
    twoViewController.view.frame = CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT);
    [self addChildViewController:twoViewController];

    threeViewController = [[lsg_ClassificationViewController alloc] init];
    threeViewController.view.frame = CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT);
    [self addChildViewController:threeViewController];

    fourViewController = [[lsg_AccountViewController alloc] init];
    fourViewController.view.frame = CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT);
    [self addChildViewController:fourViewController];

    [self.childView addSubview:oneViewController.view];
    currentViewController = oneViewController;

    _oneViewController = oneViewController;
    _twoViewController = twoViewController;
    _threeViewController = threeViewController;
    _fourViewController = fourViewController;
}

#pragma mark --- 检查版本是否要更新 ---
- (void)checkVersionUpdate{
    //appID:应用在Store里面的ID (应用的AppStore地址里面可获取)
    //[NewEditionTestManager checkNewEditionWithAppID:@"1208758376" ctrl:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//callback
int g_flags = 1;
//首页
- (void)oneBtnClick{
    if(g_flags == 1){
        return;
    }
    [self transitionFromViewController:currentViewController toViewController:oneViewController duration:0 options:0 animations:^{
    }  completion:^(BOOL finished) {
        currentViewController = oneViewController;
        g_flags = 1;
    }];
}

//书架
- (void)twoBtnClick{
//    if ([tabbar.twoBtn isKindOfClass:[UIButton class]]) {
//        tabbar.oneBtn.selected = NO;
//    }
    if(g_flags == 2){
        return;
    }
    [self transitionFromViewController:currentViewController toViewController:twoViewController duration:0 options:0 animations:^{
    }  completion:^(BOOL finished) {
        currentViewController = twoViewController;
        g_flags = 2;
    }];
}

//分类
- (void)threeBtnClick{
//    if ([tabbar.threeBtn isKindOfClass:[UIButton class]]) {
//        tabbar.oneBtn.selected = NO;
//    }
    if(g_flags == 3){
        return;
    }
    [self transitionFromViewController:currentViewController toViewController:threeViewController duration:0 options:0 animations:^{
    }  completion:^(BOOL finished) {
        currentViewController = threeViewController;
        g_flags = 3;
    }];
}

//账户
- (void)fourBtnClick{
//    if ([tabbar.fourBtn isKindOfClass:[UIButton class]]) {
//        tabbar.oneBtn.selected = NO;
//    }
    if(g_flags == 4){
        return;
    }
    [self transitionFromViewController:currentViewController toViewController:fourViewController duration:0 options:0 animations:^{
    }  completion:^(BOOL finished) {
        currentViewController = fourViewController;
        g_flags = 4;
    }];
}

- (void)tabButtonClick:(NSInteger)num{
    switch (num) {
        case 1:
            [tabbar buttonClickAction:tabbar.oneBtn];
            break;
            
        case 2:
            [tabbar buttonClickAction:tabbar.twoBtn];
            break;
            
        case 3:
            [tabbar buttonClickAction:tabbar.threeBtn];
            break;
            
        case 4:
            [tabbar buttonClickAction:tabbar.fourBtn];
            break;
    }
}

@end
