//
//  FSContainerController.m
//  Ready
//
//  Created by mac on 2018/7/19.
//  Copyright © 2018年 Fission. All rights reserved.
//
#import "GCContainerController.h"

CGFloat const FSContainerControllerAnimationTime = 0.28f;
@interface GCContainerController ()<UIGestureRecognizerDelegate>
{
    UIScreenEdgePanGestureRecognizer *_edgePanGesture;
    UIPanGestureRecognizer *_openedPanGesture;
    UITapGestureRecognizer *_tapGesture;
    CGPoint _startPoint;
    BOOL _opened;
}
@property(nonatomic,strong)UIViewController *centerController;
@property(nonatomic,strong)UIViewController<GCSideControllerProtocol> *leftController;

@property(nonatomic,strong)UIView *centerContainer;
@property(nonatomic,strong)UIView *leftContainer;
@property(nonatomic,strong)UIView *overLayView;

@property(nonatomic,assign,getter=isAnimating)BOOL animating;
@end

@implementation GCContainerController
- (UIView *)overLayView {
    if (!_overLayView) {
         _overLayView = [[UIView alloc] init];
        [_overLayView setBackgroundColor:HexRGBAlpha_GC(0x000000, 0.22)];
        [self.view addSubview:self.overLayView];
    }
    return _overLayView;
}
- (UIView *)centerContainer {
    if (!_centerContainer) {
        _centerContainer = [[UIView alloc] init];
        [_centerContainer setFrame:self.view.bounds];
        [self.view addSubview:_centerContainer];
    }
    return _centerContainer;
}
- (UIView *)leftContainer {
    if (!_leftContainer) {
        _leftContainer = [[UIView alloc] init];
        [self.view addSubview:_leftContainer];
    }
    return _leftContainer;
}
- (UITabBarController *)tabbarCenterController {
    return (UITabBarController *)self.centerController;
}
- (instancetype)initWithCenterController:(UIViewController *)centerController leftController:(UIViewController<GCSideControllerProtocol> *)leftController {
    if (self = [super init]) {
         self.centerController = centerController;
         self.leftController = leftController;
        
        [self addChildViewController:self.centerController];
        [self addChildViewController:self.leftController];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layoutViews];
    
    if (_enableEdgePan) {
        [self createEdgePanGesture];
    }
    
    [self createTapClose];
    
    _opened = NO;
}
- (void)layoutViews {

    
    
    [self.centerContainer addSubview:self.centerController.view];
    [self.overLayView setFrame:self.view.bounds];
    [self.overLayView setHidden:YES];
    [self.leftContainer addSubview:self.leftController.view];
    [self.leftContainer setFrame:CGRectMake(- _maximumLeftWidth, 0, _maximumLeftWidth, CGRectGetHeight(self.view.bounds))];
    [self.leftController.view setFrame:self.leftContainer.bounds];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.centerController beginAppearanceTransition:YES animated:NO];
    [self.leftController beginAppearanceTransition:YES animated:NO];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.centerController endAppearanceTransition];
    [self.leftController endAppearanceTransition];
}
- (void)createEdgePanGesture {
    if (!_edgePanGesture) {
         _edgePanGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePanToShowView:)];
        [_edgePanGesture setDelegate:self];
        [_edgePanGesture setEdges:UIRectEdgeLeft];
    }
    [self.view addGestureRecognizer:_edgePanGesture];
}

- (void)createOpenPan {
    
    if (!_openedPanGesture) {
         _openedPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePanToShowView:)];
        [_openedPanGesture setDelegate:self];
    }
    
    [self.view addGestureRecognizer:_openedPanGesture];

}

- (void)createTapClose {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapViewToClose:)];
    _tapGesture = tapGesture;
    [self.overLayView addGestureRecognizer:tapGesture];
}

// 执行动画过程中不处理
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([gestureRecognizer isEqual:_edgePanGesture]) {
        BOOL isRoot = [self topControllerIsRootController];
        return !self.isAnimating && !_opened && _enableEdgePan && isRoot;
    }
    
    if ([gestureRecognizer isEqual:_openedPanGesture]) {
        return !self.isAnimating && _opened;
    }
    
    return YES;
}

