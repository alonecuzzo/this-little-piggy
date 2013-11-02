//
//  TLPArtificialIntelligence.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TLPCharacter;

@interface TLPArtificialIntelligence : NSObject

@property(nonatomic) TLPCharacter *character;

- (id)initWithCharacter:(TLPCharacter*)character;

- (void)updateWithTimeSinceLastInterval:(CFTimeInterval)interval;

@end
