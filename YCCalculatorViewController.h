//
//  YCCalculatorViewController.h
//  YalantisCalucalor
//
//  Created by EugeneS on 09.07.14.
//  Copyright (c) 2014 yalantis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCCalculatorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *calculatorResult;
@property (strong, nonatomic) NSString *calculatoreStore;
@property (weak, nonatomic) IBOutlet UIButton *sumButton;
@property (weak, nonatomic) IBOutlet UIButton *difButton;
@property (weak, nonatomic) IBOutlet UIButton *equalButton;
@property (weak, nonatomic) IBOutlet UIButton *multButton;

@property (weak, nonatomic) IBOutlet UIButton *delButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

//@property (strong, nonatomic) NSString * valueOne;
//@property (strong, nonatomic) NSString * valueTwo;
@property (strong, nonatomic) NSString * operation;
-(IBAction)enterNumber:(UIButton*)sender;
-(IBAction)operationAction:(UIButton*)sender;
- (IBAction)cancelAction:(UIButton *)sender;

- (IBAction)equalsAction:(UIButton *)sender;

@end
