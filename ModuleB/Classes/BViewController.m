//
//  BViewControllerm
//  MGJRouterDemo
//
//  Created by 悠然一指 on 2018/5/22.
//  Copyright © 2018年 juangua. All rights reserved.
//

#import "BViewController.h"

#import <MGJRouter/MGJRouter.h>

@interface BViewController ()

@end

@implementation BViewController

+ (void)load {
    [MGJRouter registerURLPattern:B_PAGE toHandler:^(NSDictionary *routerParameters) {
        id ID = [routerParameters objectForKey:@"id"];
        NSLog(@"Page ID: %@", ID);
        UINavigationController *rootVC = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        UIViewController *aVC = [[BViewController alloc] init];
        [rootVC pushViewController:aVC animated:YES];
        if ([routerParameters objectForKey:MGJRouterParameterCompletion]) {
            MGJRouterHandler handler = [routerParameters objectForKey:MGJRouterParameterCompletion];
            handler(routerParameters);
        }
    }];
    
    [MGJRouter registerURLPattern:B_FUNCTION_SUM toObjectHandler:^id(NSDictionary *routerParameters) {
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
