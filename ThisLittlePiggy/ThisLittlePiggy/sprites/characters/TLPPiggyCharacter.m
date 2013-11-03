//
//  TLPPiggyCharacter.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/1/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPPiggyCharacter.h"
#import "TLPWalkAI.h"

@implementation TLPPiggyCharacter

#pragma mark - init
- (id)initAtPosition:(CGPoint)position
{
    SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"placeholderImages"];
    self = [super initWithTexture:[atlas textureNamed:@"piggy.png"] andPosition:position];
    if (self) {
        self.name = @"piggy";
        self.intelligence = [[TLPWalkAI alloc] initWithCharacter:self andDestination:CGPointMake(3000.0, self.position.y)];
    }
    return self;
}

+ (void)loadSharedAssets
{
    [super loadSharedAssets];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"placeholderImages"];
        
    });
}

@end
