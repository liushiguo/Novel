//
//  lsg_BannerBookshelfController.m
//  Novel
//
//  Created by user on 2018/2/26.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_BannerBookshelfController.h"

@interface lsg_BannerBookshelfController (){
    BOOL ifTableEdit;
    BOOL ifAllGX;//是否勾选所有的
}
@property (nonatomic, strong) lsg_BaseCollectionView *lsg_bookshelfCV;
@end

@implementation lsg_BannerBookshelfController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
    ifTableEdit = NO;
    ifAllGX = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lsg_tableViewEdit) name:[NSString stringWithFormat:@"%@_BOOKSHELF_EDIT", self.collectOrHistory] object:nil];//列表编辑
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lsg_tableViewEditS) name:[NSString stringWithFormat:@"%@_BOOKSHELF_EDIT_S", self.collectOrHistory] object:nil];//编辑完成
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lsg_tableViewGXAll) name:[NSString stringWithFormat:@"%@_BOOKSHELF_ALLGX", self.collectOrHistory] object:nil];//勾选所有的
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    NSLog(@"---viewWillAppear---");
}

- (void)lsg_tableViewEdit{
    _lsg_bookshelfCV.frame = CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT-48-NAV_HEIGHT-58);
    ifTableEdit = YES;
    [_lsg_bookshelfCV reloadData];
}

- (void)lsg_tableViewEditS{//编辑完成
    _lsg_bookshelfCV.frame = CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT-48-NAV_HEIGHT-TAB_HEIGHT);
    ifTableEdit = NO;
    ifAllGX = NO;
    [_lsg_bookshelfCV reloadData];
}

- (void)lsg_tableViewGXAll{
    ifAllGX = YES;
    [_lsg_bookshelfCV reloadData];
}

- (void)initView{
    self.view.backgroundColor = COMMON_C255;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _lsg_bookshelfCV = [[lsg_BaseCollectionView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT-48-NAV_HEIGHT-TAB_HEIGHT) collectionViewLayout:layout];
    _lsg_bookshelfCV.backgroundColor = [UIColor clearColor];
    [_lsg_bookshelfCV registerClass:[lsg_BookshelfCollectionViewCell class] forCellWithReuseIdentifier:@"bookshelfCell"];
    _lsg_bookshelfCV.showsVerticalScrollIndicator = NO;
    [_lsg_bookshelfCV baseCollectionViewDelegate:self];
    [self.view addSubview:_lsg_bookshelfCV];
}

#pragma mark collectionDelegate
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 1;
//}

//返回多少行
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

//返回的单元格
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    lsg_BookshelfCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bookshelfCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[lsg_BookshelfCollectionViewCell alloc] init];
    }
    cell.delegate = self;
    cell.lsg_delBtn.selected = NO;
    if(ifTableEdit){
        cell.lsg_delBtn.hidden = NO;//编辑状态
    }else{
        cell.lsg_delBtn.hidden = YES;//未编辑状态
    }
    if(ifAllGX){//全部勾选
        cell.lsg_delBtn.selected = YES;
        cell.lsg_delBtn.hidden = NO;
    }
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;//上下行
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;//行距
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat w = DEVICE_WIDTH/3;
    return CGSizeMake(w, ((w-30)/180*254)+15+15+14+4+11+8);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row != 0){
        NSLog(@"section:%ld, row:%ld", indexPath.section, indexPath.row);
    }
}

- (void)delBtnclicked:(NSIndexPath *)indexPath{
    
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
