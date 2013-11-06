//
//  TLPSkySprite.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/3/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPSky.h"
#import "TLPSpawnAI.h"
#import "TLPCloudCharacter.h"
#import "TLPBaseLevelScene.h"
#import "TLPLevelHandler.h"
#import "TLPCloudModel.h"

#define kNumClouds 30

@interface TLPSky()

@property(nonatomic) NSMutableArray *activeClouds;
@property(nonatomic) NSMutableArray *inActiveClouds;

@end

@implementation TLPSky

#pragma mark - init stuff
- (id)initAtPosition:(CGPoint)position
{
//    SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"placeholderImages"];
//    self = [super initWithTexture:[atlas textureNamed:@"sky.png"]];
    self = [super initWithColor:[UIColor clearColor] size:CGSizeMake(1024, 768)];
    if (self) {
        self.name = @"sky";
        self.intelligence = [[TLPSpawnAI alloc] initWithCharacter:self];
        self.position = position;
        
        _activeClouds = [[NSMutableArray alloc] init];
        _inActiveClouds = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < kNumClouds; i++) {
            //map stuff should be here!
            TLPCloudCharacter *cloud = [[TLPCloudCharacter alloc] initAtPosition:self.position];
            cloud.sky = self;
            [(NSMutableArray*)_inActiveClouds addObject:cloud];
        }
    }
    return self;
}

- (void)generateClouds:(NSArray*)cloudModels
{
    TLPBaseLevelScene *scene = (TLPBaseLevelScene*)[self scene];
    for (TLPCloudModel *model in cloudModels) {
        TLPCloudCharacter *cloud = [[TLPCloudCharacter alloc] initAtPosition:model.position];
        cloud.name = [NSString stringWithFormat:@"%d", model.id];
        cloud.movementSpeed = model.speed;
        [scene addChild:cloud atWorldLayer:TLPWorldLayerSky];
    }
}

#pragma mark - update loop stuff
- (void)updateWithTimeSinceLastInterval:(CFTimeInterval)interval
{
    [super updateWithTimeSinceLastInterval:interval];
}

#pragma mark - cloud generation
- (void)generate
{
    if (sGlobalCloudCap > 0 && sGlobalCloudAllocation >= sGlobalCloudCap) {
        return;
    }
    
    if (_inActiveClouds.count == 0) {
        return;
    }
    
    return;
    
    //we need to get a measurement/location for the camera and the visible area...
    //how are we going to have a consistent cloud creation instruction set??
    //maybe the level has a length, and all of the clouds have locations & speeds
    //we should also put the start point and end point on the stage as well
    TLPBaseLevelScene *scene = (TLPBaseLevelScene*)[self scene];
    TLPCloudCharacter *cloud = [_inActiveClouds lastObject];
    cloud.movementSpeed = 3;
    //the clouds aren't going to randomly pop on the stage, they're going to slide in...
    int randx = arc4random() % (int)scene.size.width; // the x value should always be + or - the x bounds of the scene, then the cloud floats in
    int randy = arc4random() % ((int)scene.size.height - 600) + 600;
    cloud.position = CGPointMake(scene.size.width + 100, randy);
    
    [scene addChild:cloud atWorldLayer:TLPWorldLayerSky];
//    [self addChild:cloud];
    
//    [cloud moveTowards:CGPointMake(randx, randy) withTimeInterval:1.0];
    SKAction *moveToRandomX = [SKAction moveToX:randx duration:3.0];
    [cloud runAction:moveToRandomX];
    
    [_inActiveClouds removeLastObject];
    
    sGlobalCloudAllocation++;
}

static uint sGlobalCloudCap = 0;

+ (void)setGlobalCloudCap:(uint)cap
{
    sGlobalCloudCap = cap;
}

+ (uint)globalCloudCap
{
    return sGlobalCloudCap;
}

static uint sGlobalCloudAllocation = 0;

@end
