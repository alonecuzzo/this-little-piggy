//
//  TLPSpawnAI.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/3/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPSpawnAI.h"
#import "TLPCharacter.h"
#import "TLPBaseLevelScene.h"

@implementation TLPSpawnAI

#pragma mark - init stuff
- (id)initWithCharacter:(TLPCharacter *)character andLocation:(CGPoint)location
{
    self = [super initWithCharacter:character];
    if (self) {
        self.spawnLocation = location;
    }
    return self;
}

#pragma mark - update loop stuff
- (void)updateWithTimeSinceLastInterval:(CFTimeInterval)interval
{
    TLPBaseLevelScene *characterScene = [self.character characterScene];
    NSTimeInterval timeSinceLastCloudSpawn = characterScene.timeSinceLastCloudSpawn;
    
    
}

@end
