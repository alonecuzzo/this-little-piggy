//
//  TLPCharacter.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/1/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPParallaxSprite.h"

@class TLPBaseLevelScene;

@interface TLPCharacter : TLPParallaxSprite

@property(nonatomic) CGFloat movementSpeed;
@property(nonatomic) CGFloat animationSpeed;

- (id)initWithTexture:(SKTexture *)texture andPosition:(CGPoint)position;

+ (void)loadSharedAssets;

- (void)updateWithTimeSinceLastInterval:(CFTimeInterval)interval;

//movement and stuffs
- (void)moveTowards:(CGPoint)position withTimeInterval:(NSTimeInterval)timeInterval;

- (TLPBaseLevelScene*)characterScene;

@end
