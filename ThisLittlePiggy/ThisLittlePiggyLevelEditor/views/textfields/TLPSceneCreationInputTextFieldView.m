//
//  TLPSceneCreationInputTextFieldView.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPSceneCreationInputTextFieldView.h"
#import "UIColor+ThisLittlePiggy.h"
#import "TLPFontHelper.h"

@interface TLPSceneCreationInputTextFieldView()

@property(nonatomic) UITextField *textField;

@end

@implementation TLPSceneCreationInputTextFieldView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor thisLittlePiggySkyBlue];
        [self buildTextField];
    }
    return self;
}

- (void)buildTextField
{
    CGRect tfRect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    _textField = [[UITextField alloc] initWithFrame:tfRect];
    _textField.font = [TLPFontHelper getFont:TLPFontRalewayMedium withSize:TLPFontSizeCityNameLarge];
    _textField.textColor = [UIColor whiteColor];
    _textField.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_textField];
}

- (void)setPlaceHolderText:(NSString*)text
{
    _textField.text = text;
}


@end
