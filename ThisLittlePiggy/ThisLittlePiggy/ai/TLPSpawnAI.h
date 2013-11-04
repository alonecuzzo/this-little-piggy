//
//  TLPSpawnAI.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/3/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPArtificialIntelligence.h"

@class TLPCharacter;

@interface TLPSpawnAI : TLPArtificialIntelligence

@property(nonatomic) CGPoint spawnLocation;

- (id)initWithCharacter:(TLPCharacter *)character andLocation:(CGPoint)location;

@end
