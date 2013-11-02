//
//  TLPWalkAI.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPArtificialIntelligence.h"

@interface TLPWalkAI : TLPArtificialIntelligence

@property(nonatomic) CGPoint destination;

- (id)initWithCharacter:(TLPCharacter *)character andDestination:(CGPoint)destination;

@end
