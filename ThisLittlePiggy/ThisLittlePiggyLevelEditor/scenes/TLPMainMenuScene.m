//
//  TLPMenuScene.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPMainMenuScene.h"
#import "UIColor+ThisLittlePiggy.h"
#import "TLPMainMenuButton.h"

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
    
//    TLPMainMenuButtonSprite *createNewLevelButton = [[TLPMainMenuButtonSprite alloc] initWithTitle:@"new level" andBackgroundColor:[UIColor whiteColor] andSize:buttonSize andActionBlock:^{
//        [selfRef moveToScene:@"newLevel"];
//    }];
//    createNewLevelButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 10 + createNewLevelButton.size.height / 2);
//    [self addChild:createNewLevelButton];
//    
//    TLPMainMenuButtonSprite *loadLevelButton = [[TLPMainMenuButtonSprite alloc] initWithTitle:@"load level" andBackgroundColor:[UIColor whiteColor] andSize:buttonSize andActionBlock:^{
//        [selfRef moveToScene:@"loadLevel"];
//    }];
//    loadLevelButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 10 - loadLevelButton.size.height / 2);
//    [self addChild:loadLevelButton];

    CGRect newLevelButtonFrame = CGRectMake(CGRectGetMidX(self.frame) - (buttonSize.width / 2), CGRectGetMidY(self.frame) - 10 - (buttonSize.height / 2), buttonSize.width, buttonSize.height);
    TLPMainMenuButton *createNewLevelButton = [[TLPMainMenuButton alloc] initWithFrame:newLevelButtonFrame];
    [createNewLevelButton setTitle:@"new level" forState:UIControlStateNormal];
    [createNewLevelButton setTitleColor:[UIColor thisLittlePiggySkyBlue] forState:UIControlStateNormal
    ];
    [createNewLevelButton setBackgroundColor:[UIColor whiteColor]];
    [view addSubview:createNewLevelButton];

}

@end
