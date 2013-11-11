//
//  TLPMenuScene.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "TLPLevelCreationSizeView.h"
#import "TLPLevelCreationView.h"

@interface TLPMainMenuScene : SKScene <TLPLevelCreationSizeViewDelegate>

@property(nonatomic) TLPLevelCreationSizeView *levelSizeView;
@property(nonatomic) TLPLevelCreationView *levelCreationView;

@end
