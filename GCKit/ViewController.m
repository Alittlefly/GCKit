//
//  ViewController.m
//  GCKit
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 GaoChao. All rights reserved.
//

#import "ViewController.h"
#import "GCKit-umbrella.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    GCCornerGradientView *hh = [[GCCornerGradientView alloc] init];
    [hh setFrame:CGRectMake(200,300, 100, 40)];
    [hh setCorner:(UIRectCornerTopLeft | UIRectCornerBottomRight)];
    [hh setColors:@[(id)UIColor.redColor.CGColor,(id)UIColor.blueColor.CGColor]];
    [self.view addSubview:hh];
    
    [self.view gc_showLoading];
    
}


@end
