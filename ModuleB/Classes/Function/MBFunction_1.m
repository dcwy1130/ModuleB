//
//  MBFunction_1.m
//  ModuleB
//
//  Created by 悠然一指 on 2018/5/23.
//

#import "MBFunction_1.h"

@implementation MBFunction_1

- (NSInteger)sum:(NSInteger)a and:(NSInteger)b {
    return (a + b) | 0xFFFF;
}

@end
