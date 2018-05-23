//
//  BViewControllerm
//  YRouterDemo
//
//  Created by 悠然一指 on 2018/5/22.
//  Copyright © 2018年 juangua. All rights reserved.
//

#import "BViewController.h"

#import <YRouter/YRouter.h>

@interface BViewController ()

@end

@implementation BViewController

+ (void)load {
    [YRouter registerURLPattern:B_PAGE toHandler:^(NSDictionary *routerParameters) {
        id ID = [routerParameters objectForKey:@"id"];
        NSLog(@"Page ID: %@", ID);
        UINavigationController *rootVC = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        UIViewController *aVC = [[BViewController alloc] init];
        [rootVC pushViewController:aVC animated:YES];
        if ([routerParameters objectForKey:YRouterParameterCompletion]) {
            YRouterHandler handler = [routerParameters objectForKey:YRouterParameterCompletion];
            handler(routerParameters);
        }
    }];
    
    [YRouter registerURLPattern:B_FUNCTION_SUM toObjectHandler:^id(NSDictionary *routerParameters) {
        return @(([[routerParameters objectForKey:@"a"] integerValue] + [[routerParameters objectForKey:@"b"] integerValue]) | 0xFFFF);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationItem.title = @"Page B";
}

@end
