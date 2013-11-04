//
//  TLPCloudCharacter.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/1/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPCloudCharacter.h"

@implementation TLPCloudCharacter

#pragma mark - init stuff
- (id)initAtPosition:(CGPoint)position
{
    SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"placeholderImages"];
    self = [super initWithTexture:[atlas textureNamed:@"cloud.png"] andPosition:position];
    if (self) {
        self.name = @"umbrella";
    }
    return self;
}

#pragma mark - loop update stuff
- (void)updateWithTimeSinceLastInterval:(CFTimeInterval)interval
{
    [super updateWithTimeSinceLastInterval:interval];
}

@end
