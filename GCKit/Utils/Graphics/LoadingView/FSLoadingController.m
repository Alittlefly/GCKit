//
//  FSLoadingController.m
//  Lolly
//
//  Created by Charles on 2017/11/7.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import "FSLoadingController.h"
#import "FSLoadingView.h"

@interface FSLoadingController ()
@property(nonatomic,strong)FSLoadingView *loadingView;
@end

@implementation FSLoadingController

- (FSLoadingView *)loadingView {
    if (!_loadingView) {
        _loadingView = [[FSLoadingView alloc] initWithFrame:self.view.bounds];
    }
    return _loadingView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.loadingView];
    
    [self.view setBackgroundColor:[UIColor clearColor]];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.loadingView loadingViewShow];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.loadingView loadingViewhide];
}

- (UIModalPresentationStyle)modalPresentationStyle {
    return UIModalPresentationOverCurrentContext;
}
- (UIModalTransitionStyle)modalTransitionStyle{
    return UIModalTransitionStyleCrossDissolve;
}
@end
