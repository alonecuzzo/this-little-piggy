//
//  TLPSceneCreationPanelView.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPSceneCreationPanelView.h"
#import "TLPSceneCreationInputTextFieldView.h"

@interface TLPSceneCreationPanelView()

@property(nonatomic) TLPSceneCreationInputTextFieldView *widthTF;

@end

@implementation TLPSceneCreationPanelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        [self createTextFields];
    }
    return self;
}

- (void)createTextFields
{
    CGFloat leftMargin = 20;
    CGFloat topMargin = 40;
    CGFloat tfHeight = 70;
    
    CGRect widthFrame = CGRectMake(leftMargin, topMargin, self.frame.size.width - leftMargin*2, tfHeight);
    _widthTF = [[TLPSceneCreationInputTextFieldView alloc] initWithFrame:widthFrame andTag:kWidthTextFieldTag];
    _widthTF.tfDelegate = self;
    [_widthTF setPlaceHolderText:@"2048"];
    [self addSubview:_widthTF];
    
    CGRect heightFrame = CGRectMake(leftMargin, _widthTF.frame.size.height + _widthTF.frame.origin.y + topMargin, _widthTF.frame.size.width, tfHeight);
    TLPSceneCreationInputTextFieldView *heightTF = [[TLPSceneCreationInputTextFieldView alloc] initWithFrame:heightFrame andTag:kHeightTextFieldTag];
    heightTF.tfDelegate = self;
    [heightTF setPlaceHolderText:@"1000"];
    [self addSubview:heightTF];
}

- (void)setWidthTFAsFirstResponder
{
    [_widthTF becomeFirstResponder];
}

#pragma mark - DELEGATEZ BRO!
- (void)textFieldDidFinishEditing:(UITextField *)textField
{
    [self.tfDelegate textFieldDidFinishEditing:textField];
}

@end
