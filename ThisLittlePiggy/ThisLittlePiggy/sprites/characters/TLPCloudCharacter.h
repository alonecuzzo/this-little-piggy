//
//  TLPCloudCharacter.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/1/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPEnemyCharacter.h"

@class TLPSky;

@interface TLPCloudCharacter : TLPEnemyCharacter

@property(nonatomic) TLPSky *sky;

- (id)initAtPosition:(CGPoint)position;

@end
