//
//  YCCalculatorViewController.m
//  YalantisCalucalor
//
//  Created by EugeneS on 09.07.14.
//  Copyright (c) 2014 yalantis. All rights reserved.
//

#import "YCCalculatorViewController.h"
#import "YCOperation.h"

typedef enum{   Plus,
                Minus,
                Multiply,
                Divide}
                CalcOperation;

@interface YCCalculatorViewController ()

{
  CalcOperation operation;
}

@end

@implementation YCCalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.calculatoreStore = [NSString string];
    self.operation = [NSString string];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Actions
- (IBAction)sumAction:(id)sender {
    operation = Plus;
    self.calculatoreStore = self.calculatorResult.text;
    self.calculatorResult.text=@"";
}

- (IBAction)difAction:(id)sender {
    operation = Minus;
    self.calculatoreStore = self.calculatorResult.text;
    self.calculatorResult.text=@"";
}

//- (IBAction) multiplybutton {
//    operation = Multiply;
//    storage = display.text;
//    display.text=@"";
//}
//
//- (IBAction) dividebutton {
//    operation = Divide;
//    storage = display.text;
//    display.text=@"";
//}

- (IBAction)resultAction:(id)sender {
    NSString *val = self.calculatorResult.text;
    switch(operation) {
        case Plus :
            self.calculatorResult.text= [NSString stringWithFormat:@"%qi",[val longLongValue]+[self.calculatoreStore longLongValue]];
            break;
        case Minus:
            self.calculatorResult.text= [NSString stringWithFormat:@"%qi",[self.calculatoreStore longLongValue]-[val longLongValue]];
            break;
        case Divide:
            self.calculatorResult.text= [NSString stringWithFormat:@"%qi",[self.calculatoreStore longLongValue]/[val longLongValue]];
            break;
        case Multiply:
            self.calculatorResult.text= [NSString stringWithFormat:@"%qi",[val longLongValue]*[self.calculatoreStore longLongValue]];
            break;
    }
}

-(IBAction)enterNumber:(UIButton*)sender{
    NSString *result = self.calculatorResult.text;
    self.calculatorResult.text = [NSString stringWithFormat:@"%@%@",result, sender.titleLabel.text];
    if([self.operation isEqualToString:@""]){
        [self enableButtons];
    }else{
        [self enableEqualsButton];
    }
}

-(IBAction)operationAction:(UIButton *)sender{
    NSString *result = self.calculatorResult.text;
    self.calculatorResult.text = [NSString stringWithFormat:@"%@%@",result, sender.titleLabel.text];
    self.operation = sender.titleLabel.text;
    [self disableOptionButton];
}

- (IBAction)cancelAction:(UIButton *)sender {
    self.calculatorResult.text = @"";
    [self disabledOperationButton];
}

- (IBAction)equalsAction:(UIButton *)sender {
    
    YCOperation * operationModel = [[YCOperation alloc] init];
    NSString *result = self.calculatorResult.text;
    
    NSArray *stringArray = [result componentsSeparatedByString:self.operation];

     operationModel.valueOne = stringArray[0];
     operationModel.valueTwo = stringArray[1];
     operationModel.operation = self.operation;
    
    
    self.calculatorResult.text = [NSString stringWithFormat:@"%@ = %i", result, [operationModel calculate]];
    NSLog(@"%@", self.calculatorResult.text);

    [self disabledOperationButton];
}

-(void) disabledOperationButton
{
    [self disableOptionButton];
    self.operation = @"";
    self.equalButton.enabled = NO;
    
}

-(void)fixLabelResult:(int)number{
   self.calculatorResult.text = [NSString stringWithFormat:@"%@%i", self.calculatorResult.text, number];
}

-(void)enableButtons
{
    self.sumButton.enabled = YES;
    self.difButton.enabled = YES;
    self.multButton.enabled = YES;
    self.delButton.enabled = YES;
}

-(void)disableOptionButton
{
    self.sumButton.enabled = NO;
    self.difButton.enabled = NO;
    self.multButton.enabled = NO;
    self.delButton.enabled = NO;

}

-(void)enableEqualsButton
{
    self.equalButton.enabled = YES;
}

@end
