//
//  ViewController.m
//  ZLYTextDemo
//
//  Created by DCJ on 15/11/3.
//  Copyright © 2015年 Zhuluyi. All rights reserved.
//

#import "ViewController.h"
#import "ZLYTextField.h"
#import "ZLYTextView.h"

#define kTextFieldMaxLength 10
#define kTextViewMaxLength 80

@interface ViewController ()<ZLYTextFieldDelegate,ZLYTextViewDelegate>

@property (nonatomic, strong) ZLYTextView  * textView;
@property (nonatomic, strong) ZLYTextField * textField;
@property (nonatomic, strong) UILabel * numLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createTextField];
    [self createTextView];
}

-(void)createTextField{
    ZLYTextField * textField = [[ZLYTextField alloc]initWithFrame:CGRectMake(10, 20, self.view.frame.size.width-20, 40)];
    textField.borderStyle = UITextBorderStyleNone;
    textField.backgroundColor = [UIColor whiteColor];
    textField.layer.borderWidth = 1;
    textField.layer.borderColor = [UIColor colorWithWhite:219/255.0 alpha:1].CGColor;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeAlways;
    textField.MaxWordNumber = kTextFieldMaxLength;
    textField.LimiType = UnableToEnter;
    textField.returnDelegate = self;
    
    //不让文字左对齐
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
    textField.leftView = paddingView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:textField];
    _textField = textField;
}

-(void)createTextView
{
    ZLYTextView * textView = [[ZLYTextView alloc]initWithFrame:CGRectMake(10, 80, self.view.frame.size.width-20, 150)];
    textView.font = [UIFont systemFontOfSize:17];
    textView.layer.borderWidth = 1;
    textView.textColor = [UIColor colorWithWhite:128/255.0 alpha:1];
    textView.layer.borderColor = [UIColor colorWithWhite:219/255.0 alpha:1].CGColor;
    textView.returnKeyType = UIReturnKeyDone;
    textView.MaxWordNumber = kTextViewMaxLength;
    textView.returnDelegate = self;
    textView.LimiType = UnableToEnter;
    [self.view addSubview:textView];
    
    _textView = textView;
    
    UILabel * label = [[UILabel alloc]init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.textAlignment = NSTextAlignmentCenter;
    NSInteger count = kTextViewMaxLength-textView.text.length;
    NSInteger num = count>0?count:0;
    label.text = [NSString stringWithFormat:@"%ld",(long)num];
    label.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:label];
    _numLabel = label;
    NSLayoutConstraint * constraint1 = [NSLayoutConstraint constraintWithItem:_numLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_textView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint * constraint2 = [NSLayoutConstraint constraintWithItem:_numLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_textView attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    NSLayoutConstraint * constraint3 = [NSLayoutConstraint constraintWithItem:_numLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:30];
    NSLayoutConstraint * constraint4 = [NSLayoutConstraint constraintWithItem:_numLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:30];
    [self.view addConstraints:[NSArray arrayWithObjects:constraint1,constraint2,constraint3,constraint4, nil]];
}

-(void)rightBtnPress{
    
}

#pragma mark - ZLYTextFieldDelegate，ZLYTextViewDelegate
-(void)textFieldReturnKeyPress:(ZLYTextField *)textField
{
    [self rightBtnPress];
}

-(void)textViewReturnKeyPress:(ZLYTextView *)textView
{
    [self rightBtnPress];
}

-(void)lwTextViewDidChange:(ZLYTextView *)textView
{
    _numLabel.text = [NSString stringWithFormat:@"%ld",(long)textView.canEnterWordsNumber];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
