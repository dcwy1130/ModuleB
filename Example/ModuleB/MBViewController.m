//
//  MBViewController.m
//  ModuleB
//
//  Created by dcwy1130 on 05/23/2018.
//  Copyright (c) 2018 dcwy1130. All rights reserved.
//

#import "MBViewController.h"

#import <YRouter/YRouter.h>

@interface MBViewController ()

@end

@implementation MBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *skipButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [skipButton setTitle:@"跳转" forState:UIControlStateNormal];
    [skipButton sizeToFit];
    skipButton.center = CGPointMake(100, self.view.center.y);
    [skipButton addTarget:self action:@selector(skipAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:skipButton];
    
    UIButton *calculateButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [calculateButton setTitle:@"求和" forState:UIControlStateNormal];
    [calculateButton sizeToFit];
    calculateButton.center = CGPointMake(150, self.view.center.y);
    [calculateButton addTarget:self action:@selector(calculateAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:calculateButton];
}

- (void)skipAction {
    // #define A_PAGE @"A://page/:id"
    [YRouter openURL:@"B://page/404" completion:^(id result) {
        NSLog(@"Result: %@", result);
    }];
}

- (void)calculateAction {
    //    #define A_FUNCTION_SUM @"A://function/sum"
    NSNumber *result = [YRouter objectForURL:@"B://function/sum?a=1&b=2"];
    NSLog(@"Result: %@", result);
}

@end
