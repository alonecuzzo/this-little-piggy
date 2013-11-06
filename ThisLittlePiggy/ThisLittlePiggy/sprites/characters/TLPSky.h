//
//  TLPSkySprite.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/3/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPEnemyCharacter.h"

@interface TLPSky : TLPEnemyCharacter

@property(nonatomic, readonly) NSArray *activeClouds;
@property(nonatomic, readonly) NSArray *inactiveClouds;
//@property(nonatomic) NSArray *cloudModels;
@property(nonatomic) CGFloat timeUntilNextGenerate;

+ (void)setGlobalCloudCap:(uint)cap;
+ (uint)globalCloudCap;

- (id)initAtPosition:(CGPoint)position;

- (void)generate;
- (void)generateClouds:(NSArray*)cloudModels;

@end
