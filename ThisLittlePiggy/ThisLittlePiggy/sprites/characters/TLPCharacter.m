//
//  TLPCharacter.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/1/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPCharacter.h"

@implementation TLPCharacter

#pragma mark - init
- (id)initWithTexture:(SKTexture *)texture andPosition:(CGPoint)position
{
    self = [super initWithTexture:texture];
    if (self) {
        [self sharedInitAtPosition:position];
    }
    return self;
}

- (void)sharedInitAtPosition:(CGPoint)position
{
    self.position = position;
}

+ (void)loadSharedAssets
{
    //nada
}

@end