-(void)tapViewToClose:(UITapGestureRecognizer *)tapGesture{
    if (!self.isAnimating) {
        [self closeLeftSide];
    }
}

- (void)edgePanToShowView:(UIPanGestureRecognizer *)panGesture{

    UIGestureRecognizerState state = panGesture.state;
    switch (state) {
        case UIGestureRecognizerStateBegan:
        {
            CGPoint transationPoint = [panGesture translationInView:self.view];
            _startPoint = transationPoint;
            [self.overLayView setHidden:NO];
            [self.overLayView removeGestureRecognizer:_tapGesture];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint transationPoint = [panGesture translationInView:self.view];
            CGFloat offsetX = transationPoint.x - _startPoint.x;
            CGFloat currentTranstionX = _maximumLeftWidth + offsetX;
            if (!_opened) {
                // 未打开
                if (offsetX <= _maximumLeftWidth) {
                    self.leftContainer.transform = CGAffineTransformMakeTranslation(offsetX, 0);
                }else if(offsetX <= 0){
                    self.leftContainer.transform = CGAffineTransformIdentity;
                }else{
                    self.leftContainer.transform = CGAffineTransformMakeTranslation(_maximumLeftWidth, 0);
                }
                
            }else{
                // 打开
                if (currentTranstionX >= _maximumLeftWidth) {
                    self.leftContainer.transform = CGAffineTransformMakeTranslation(_maximumLeftWidth, 0);
                }else if(currentTranstionX <= 0){
                    self.leftContainer.transform = CGAffineTransformIdentity;
                }else{
                    self.leftContainer.transform = CGAffineTransformMakeTranslation(currentTranstionX, 0);
                }
            }

        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            CGPoint transationPoint = [panGesture translationInView:self.view];
            CGFloat offsetX = transationPoint.x - _startPoint.x;
            CGFloat currentTranstionX = _maximumLeftWidth + offsetX;

            BOOL shouldOpen = _opened?(currentTranstionX >= _maximumLeftWidth/2.0):(offsetX >= _maximumLeftWidth/2.0);
            if (shouldOpen) {
                [self openLeftSide];
            }else {
                [self closeLeftSide];
            }
            [self.overLayView addGestureRecognizer:_tapGesture];
        }
            break;
        default:
            break;
    }
    
}

- (void)openLeftSide {
    
    [self setAnimating:YES];
    [self.overLayView setHidden:NO];
    [UIView animateWithDuration:FSContainerControllerAnimationTime animations:^{
        [self.leftContainer setTransform:CGAffineTransformMakeTranslation(self->_maximumLeftWidth, 0)];
    } completion:^(BOOL finished) {
        [self setAnimating:NO];
    }];
    _opened = YES;
    
    if ([self.leftController respondsToSelector:@selector(sideControllerDidOpen)]) {
        [self.leftController sideControllerDidOpen];
    }
    
    if(_enableEdgePan) [self createOpenPan];
}

- (void)closeLeftSide {
    [self setAnimating:YES];
    [UIView animateWithDuration:FSContainerControllerAnimationTime animations:^{
        [self.leftContainer setTransform:CGAffineTransformIdentity];
    } completion:^(BOOL finished) {
        [self setAnimating:NO];
        [self.overLayView setHidden:YES];
    }];
    
    if ([self.leftController respondsToSelector:@selector(sideControllerDidClose)]) {
        [self.leftController sideControllerDidClose];
    }
    _opened = NO;
    
    if(_enableEdgePan) [self.view removeGestureRecognizer:_openedPanGesture];
}
- (BOOL)topControllerIsRootController{
    if ([self.centerController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabController = (UITabBarController *)self.centerController;
        
        if (tabController.presentedViewController) {
            return NO;
        }
        
        if ([tabController.selectedViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *currentSelected = (UINavigationController *)tabController.selectedViewController;
            return currentSelected.childViewControllers.count == 1;
        }
    }else if ([self.centerController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *currentSelected = (UINavigationController *)self.centerController;
        return currentSelected.childViewControllers.count == 1;
    }
    
    return YES;
}
- (UIViewController *)childViewControllerForStatusBarHidden {
    return self.centerController;
}
- (void)dealloc {
    NSLog(@"fscontainerController dealloc");
}
@end
