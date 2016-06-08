//
//  LRTxtReaderController.m
//  LoveReading
//
//  Created by BJ13041603-002 on 16/6/7.
//  Copyright © 2016年 刘建立. All rights reserved.
//

#import "LRTxtReaderController.h"

@interface LRTxtReaderController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation LRTxtReaderController

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isAppear) {
        return;
    }
    self.view.backgroundColor = [UIColor whiteColor];
    [self createContentView];
}

- (void)createContentView{
    //1.创建layout
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(LRWindowWidth,LRWindowHeight);
    layout.minimumLineSpacing = 0.0f;
    layout.minimumInteritemSpacing = 0.0f;
    //2.创建CollectionView
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0,LRWindowWidth, LRWindowHeight) collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.bounces = NO;
    [self.view addSubview:_collectionView];
    //3.注册公用的cell
    NSString * identifier = NSStringFromClass([UICollectionViewCell class]);
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.pagingEnabled = YES;
}

#pragma mark -UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

/**
 每一组有多少条数据
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier = NSStringFromClass([UICollectionViewCell class]);
    //从缓冲池中取新数据
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    //取得得cell为空时，重新alloc
    if (cell == nil) {
        cell = [[UICollectionViewCell alloc]init];
    }
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(100, 100, 200, 20);
    [label setText:[NSString stringWithFormat:@"label:%ld",indexPath.item]];
    [cell.contentView addSubview:label];
    cell.contentView.backgroundColor = [UIColor redColor];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

//cell点击事件处理
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
}

//隐藏状态栏
- (BOOL)prefersStatusBarHidden{
    return YES;
}

@end
