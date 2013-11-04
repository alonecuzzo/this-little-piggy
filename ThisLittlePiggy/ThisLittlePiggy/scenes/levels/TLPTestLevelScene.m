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
       
        //the sky should sit over the world, it shouldn't ever move, only the world moves and the clouds populate on either side of the
        //xbounds for the sky
        
        //this is wrong, the cloud layer should move since the camera is moving, old clouds that are passed will still be hanging around
        TLPSky *sky = [[TLPSky alloc] initAtPosition:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
        [TLPSky setGlobalCloudCap:15];
        [self addChild:sky];
        
        TLPPiggyCharacter *piggy = [[TLPPiggyCharacter alloc] initAtPosition:CGPointMake(CGRectGetMidX(self.frame) - 300, CGRectGetMidY(self.frame) - 200)];
        piggy.name = @"piggy";
        piggy.movementSpeed = 1.0f;
        piggy.animationSpeed = 1930.0f;
        [self addChild:piggy];
        
        TLPUmbrellaCharacter *umbrella = [[TLPUmbrellaCharacter alloc] initAtPosition:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 70)];
        umbrella.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:umbrella.size];
        umbrella.physicsBody.dynamic = YES;
        umbrella.physicsBody.affectedByGravity = NO;
        umbrella.physicsBody.mass = 0.2;
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
    
    [self processUserMotionForUpdate:timeSinceLast];
}


#pragma mark - core motion stuff
- (void)processUserMotionForUpdate:(CFTimeInterval)interval
{
    TLPUmbrellaCharacter *umbrella = (TLPUmbrellaCharacter*)[self childNodeWithName:@"umbrella"];
    CMAccelerometerData *data = self.motionManager.accelerometerData;
    
    if (fabs(data.acceleration.x) > 0.2) {
        NSLog(@"LOLZ: %f", fabs(data.acceleration.x));
        [umbrella.physicsBody applyForce:CGVectorMake(40.0 * data.acceleration.x, 0)];
        
    }
    
}

@end
