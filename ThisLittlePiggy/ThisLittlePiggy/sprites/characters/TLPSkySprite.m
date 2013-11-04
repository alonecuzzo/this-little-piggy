//
//  TLPSkySprite.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/3/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPSkySprite.h"
#import "TLPSpawnAI.h"

@implementation TLPSkySprite

#pragma mark - init stuff
- (id)initAtPosition:(CGPoint)position
{
//    SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"placeholderImages"];
//    self = [super initWithTexture:[atlas textureNamed:@"sky.png"]];
    self = [super initWithColor:[UIColor orangeColor] size:CGSizeMake(1024, 768)];
    if (self) {
        self.name = @"sky";
        self.intelligence = [[TLPSpawnAI alloc] initWithCharacter:self];
        self.position = position;
    }
    return self;
}

@end
