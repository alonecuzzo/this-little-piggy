//
//  TLPCharacter.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/1/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPParallaxSprite.h"

@interface TLPCharacter : TLPParallaxSprite

- (id)initWithTexture:(SKTexture *)texture andPosition:(CGPoint)position;

+ (void)loadSharedAssets;

@end
