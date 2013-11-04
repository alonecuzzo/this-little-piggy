//
//  TLPTestLevelScene.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/1/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPTestLevelScene.h"
#import "TLPPiggyCharacter.h"
#import "TLPUmbrellaCharacter.h"
#import "TLPSky.h"

@implementation TLPTestLevelScene

#pragma mark - init stuff
- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        
        TLPSky *sky = [[TLPSky alloc] initAtPosition:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
        [TLPSky setGlobalCloudCap:15];
        [self addChild:sky];
        
        TLPPiggyCharacter *piggy = [[TLPPiggyCharacter alloc] initAtPosition:CGPointMake(CGRectGetMidX(self.frame) - 300, CGRectGetMidY(self.frame) - 200)];
        piggy.name = @"piggy";
        piggy.movementSpeed = 2.0f;
        piggy.animationSpeed = 1130.0f;
        [self addChild:piggy];
        
        TLPUmbrellaCharacter *umbrella = [[TLPUmbrellaCharacter alloc] initAtPosition:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 70)];
        umbrella.name = @"umbrella";
        [self addChild:umbrella];
    }
    
    return self;
}

#pragma mark - loop stuff
- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast
{
    TLPPiggyCharacter *piggy = (TLPPiggyCharacter*)[self childNodeWithName:@"piggy"];
    [piggy updateWithTimeSinceLastInterval:timeSinceLast];
    
    TLPSky *sky = (TLPSky*)[self childNodeWithName:@"sky"];
    [sky updateWithTimeSinceLastInterval:timeSinceLast];
}

@end
