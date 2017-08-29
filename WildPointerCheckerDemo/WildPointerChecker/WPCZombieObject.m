//
//  WPCZombieObject.m
//  WildPointerCheckerDemo
//
//  Created by RenTongtong on 16/8/26.
//  Copyright © 2016年 hdurtt. All rights reserved.
//

#import "WPCZombieObject.h"
#import <objc/runtime.h>

@implementation WPCZombieObject

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    NSLog(@"发生野指针的Class:%@,Selector:%@", NSStringFromClass(self.origClass), NSStringFromSelector(aSelector));
    abort();
    return nil;
}

- (void)dealloc
{
    NSLog(@"发生野指针的Class:%@,Selector:%@", NSStringFromClass(self.origClass), @"dealloc");
    abort();
}

@end
