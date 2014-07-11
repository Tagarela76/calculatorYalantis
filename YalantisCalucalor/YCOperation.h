//
//  YCOperation.h
//  YalantisCalucalor
//
//  Created by EugeneS on 10.07.14.
//  Copyright (c) 2014 yalantis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCOperation : NSObject
@property (strong, nonatomic) NSString *valueOne;
@property (strong, nonatomic) NSString *valueTwo;
@property (strong, nonatomic) NSString *operation;
@property (assign, nonatomic) NSInteger result;

-(NSInteger) calculate;
@end
