//
//  TLPSceneCreationPanelView.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPLevelCreationPanelView.h"
#import "TLPSceneCreationInputTextFieldView.h"

@interface TLPLevelCreationPanelView()

@property(nonatomic) TLPSceneCreationInputTextFieldView *widthTF;
@property(nonatomic) TLPSceneCreationInputTextFieldView *heightTF;

@end

@implementation TLPLevelCreationPanelView

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
    _heightTF = [[TLPSceneCreationInputTextFieldView alloc] initWithFrame:heightFrame andTag:kHeightTextFieldTag];
    _heightTF.tfDelegate = self;
    [_heightTF setPlaceHolderText:@"1000"];
    [self addSubview:_heightTF];
}

- (void)setWidthTFAsFirstResponder
{
    [_widthTF becomeFirstResponder];
}

- (CGSize)levelSize
{
    return CGSizeMake([_widthTF.textField.text floatValue], [_heightTF.textField.text floatValue]);
}

#pragma mark - DELEGATEZ BRO!
- (void)textFieldDidFinishEditing:(UITextField *)textField
{
    [self.tfDelegate textFieldDidFinishEditing:textField];
}

@end
