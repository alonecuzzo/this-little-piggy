//
//  TLPCreateLevelSizeView.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/10/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLPSceneCreationInputTextFieldView.h"

@protocol TLPLevelCreationSizeViewDelegate

- (void)donePressed;

@end

@interface TLPLevelCreationSizeView : UIView <TLPSceneCreationInputTextFieldViewDelegate>

@property (weak) id <TLPLevelCreationSizeViewDelegate> levelCreationDelegate;

@end
