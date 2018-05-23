//
//  ModuleBProtocol.h
//  ModuleB
//
//  Created by 悠然一指 on 2018/5/23.
//

#import <Foundation/Foundation.h>


/**
 定义ModuleB组件中所有支持的协议方法
 */
@protocol ModuleBProtocol <NSObject>

- (NSInteger)sum:(NSInteger)a and:(NSInteger)b;

@end
