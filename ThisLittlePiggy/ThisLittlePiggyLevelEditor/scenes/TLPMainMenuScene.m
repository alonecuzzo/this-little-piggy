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
#import "TLPLevelEditorScene.h"

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
    
    __weak  TLPMainMenuScene *selfRef = self;
    
    TLPMainMenuButtonSprite *createNewLevelButton = [[TLPMainMenuButtonSprite alloc] initWithTitle:@"new level" andBackgroundColor:[UIColor whiteColor] andSize:buttonSize andActionBlock:^{
        [selfRef moveToScene:@"newLevel"];
    }];
    createNewLevelButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 10 + createNewLevelButton.size.height / 2);
    [self addChild:createNewLevelButton];
    
    TLPMainMenuButtonSprite *loadLevelButton = [[TLPMainMenuButtonSprite alloc] initWithTitle:@"load level" andBackgroundColor:[UIColor whiteColor] andSize:buttonSize andActionBlock:^{
        [selfRef moveToScene:@"loadLevel"];
    }];
    loadLevelButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 10 - loadLevelButton.size.height / 2);
    [self addChild:loadLevelButton];
}

- (void)moveToScene:(NSString*)sceneName
{
    SKTransition *doors = [SKTransition fadeWithDuration:0.5];
    
    if ([sceneName isEqualToString:@"newLevel"]) {
        TLPLevelEditorScene *scene = [[TLPLevelEditorScene alloc] initWithSize:self.size];
        [self.view presentScene:scene transition:doors];
    }
    
    if ([sceneName isEqualToString:@"loadLevel"]) {

    }
}

@end
