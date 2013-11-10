//
//  TLPSceneCreationPanelView.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLPSceneCreationInputTextFieldView.h"

#define kWidthTextFieldTag 1
#define kHeightTextFieldTag 2

@interface TLPSceneCreationPanelView : UIView <TLPSceneCreationInputTextFieldViewDelegate>

@property(weak) id <TLPSceneCreationInputTextFieldViewDelegate> tfDelegate;

- (void)setWidthTFAsFirstResponder;
- (CGSize)levelSize;

@end
