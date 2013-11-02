//
//  TLPWalkAI.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPWalkAI.h"
#import "TLPCharacter.h"

@implementation TLPWalkAI

#pragma mark - init stuff
- (id)initWithCharacter:(TLPCharacter *)character andDestination:(CGPoint)destination
{
    self = [super initWithCharacter:character];
    if (self) {
        self.destination = destination;
    }
    return self;
}

#pragma mark - update loop stuff
- (void)updateWithTimeSinceLastInterval:(CFTimeInterval)interval
{
    [super updateWithTimeSinceLastInterval:interval];
    
    [self.character moveTowards:self.destination withTimeInterval:interval];
}

@end
