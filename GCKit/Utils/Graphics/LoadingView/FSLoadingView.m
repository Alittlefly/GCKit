//
//  FSLoadingView.m
//  FlyShow
//
//  Created by shawnfeng on 16/1/9.
//  Copyright © 2016年 高超. All rights reserved.
//

#import "FSLoadingView.h"
#import "GCKitFunctionHeader.h"

//#import "UIView+Animation.h"
@interface FSLoadingView()
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIView  *loadingBack;
@property(nonatomic,strong)UIVisualEffectView  *effectView;
@property(nonatomic,strong)UIActivityIndicatorView *indictor;
@property(nonatomic,strong)UIView  *enableView;
//@property(nonatomic,strong)UIImageView *indictor;
@end
@implementation FSLoadingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (UIVisualEffectView *)effectView {
    if (!_effectView) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:(UIBlurEffectStyleExtraLight)];
        _effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    }
    return _effectView;
}
- (void)dealloc{

}
- (UIActivityIndicatorView *)indictor {
    if(!_indictor){
        _indictor = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray)];
    }
    return _indictor;
}
//- (UIImageView *)indictor {
//    if (!_indictor) {
//         _indictor = [[UIImageView alloc] init];
////        [_indictor setImage:[UIImage imageNamed:@"icon_loading_default"]];
////        [_indictor addRotateAnimation:1.0f];
//        [_indictor setBackgroundColor:[UIColor clearColor]];
//        [_indictor.layer setSpeed:0.0];
//    }
//    return _indictor;
//}
-(UIView *)enableView
{
    if (!_enableView) {
         _enableView = [[UIView alloc] init];
        [_enableView setUserInteractionEnabled:YES];
    }
    return _enableView;
}
-(UILabel *)titleLabel
{
    if (!_titleLabel) {
         _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont systemFontOfSize:16]];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        [_titleLabel setTextColor:[UIColor whiteColor]];
        [_titleLabel setText:@"Loading"];
    }
    return _titleLabel;
}
-(UIView *)loadingBack
{
    if (!_loadingBack) {
        _loadingBack = [[UIView alloc] init];
        [self addSubview:_loadingBack];
    }
    return _loadingBack;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self creatSubViews:frame];
    }
    return self;
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self creatSubViews:frame];
}
-(void)creatSubViews:(CGRect)frame
{
    [self.enableView setFrame:self.bounds];
    
    [self.loadingBack.layer setCornerRadius:20];
    [self.loadingBack.layer setMasksToBounds:YES];
    [self.loadingBack addSubview:self.effectView];

    [self addSubview:self.indictor];
    [self.loadingBack setBackgroundColor:[UIColor clearColor]];
    [self setBackgroundColor:HexRGBAlpha_GC(0x000000, 0.0)];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat loadIngBackWH = 100;
    [self.loadingBack setFrame:CGRectMake(0,0,loadIngBackWH, loadIngBackWH)];
    [self.loadingBack setCenter:CGPointMake(CGRectGetWidth(self.bounds)/2.0, CGRectGetHeight(self.bounds)/2.0)];
    [self.effectView setFrame:self.loadingBack.bounds];

//    [self.indictor  setFrame:CGRectMake(0, 0, 38, 38)];
    [self.indictor  setCenter:self.loadingBack.center];
}
- (BOOL)isLoading{
    
    return _indictor.isAnimating;
    
//    return ([self.indictor.layer speed] == 1.0);
}

- (void)loadingViewShow;
{
    [self setHidden:NO];
//    [_titleLabel setText:[FSSharedLanguages CustomLocalizedStringWithKey:@"Loading"]];
    [_indictor startAnimating];
//    [self.indictor.layer setSpeed:1.0];
}
- (void)loadingViewhide;
{
    [_indictor stopAnimating];
//    [self.indictor.layer setSpeed:0.0];
    [self setHidden:YES];
}
@end
