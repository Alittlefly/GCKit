//
//  MRPageContentView.m
//  Mrxs-Logistics
//
//  Created by mac on 2019/4/3.
//  Copyright © 2019年 XiaoShi. All rights reserved.
//

#import "MRPageContentView.h"

#define IOS_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])
static NSString *collectionCellIdentifier = @"MRCollectionCellIdentifier";
@interface MRPageContentView ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, weak) UIViewController *parentVC;//父视图
@property (nonatomic, strong) NSArray *childsVCs;//子视图数组
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) CGFloat startOffsetX;
@property (nonatomic, assign) BOOL isSelectBtn;//是否是滑动

@end
@implementation MRPageContentView

- (instancetype)initWithFrame:(CGRect)frame childVCs:(NSArray *)childVCs parentVC:(UIViewController *)parentVC delegate:(id<MRPageContentViewDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.parentVC = parentVC;
        self.childsVCs = childVCs;
        self.delegate = delegate;
        
        [self setupSubViews];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

#pragma mark --LazyLoad

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.pagingEnabled = YES;
        collectionView.bounces = NO;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:collectionCellIdentifier];
        [self addSubview:collectionView];
         _collectionView = collectionView;
    }
    return _collectionView;
}

#pragma mark --setup
- (void)setupSubViews
{
    _startOffsetX = 0;
    _isSelectBtn = NO;
    _contentViewCanScroll = YES;
    
    for (UIViewController *childVC in self.childsVCs) {
        [self.parentVC addChildViewController:childVC];
    }
    WS(weaks);
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weaks);
    }];
    [self.collectionView reloadData];
    [self.collectionView setBackgroundColor:[UIColor clearColor]];

}

#pragma mark UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.childsVCs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellIdentifier forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIViewController *childVc = self.childsVCs[indexPath.row];
    childVc.view.frame = cell.contentView.bounds;
    [cell.contentView addSubview:childVc.view];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.bounds.size;
}



#pragma mark UIScrollView

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _isSelectBtn = NO;
    _startOffsetX = scrollView.contentOffset.x;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(MRContentViewWillBeginDragging:)]) {
        [self.delegate MRContentViewWillBeginDragging:self];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_isSelectBtn) {
        return;
    }
    CGFloat scrollView_W = scrollView.bounds.size.width;
    CGFloat currentOffsetX = scrollView.contentOffset.x;
    NSInteger startIndex = floor(_startOffsetX/scrollView_W);
    NSInteger endIndex;
    CGFloat progress;
    if (currentOffsetX > _startOffsetX) {//左滑left
        progress = (currentOffsetX - _startOffsetX)/scrollView_W;
        endIndex = startIndex + 1;
        if (endIndex > self.childsVCs.count - 1) {
            endIndex = self.childsVCs.count - 1;
        }
    }else if (currentOffsetX == _startOffsetX){//没滑过去
        progress = 0;
        endIndex = startIndex;
    }else{//右滑right
        progress = (_startOffsetX - currentOffsetX)/scrollView_W;
        endIndex = startIndex - 1;
        endIndex = endIndex < 0?0:endIndex;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(MRContentViewDidScroll:startIndex:endIndex:progress:)]) {
        [self.delegate MRContentViewDidScroll:self startIndex:startIndex endIndex:endIndex progress:progress];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat scrollView_W = scrollView.bounds.size.width;
    CGFloat currentOffsetX = scrollView.contentOffset.x;
    NSInteger startIndex = floor(_startOffsetX/scrollView_W);
    NSInteger endIndex = floor(currentOffsetX/scrollView_W);
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(MRContenViewDidEndDecelerating:startIndex:endIndex:)]) {
        [self.delegate MRContenViewDidEndDecelerating:self startIndex:startIndex endIndex:endIndex];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(MRContenViewDidEndDragging:)]) {
            [self.delegate MRContenViewDidEndDragging:self];
        }
    }
}

#pragma mark setter

- (void)setContentViewCurrentIndex:(NSInteger)contentViewCurrentIndex
{
    if (contentViewCurrentIndex < 0||contentViewCurrentIndex > self.childsVCs.count-1) {
        return;
    }
    _isSelectBtn = YES;
    _contentViewCurrentIndex = contentViewCurrentIndex;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:contentViewCurrentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}

- (void)setContentViewCanScroll:(BOOL)contentViewCanScroll
{
    _contentViewCanScroll = contentViewCanScroll;
    _collectionView.scrollEnabled = _contentViewCanScroll;
}

@end
