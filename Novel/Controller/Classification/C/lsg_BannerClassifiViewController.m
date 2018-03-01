//
//  lsg_BannerClassifiViewController.m
//  Novel
//
//  Created by user on 2018/2/26.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import "lsg_BannerClassifiViewController.h"

@interface lsg_BannerClassifiViewController ()
@property (nonatomic, strong) lsg_BaseCollectionView *lsg_classifiCV; //分类
@end

@implementation lsg_BannerClassifiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self lsg_initView];
}

- (void)lsg_initView{
    self.view.backgroundColor = COMMON_C255;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.footerReferenceSize = CGSizeMake(DEVICE_WIDTH, 40+(DEVICE_HEIGHT/667*107)+20);
    _lsg_classifiCV = [[lsg_BaseCollectionView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT-NAV_HEIGHT-48-TAB_HEIGHT) collectionViewLayout:layout];
    _lsg_classifiCV.backgroundColor = [UIColor clearColor];
    [_lsg_classifiCV registerClass:[lsg_ClassifiCollectionViewCell class] forCellWithReuseIdentifier:@"classifiCell"];
    
    [_lsg_classifiCV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    
    _lsg_classifiCV.showsVerticalScrollIndicator = NO;
    [_lsg_classifiCV baseCollectionViewDelegate:self];
    [self.view addSubview:_lsg_classifiCV];
}

#pragma mark collectionDelegate
//返回多少行
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 12;
}

//返回的单元格
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    lsg_ClassifiCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"classifiCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[lsg_ClassifiCollectionViewCell alloc] init];
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
    return CGSizeMake(w, 20+(w/125*30)+10+13+13);
}

//返回头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //如果是头视图
    //    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
    //        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
    //
    //        UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 160)];
    //        v1.backgroundColor = COMMON_C239;
    //        [header addSubview:v1];
    //
    //        return header;
    //    }
    //如果底部视图
    if([kind isEqualToString:UICollectionElementKindSectionFooter]){// && indexPath.section == 1
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
        UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(15, 40, DEVICE_WIDTH-30, (DEVICE_HEIGHT/667*107))];
        v1.backgroundColor = COMMON_C239;
        [lsg_HandleUtil lsg_handleRadius:v1];
        [header addSubview:v1];
        
        return header;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row != 0){
        NSLog(@"section:%ld, row:%ld", indexPath.section, indexPath.row);
    }
    lsg_ClassifiDetailsViewController *classifiDetailsView = [[lsg_ClassifiDetailsViewController alloc] init];
    [self.navigationController pushViewController:classifiDetailsView animated:YES];
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
