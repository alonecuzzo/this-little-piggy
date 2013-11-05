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
#import "TLPSpawnMap.h"

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
        [TLPSky setGlobalCloudCap:35];
        [self addChild:sky atWorldLayer:TLPWorldLayerSky];
        
        TLPPiggyCharacter *piggy = [[TLPPiggyCharacter alloc] initAtPosition:CGPointMake(CGRectGetMidX(self.frame) - 300, CGRectGetMidY(self.frame) - 200)];
        piggy.name = @"piggy";
        piggy.movementSpeed = 1.0f;
        piggy.animationSpeed = 1930.0f;
        [self addChild:piggy atWorldLayer:TLPWorldLayerCharacter];
        
        TLPUmbrellaCharacter *umbrella = [[TLPUmbrellaCharacter alloc] initAtPosition:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 70)];
        umbrella.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:umbrella.size];
        umbrella.physicsBody.dynamic = YES;
        umbrella.physicsBody.affectedByGravity = NO;
        umbrella.physicsBody.mass = 0.02;
        umbrella.name = @"umbrella";
        [self addChild:umbrella atWorldLayer:TLPWorldLayerUmbrella];
        
        self.cloudSpawnMap = [[TLPSpawnMap alloc] init];
    }
    
    return self;
}

- (void)didMoveToView:(SKView *)view
{
    [super didMoveToView:view];
    
    if (kIsDebugMode) {
        [self buildDebugGraphics];
    }
}

#pragma mark - loop stuff
- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast
{
    TLPPiggyCharacter *piggy = [self piggySprite];
    [piggy updateWithTimeSinceLastInterval:timeSinceLast];
    
    TLPSky *sky = [self skySprite];
    [sky updateWithTimeSinceLastInterval:timeSinceLast];
    
    //check to see how far piggy and the umbrella are away from each other
    TLPUmbrellaCharacter *umbrella = [self umbrellaSprite];
    int umbrellaPiggyXDifference = abs(umbrella.position.x - piggy.position.x);
    
    [self processUserMotionForUpdate:timeSinceLast];
    [self moveWorldAccordingToUmbrellaPosition];
}

- (void)moveWorldAccordingToUmbrellaPosition
{
    TLPUmbrellaCharacter *umbrella = [self umbrellaSprite];
    SKNode *skyLayer = (SKNode*)self.layers[TLPWorldLayerSky];
    SKNode *piggyLayer = (SKNode*)self.layers[TLPWorldLayerCharacter];
    float skyBackgroundMoveSpeed = 7.0f;
    
    if (umbrella.position.x > self.size.width - kUmbrellaDistanceFromEdge) {
        CGPoint newPoint = CGPointMake(skyLayer.position.x-skyBackgroundMoveSpeed, skyLayer.position.y);
        skyLayer.position = newPoint;
        piggyLayer.position = newPoint;
    } else if (umbrella.position.x < kUmbrellaDistanceFromEdge) {
        CGPoint newPoint = CGPointMake(skyLayer.position.x+skyBackgroundMoveSpeed, skyLayer.position.y);
        skyLayer.position = newPoint;
        piggyLayer.position = newPoint;
    }
}

#pragma mark - core motion stuff
- (void)processUserMotionForUpdate:(CFTimeInterval)interval
{
    TLPUmbrellaCharacter *umbrella = [self umbrellaSprite];
    CMAccelerometerData *data = self.motionManager.accelerometerData;
    
    if (fabs(data.acceleration.y) > 0.2) {
        [umbrella.physicsBody applyForce:CGVectorMake(40.0 * data.acceleration.y, 0)];
    }
}

#pragma mark - debug stuff
- (void)buildDebugGraphics
{
    SKSpriteNode *activeUmbrellaMovementAreaSprite = [[SKSpriteNode alloc] initWithColor:[UIColor purpleColor] size:CGSizeMake(self.size.width - kUmbrellaDistanceFromEdge * 2, self.size.height - kUmbrellaDistanceFromEdge * 2)];
    activeUmbrellaMovementAreaSprite.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    activeUmbrellaMovementAreaSprite.alpha = 0.4;
    [self addChild:activeUmbrellaMovementAreaSprite atWorldLayer:TLPWorldLayerDebug];
}

#pragma mark - layer helpers
- (TLPUmbrellaCharacter*)umbrellaSprite
{
    return (TLPUmbrellaCharacter*)((SKNode*)[self.layers[TLPWorldLayerUmbrella] childNodeWithName:@"umbrella"]);
}

- (TLPPiggyCharacter*)piggySprite
{
    return (TLPPiggyCharacter*)((SKNode*)[self.layers[TLPWorldLayerCharacter] childNodeWithName:@"piggy"]);
}

- (TLPSky*)skySprite
{
    return (TLPSky*)((SKNode*)[self.layers[TLPWorldLayerSky] childNodeWithName:@"sky"]);
}

@end
