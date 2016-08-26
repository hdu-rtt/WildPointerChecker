//
//  ViewController.m
//  WildPointerCheckerDemo
//
//  Created by RenTongtong on 16/8/26.
//  Copyright © 2016年 hdurtt. All rights reserved.
//

#import "ViewController.h"
#import "WildPointerChecker/WildPointerChecker.h"

@interface foo : NSObject

- (void)hello;

@end

@implementation foo

- (void)hello
{
    NSLog(@"say hello");
}

@end

@interface ViewController ()

@property (nonatomic, assign) id delegate; //sometimes the property is assign may be unsafe

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    startWildPointerCheck();
    
    //the delegate object
    foo *obj = [[foo alloc] init];
    self.delegate = obj;
    //release obj
    obj = nil;
    //delegate is wild pointer when startWildPointerCheck() should be crash immediately
    [self.delegate hello];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
