//
//  TLPTestLevelScene.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/1/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPTestLevelScene.h"
#import "TLPPiggyCharacter.h"

@implementation TLPTestLevelScene

#pragma mark - init stuff
- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        TLPPiggyCharacter *piggy = [[TLPPiggyCharacter alloc] initAtPosition:CGPointMake(CGRectGetMidX(self.frame) - 300, CGRectGetMidY(self.frame) - 200)];
        piggy.name = @"piggy";
        piggy.movementSpeed = 2.0f;
        piggy.animationSpeed = 1130.0f;
        [self addChild:piggy];
    }
    
    return self;
}

#pragma mark - loop stuff
- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast
{
    TLPPiggyCharacter *piggy = (TLPPiggyCharacter*)[self childNodeWithName:@"piggy"];
    
    [piggy updateWithTimeSinceLastInterval:timeSinceLast];
}

@end
