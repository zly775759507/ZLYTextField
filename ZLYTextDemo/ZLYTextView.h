//
//  WordlimitTextView.h
//  TextFieldExtesion
//
//  Created by zly on 15/10/29.
//  Copyright © 2015年 Zhuluyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZLYTextView;
@protocol ZLYTextViewDelegate <NSObject>
@optional
-(void)textViewReturnKeyPress:(ZLYTextView *)textView;
-(void)lwTextViewDidChange:(ZLYTextView *)textView;
@end

@interface ZLYTextView : UITextView

typedef NS_ENUM(NSInteger, LimitTextType)
{
    //截取字符串
    InterceptionStringTextView = 0,
    //无法输入
    UnableToEnterTextView = 1
};


//textview能够输入的最大字符串长度
@property (assign , nonatomic) NSInteger MaxWordNumber;
//长度限制样式
@property (assign , nonatomic) LimitTextType LimiType;          // default is 0
//是否筛除emoji表情
@property (assign , nonatomic) BOOL isEmoticons;     // default is NO
//textfield输入内容的起始坐标
@property (nonatomic         ) CGPoint   textPoint;   // default is (8,8)
//可输入字数
@property (assign , nonatomic) NSInteger canEnterWordsNumber;

@property (nonatomic, weak) id<ZLYTextViewDelegate> returnDelegate;


//获取光标位置
- (NSRange) selectedRange;
//设置光标位置
- (void) setSelectedRange:(NSRange) range;

@end
