//
//  ViewController.m
//  Invocation
//
//  Created by 张友波 on 16/7/19.
//  Copyright © 2016年 张友波. All rights reserved.
//

#import "ViewController.h"
#import "myclass.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    myclass *myClass = [[myclass alloc] init];
    NSString *myString1 = @"My string 1";
    NSString *myString2 = @"My string 2";
   
    //普通调用
   // NSString *normalInvokeString = [myClass appendMyString:myString];
   // NSLog(@"The normal invoke string is: %@", normalInvokeString);
    
    //NSString *performInvokeString=[myClass performSelector:@selector(appendMyString:) withObject:myString];
   // NSLog(@"The perform invoke string is: %@", performInvokeString);
    
    
    //NSInvocation调用
    SEL mySelector = @selector(appendMyString:and:);
    NSMethodSignature * sig = [[myClass class]instanceMethodSignatureForSelector:mySelector];
    
    NSInvocation * myInvocation = [NSInvocation invocationWithMethodSignature:sig];
    [myInvocation setTarget: myClass];
    [myInvocation setSelector: mySelector];
    
    /***这里说明一下[myInvocation setArgument: &myString atIndex: 2];为什么index从2开始 ，原因为：0 1 两个参数已经被target 和selector占用。****/
    [myInvocation setArgument: &myString1 atIndex: 2];
    [myInvocation setArgument: &myString2 atIndex: 3];
    
    NSString * result = nil;
    [myInvocation invoke];
    [myInvocation getReturnValue: &result];
    NSLog(@"The NSInvocation invoke string is: %@", result);
    
    NSString *str;
    [myInvocation getArgument:&str atIndex:2];
    NSLog(@"The Argument string is: %@", str);
  
    /*在 iOS中可以直接调用某个对象的消息方式有两种：
     
     一种是performSelector:withObject；
     
     再一种就是NSInvocation。
     
     第一种方式比较简单，能完成简单的调用。但是对于>2个的参数或者有返回值的处理，那就需要做些额外工作才能搞定。那么在这种情况下，我们就可以使用NSInvocation来进行这些相对复杂的操作。*/
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
