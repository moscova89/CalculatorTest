//
//  ViewController.m
//  Calculator
//
//  Copyright (c) 2014 American Well. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray* operandStack;
@property (nonatomic, assign) BOOL currentlyEnteringNumber;

@end


static const  NSString* kPlus = @"+";
static const  NSString* kMinus = @"-";

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _operandStack = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Handlers

- (IBAction)handleDigitTapped:(UIButton*)sender
{
    if (!self.currentlyEnteringNumber) {
        self.display.text = [NSString stringWithFormat:@"%@", @(sender.tag)];
        self.currentlyEnteringNumber = YES;
    }
    else {
        self.display.text = [self.display.text stringByAppendingString:[NSString stringWithFormat:@"%@", @(sender.tag)]];
    }
}

- (IBAction)handleEnterTapped:(id)sender
{
    [self.operandStack addObject:@([self.display.text intValue]) ];
    self.currentlyEnteringNumber = NO;
}

- (IBAction)handleClearTapped:(UIButton *)sender {
    [self.operandStack removeAllObjects];
    self.display.text = @"0";
}

- (IBAction)handleOperatorTapped:(UIButton*)sender
{
    if (self.currentlyEnteringNumber) {
        [self handleEnterTapped:nil];
    }
    [self performOperation:sender.currentTitle];
}

#pragma mark - Buisness Logic

- (void)performOperation:(NSString*)operator
{
    
    if(_operandStack.count == 0){
        return;
    }
    
    int displayInteger = 0;
    
    if([operator isEqualToString:kPlus]){
        for (NSNumber* number in _operandStack) {
            displayInteger += number.intValue;
        }
        [_operandStack removeAllObjects];
        [_operandStack addObject:@(displayInteger)];
        self.display.text = [NSString stringWithFormat:@"%d",displayInteger];
    }else if( [operator isEqualToString:kMinus] ){
        displayInteger = [[_operandStack firstObject]intValue];
        
        for(int i = 1; i < _operandStack.count; ++i){
            displayInteger -= [[_operandStack objectAtIndex:i] intValue];
        }
        [_operandStack removeAllObjects];
        [_operandStack addObject:@(displayInteger)];
        self.display.text = [NSString stringWithFormat:@"%d",displayInteger];
        
        
    }else{
        NSLog(@" YOU BROKE THE RULES!");
    }
    
    // ?
}

@end
