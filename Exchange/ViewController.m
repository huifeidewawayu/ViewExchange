//
//  ViewController.m
//  Exchange
//
//  Created by wurui on 17/2/28.
//  Copyright © 2017年 wurui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)UIView *colorView;
@property (nonatomic, strong)UIButton *upButton;
@property (nonatomic, strong)UIButton *downButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubviews];
}

- (void)setupSubviews {
    
    NSArray *colorArray = @[[UIColor redColor],[UIColor orangeColor],[UIColor cyanColor],[UIColor grayColor],[UIColor blueColor],[UIColor blackColor]];
    
    for (int i = 0; i<5; i++) {
        _colorView = [[UIView alloc] initWithFrame:CGRectMake(100, 50 + 80*i, 150, 60)];
        _colorView.backgroundColor = colorArray[i];
        _colorView.tag = 101 + i;
        
        _downButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _downButton.frame = CGRectMake(0, 30, 150, 30);
        [_downButton setTitle:@"下移" forState:UIControlStateNormal];
        [_downButton addTarget:self action:@selector(downAction:) forControlEvents:UIControlEventTouchUpInside];
        
        _upButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _upButton.frame = CGRectMake(0, 0, 150, 30);
        [_upButton setTitle:@"上移" forState:UIControlStateNormal];
        [_upButton addTarget:self action:@selector(upAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_colorView];
        [_colorView addSubview:_downButton];
        [_colorView addSubview:_upButton];
    }
}

- (void)downAction:(UIButton *)button {
  
    UIView *view = (UIView *)[button superview];
    UIView *selectView = [self.view viewWithTag:view.tag];
    UIView *belowView = [self.view viewWithTag:view.tag + 1];
    
    if (selectView.tag != 106) {
        [UIView animateWithDuration:.5 animations:^{
            selectView.transform = CGAffineTransformTranslate(selectView.transform, 0, 80);
            belowView.transform = CGAffineTransformTranslate(belowView.transform, 0, -80);
        } completion:^(BOOL finished) {
            selectView.tag = selectView.tag + 1;
            belowView.tag = belowView.tag - 1;
        }];
    }
}

- (void)upAction:(UIButton *)button {
    
    UIView *view = (UIView *)[button superview];
    UIView *selectView = [self.view viewWithTag:view.tag];
    UIView *belowView = [self.view viewWithTag:view.tag - 1];
    
    if (selectView.tag != 101) {
        [UIView animateWithDuration:.5 animations:^{
            selectView.transform = CGAffineTransformTranslate(selectView.transform, 0, -80);
            belowView.transform = CGAffineTransformTranslate(belowView.transform, 0, 80);
        } completion:^(BOOL finished) {
            selectView.tag = selectView.tag - 1;
            belowView.tag = belowView.tag + 1;
        }];
    }
}

@end
