//
//  TLPSceneCreationPanelView.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPSceneCreationPanelView.h"
#import "TLPSceneCreationInputTextFieldView.h"

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
    TLPSceneCreationInputTextFieldView *widthTF = [[TLPSceneCreationInputTextFieldView alloc] initWithFrame:widthFrame andTag:kWidthTextFieldTag];
    widthTF.tfDelegate = self;
    [widthTF setPlaceHolderText:@"1024"];
    [self addSubview:widthTF];
    
    CGRect heightFrame = CGRectMake(leftMargin, widthTF.frame.size.height + widthTF.frame.origin.y + topMargin, widthTF.frame.size.width, tfHeight);
    TLPSceneCreationInputTextFieldView *heightTF = [[TLPSceneCreationInputTextFieldView alloc] initWithFrame:heightFrame andTag:kHeightTextFieldTag];
    heightTF.tfDelegate = self;
    [heightTF setPlaceHolderText:@"768"];
    [self addSubview:heightTF];
}

#pragma mark - DELEGATEZ BRO!
- (void)textFieldDidFinishEditing:(UITextField *)textField
{
    [self.tfDelegate textFieldDidFinishEditing:textField];
}

@end
