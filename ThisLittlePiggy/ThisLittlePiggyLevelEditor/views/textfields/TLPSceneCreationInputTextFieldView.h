//
//  TLPSceneCreationInputTextFieldView.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TLPSceneCreationInputTextFieldViewDelegate <NSObject>

- (void)textFieldDidFinishEditing:(UITextField*)textField;

@end

@interface TLPSceneCreationInputTextFieldView : UIView <UITextFieldDelegate>

@property(weak) id <TLPSceneCreationInputTextFieldViewDelegate> tfDelegate;

- (id)initWithFrame:(CGRect)frame andTag:(int)tag;
- (void)setPlaceHolderText:(NSString*)text;

@end
