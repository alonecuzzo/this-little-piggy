//
//  TLPBaseLevelScene.m
//  ThisLittlePiggy
//
//  Created by Jabari on 10/31/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPBaseLevelScene.h"
#import "TLPPlayer.h"

@implementation TLPBaseLevelScene

#pragma mark - init
- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        _players = [[NSMutableArray alloc] initWithCapacity:kNumPlayers];
        _defaultPlayer = [[TLPPlayer alloc] init];
        [_players addObject:_defaultPlayer];
        for (int i = 1; i < kNumPlayers; i++) {
            [_players addObject:[NSNull null]];
        }
        
        _world = [[SKNode alloc] init];
        _world.name = @"world";
    }
    
    return self;
}

@end
