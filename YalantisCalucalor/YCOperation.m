//
//  YCOperation.m
//  YalantisCalucalor
//
//  Created by EugeneS on 10.07.14.
//  Copyright (c) 2014 yalantis. All rights reserved.
//

#import "YCOperation.h"

@implementation YCOperation

-(NSInteger)calculate
{
    NSInteger  valueOne = [self.valueOne integerValue];
    NSInteger  valueTwo = [self.valueTwo integerValue];
    NSInteger  result;

    
    if ([self.operation isEqualToString:@"+"]){
        result = valueOne + valueTwo;
    }
    else if ([self.operation isEqualToString:@"-"]){
        result = valueOne - valueTwo;
    }
    else if ([self.operation isEqualToString:@"*"]){
        result = valueOne * valueTwo;
    }
    else if ([self.operation isEqualToString:@"/"]){
        result = valueOne / valueTwo;
    }
    self.result = result;
    
    return result;
    
}
@end
