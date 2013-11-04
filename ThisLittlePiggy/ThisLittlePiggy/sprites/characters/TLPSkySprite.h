//
//  TLPSkySprite.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/3/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPEnemyCharacter.h"

@interface TLPSkySprite : TLPEnemyCharacter

@property(nonatomic, readonly) NSArray *activeClouds;
@property(nonatomic, readonly) NSArray *inactiveClouds;
@property(nonatomic) CGFloat timeUntilNextGenerate;

- (id)initAtPosition:(CGPoint)position;

@end
