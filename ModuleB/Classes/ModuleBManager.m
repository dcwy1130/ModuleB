//
//  ModuleBManager.m
//  ModuleB
//
//  Created by 悠然一指 on 2018/5/23.
//

#import "ModuleBManager.h"
#import "MBFunction_1.h"

#import <YRouter/YModuleManager.h>

@implementation ModuleBManager

+ (instancetype)sharedInstance {
    static ModuleBManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        [self registerModule];
    }
    return self;
}

- (void)registerModule {
    [YModuleManager registerClass:[MBFunction_1 class] forProtocol:@protocol(ModuleBProtocol)];
}

// MARK: - YModuleProtocol
- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%@: %@", self.class, NSStringFromSelector(_cmd));
}

@end
