//
//  lsg_BannerPageViewController.m
//  Novel
//
//  Created by user on 2018/2/24.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_BannerPageViewController.h"

#define AD_HEIGHT ((DEVICE_WIDTH-30)/688*266)

@interface lsg_BannerPageViewController ()
@property (nonatomic, strong) lsg_BaseCollectionView *lsg_homepageCV;
@end

@implementation lsg_BannerPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (void)initView{
    self.view.backgroundColor = COMMON_C255;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.footerReferenceSize = CGSizeMake(DEVICE_WIDTH, AD_HEIGHT);
    //layout.headerReferenceSize = CGSizeMake(DEVICE_WIDTH, 50);
    _lsg_homepageCV = [[lsg_BaseCollectionView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT-NAV_HEIGHT-TAB_HEIGHT) collectionViewLayout:layout];
    _lsg_homepageCV.backgroundColor = [UIColor clearColor];
//    [_lsg_homepageCV registerClass:[TitleHeaderCollectionViewCell class] forCellWithReuseIdentifier:@"titleCell"];
    [_lsg_homepageCV registerClass:[lsg_BannerHPCollectionViewCell class] forCellWithReuseIdentifier:@"bannerCell"];
    [_lsg_homepageCV registerClass:[lsg_BookHPCollectionViewCell class] forCellWithReuseIdentifier:@"bookHPCell"];
    [_lsg_homepageCV registerClass:[lsg_ADCollectionViewCell class] forCellWithReuseIdentifier:@"adCell"];

//    [_lsg_homepageCV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    [_lsg_homepageCV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerCell"];
    
    _lsg_homepageCV.showsVerticalScrollIndicator = NO;
    [_lsg_homepageCV baseCollectionViewDelegate:self];
    [self.view addSubview:_lsg_homepageCV];
}

#pragma mark collectionDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}

//返回多少行
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(section == 0){
        return 1;
    }else if(section == 1){
        return 9;
    }else{
        return 8;
    }
}

//返回的单元格
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0 && indexPath.section == 0){//banner
        lsg_BannerHPCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bannerCell" forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[lsg_BannerHPCollectionViewCell alloc] init];
        }
        return cell;
    }
//    else if(indexPath.row == 0 && indexPath.section > 0){//分类标题
//        TitleHeaderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"titleCell" forIndexPath:indexPath];
//        if (cell == nil) {
//            cell = [[TitleHeaderCollectionViewCell alloc] init];
//        }
//        if(indexPath.section == 2){
//            cell.hBgView.backgroundColor = COMMON_C255;
//        }else{
//            cell.hBgView.backgroundColor = COMMON_C242;
//        }
//        return cell;
//    }
    else if(indexPath.row < 8 && indexPath.section > 0){
        lsg_BookHPCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bookHPCell" forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[lsg_BookHPCollectionViewCell alloc] init];
        }
        return cell;
    }else if(indexPath.row == 8 && indexPath.section > 0){
        //广告 可以把indexPath 存在数组中 待下次搜索后显示不同的标题 
        lsg_ADCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"adCell" forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[lsg_ADCollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, (DEVICE_WIDTH-30)/688*266)];
        }
        return cell;
    }//ADCollectionViewCell
    return nil;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 15;//上下行
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;//行距
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if(section > 0){
        return UIEdgeInsetsMake(0, 15, 0, 15);//分别为上、左、下、右
    }else
        return UIEdgeInsetsMake(0, 0, 0, 0);//分别为上、左、下、右
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0 && indexPath.section == 0){//banner
        return CGSizeMake(DEVICE_WIDTH, 160);
    }
//    else if(indexPath.row == 0 && indexPath.section > 0){//TITLE
//        return CGSizeMake(DEVICE_WIDTH, 50);
//    }
    else if(indexPath.row < 8 && indexPath.section > 0){//indexPath.row > 0 &&
        CGFloat w = (DEVICE_WIDTH-75)/4;
        //CGFloat w = (DEVICE_WIDTH-15)/4;
        return CGSizeMake(w, (w/146*196)+6+11+5+8+20);
    }
    else if(indexPath.row == 8 && indexPath.section > 0){//广告
        return CGSizeMake(DEVICE_WIDTH-30, (DEVICE_WIDTH-30)/688*266);
    }
    else{
        return CGSizeMake(0, 0);
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    lsg_NolOrrOrcViewController *nolOrrOrcView = [[lsg_NolOrrOrcViewController alloc] init];
    if(indexPath.row == 0){
        nolOrrOrcView.handleType = 1;
    }else if(indexPath.row == 1){
        nolOrrOrcView.handleType = 2;
    }else{
        nolOrrOrcView.handleType = 3;
    }
    [self.navigationController pushViewController:nolOrrOrcView animated:YES];
    //NSLog(@"section:%ld, row:%ld", indexPath.section, indexPath.row);
}

