//
//  TLPMenuScene.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPMainMenuScene.h"
#import "TLPMainMenuButtonSprite.h"
#import "UIColor+ThisLittlePiggy.h"
#import "TLPMainMenuButtonSprite.h"

@implementation TLPMainMenuScene

#pragma mark - init stuff
- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        self.backgroundColor = [UIColor thisLittlePiggySkyBlue];
    }
    return self;
}

#pragma mark - scene functions
- (void)didMoveToView:(SKView *)view
{
    CGSize buttonSize = CGSizeMake(350.0f, 70.0f);
    
    TLPMainMenuButtonSprite *createNewLevelButton = [[TLPMainMenuButtonSprite alloc] initWithTitle:@"new level" andBackgroundColor:[UIColor whiteColor] andSize:buttonSize andActionBlock:^{
        
    }];
    createNewLevelButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 10 + createNewLevelButton.size.height / 2);
    [self addChild:createNewLevelButton];
    
    TLPMainMenuButtonSprite *loadLevelButton = [[TLPMainMenuButtonSprite alloc] initWithTitle:@"load level" andBackgroundColor:[UIColor whiteColor] andSize:buttonSize andActionBlock:^{
        
    }];
    loadLevelButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 10 - loadLevelButton.size.height / 2);
    [self addChild:loadLevelButton];
}

@end
