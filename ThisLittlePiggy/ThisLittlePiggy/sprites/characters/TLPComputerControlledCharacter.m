//
//  TLPComputerControlledCharacter.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPComputerControlledCharacter.h"
#import "TLPArtificialIntelligence.h"

@implementation TLPComputerControlledCharacter

#pragma mark - loop update
- (void)updateWithTimeSinceLastInterval:(CFTimeInterval)interval
{
    [super updateWithTimeSinceLastInterval:interval];
    
    [self.intelligence updateWithTimeSinceLastInterval:interval];
}

@end
