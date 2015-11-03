//
//  WordlimitTextField.h
//  TextFieldExtesion
//
//  Created by zly on 15/10/29.
//  Copyright © 2015年 Zhuluyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZLYTextField;
@protocol ZLYTextFieldDelegate <NSObject>
@optional
-(void)textFieldReturnKeyPress:(ZLYTextField *)textField;
@end


@interface ZLYTextField : UITextField

typedef NS_ENUM(NSInteger, LimitType)
{
    //截取字符串
    InterceptionString = 0,
    //无法输入
    UnableToEnter = 1
};

//textfield能够输入的最大字符串长度
@property (assign , nonatomic) NSInteger MaxWordNumber;
//长度限制样式
@property (assign , nonatomic) LimitType LimiType;          // default is 0
//是否筛除emoji表情
@property (assign , nonatomic) BOOL isEmoticons;            // default is NO
//textfield输入内容的起始坐标
@property (nonatomic         ) CGPoint   textPoint;         // default is (8,8)
//可输入字数
@property (assign , nonatomic) NSInteger canEnterWordsNumber;

@property (nonatomic, weak) id<ZLYTextFieldDelegate> returnDelegate;


//获取光标位置
- (NSRange) selectedRange;
//设置光标位置
- (void) setSelectedRange:(NSRange) range;

@end
