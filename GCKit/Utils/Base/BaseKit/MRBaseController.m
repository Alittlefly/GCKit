//
//  MRBaseController.m
//  Mrxs
//
//  Created by mac on 2019/3/28.
//  Copyright © 2019年 Fly. All rights reserved.
//

#import "MRBaseController.h"
#import <UINavigationBar+Awesome.h>

@interface MRBaseController ()
@property(nonatomic,strong)UILabel *titleLabel;
@end

@implementation MRBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:HexRGB(0xF4F4F4)];
    
    self.navigationItem.titleView = self.titleLabel;
    [self createSubviews];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.titleLabel setTextColor:[self preferredTitleColor]];
    
    [self.navigationController.navigationBar lt_setBackgroundColor:[self preferredNavbarColor]];
}
- (void)setTitle:(NSString *)title {
    [self.titleLabel setText:title];
    [self.titleLabel sizeToFit];
}
- (void)createSubviews {}

- (UIColor *)preferredTitleColor {
    return [UIColor blackColor];
}
- (UIColor *)preferredNavbarColor {
    return [UIColor whiteColor];
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont systemFontOfSize:18 weight:(UIFontWeightBold)]];
    }
    return _titleLabel;
}
@end
