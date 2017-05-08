//
//  myclass.m
//  Invocation
//
//  Created by 张友波 on 16/7/19.
//  Copyright © 2016年 张友波. All rights reserved.
//

#import "myclass.h"

@implementation myclass

-(id)init
{
    self=[super init];
    if (self) {
        
    }
    return self;
}

- (NSString *)appendMyString:(NSString *)string1 and:(NSString *)string2
{
     NSString *mString = [NSString stringWithFormat:@"%@  %@  after append method", string1,string2];
     return mString;
}


@end
