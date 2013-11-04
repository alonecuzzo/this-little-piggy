//
//  TLPUmbrellaCharacter.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/1/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPUmbrellaCharacter.h"

@implementation TLPUmbrellaCharacter

#pragma mark - init stuff
- (id)initAtPosition:(CGPoint)position
{
   SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"placeholderImages"];
    self = [super initWithTexture:[atlas textureNamed:@"umbrella.png"] andPosition:position];
    if (self) {
        self.name = @"umbrella";
    }
    return self;
}

@end