- (CGSize)collectionView: (UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection: (NSInteger)section {
    CGSize size;
    if(section == 0){
        size = CGSizeMake(0.0f, 0.0f);
    }else
        size = CGSizeMake(DEVICE_WIDTH, 50);
    
    return size;
}

//返回头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"---%ld, ---%ld", indexPath.section, indexPath.row);
    //如果是头视图
    if(indexPath.section > 0 && indexPath.row == 0){
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerCell" forIndexPath:indexPath];
            if(indexPath.section == 1){
                [header addSubview:[self lsg_headerCell:indexPath :YES]];
            }else{
                [header addSubview:[self lsg_headerCell:indexPath :NO]];
            }
            return header;
        }
    }else{
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerCell" forIndexPath:indexPath];
            
            return header;
        }
    }
    
    //如果底部视图
//    if([kind isEqualToString:UICollectionElementKindSectionFooter]){// && indexPath.section == 1
//        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
//        UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(15, 0, DEVICE_WIDTH-30, AD_HEIGHT)];
//        v1.backgroundColor = COMMON_C239;
//        [header addSubview:v1];
//
//        return header;
//    }
    return nil;
}

- (UIView *)lsg_headerCell:(NSIndexPath *)index :(BOOL)ifIsChange{//(ifIsChange 是否是换一换)
    UIView *hBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 50)];
    hBgView.backgroundColor = COMMON_C242;
    
    if(index.section == 2){
       hBgView.backgroundColor = COMMON_C255;
    }
    
    UIView *wBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 6, DEVICE_WIDTH, 50-6)];
    wBgView.backgroundColor = COMMON_C255;//[UIColor redColor];//
    [hBgView addSubview:wBgView];
    
    UIView *idView = [[UIView alloc] initWithFrame:CGRectMake(15, 13, 5, wBgView.frame.size.height-26)];
    idView.backgroundColor = NAVEGATION_COLOR;
    [lsg_HandleUtil lsg_handleRadius:idView];
    [wBgView addSubview:idView];
    
    UILabel *titLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(idView.frame)+15, idView.frame.origin.y+(idView.frame.size.height-15)/2, 100, 15)];
    titLabel.font = COMMON_F16;
    titLabel.textColor = COMMON_C51;
    titLabel.text = @"热门分类";
    [wBgView addSubview:titLabel];
    
    CGFloat w;
    UILabel *changeDLabel = [[UILabel alloc] init];
    changeDLabel.font = COMMON_F13;
    changeDLabel.textColor = COMMON_C51;
    [wBgView addSubview:changeDLabel];
    
    UIImageView *rightImage = [[UIImageView alloc] init];
    [wBgView addSubview:rightImage];
    if(ifIsChange){//是换一换
        w = [lsg_HandleUtil lsg_labelWidthWithString:@"换一换" :COMMON_F13 :12];
        changeDLabel.frame = CGRectMake(DEVICE_WIDTH-14-15-w-5, idView.frame.origin.y+(idView.frame.size.height-12)/2, w, 12);
        changeDLabel.text = @"换一换";
        
        rightImage.frame = CGRectMake(CGRectGetMaxX(changeDLabel.frame)+5, idView.frame.origin.y+(idView.frame.size.height-14)/2, 14, 14);
        rightImage.image = [UIImage imageNamed:@"novel_homepage_change"];
    }else{
        w = [lsg_HandleUtil lsg_labelWidthWithString:@"更多" :COMMON_F13 :12];
        changeDLabel.frame = CGRectMake(DEVICE_WIDTH-7.5-15-w-13, idView.frame.origin.y+(idView.frame.size.height-12)/2, w, 12);
        changeDLabel.text = @"更多";
        
        rightImage.frame = CGRectMake(CGRectGetMaxX(changeDLabel.frame)+13, idView.frame.origin.y+(idView.frame.size.height-13.5)/2, 7.5, 13.5);
        rightImage.image = [UIImage imageNamed:@"novel_homepage_more"];
    }
    
    UIButton *handleBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, hBgView.frame.size.height)];
    handleBtn.tag = index.section*888;
    [handleBtn addTarget:self action:@selector(handleBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [wBgView addSubview:handleBtn];
    
    return hBgView;
}

- (void)handleBtnClicked:(UIButton *)btn{
    NSLog(@"%ld", btn.tag/888);
    if(btn.tag/888 == 1){
        lsg_RenqiHotViewController *renqiHotView = [[lsg_RenqiHotViewController alloc] init];
        [self.navigationController pushViewController:renqiHotView animated:YES];
    }else{
        lsg_MorePageViewController *morePageView = [[lsg_MorePageViewController alloc] init];
        morePageView.pageTitle = @"编辑力推";
        [self.navigationController pushViewController:morePageView animated:YES];
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
