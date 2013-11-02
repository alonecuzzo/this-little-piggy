//
//  TLPArtificialIntelligence.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPArtificialIntelligence.h"

@implementation TLPArtificialIntelligence

- (id)initWithCharacter:(TLPCharacter*)character
{
    self = [super init];
    if (self) {
        self.character = character;
    }
    return self;
}

- (void)updateWithTimeSinceLastInterval:(CFTimeInterval)interval
{
    //overridden in subclasses
}

@end
