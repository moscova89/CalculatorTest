//
//  ViewController.h
//  Calculator
//
//  Copyright (c) 2014 American Well. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;

- (IBAction)handleDigitTapped:(UIButton*)sender;

- (IBAction)handleEnterTapped:(UIButton*)sender;

- (IBAction)handleClearTapped:(UIButton *)sender;

- (IBAction)handleOperatorTapped:(UIButton*)sender;

@end
