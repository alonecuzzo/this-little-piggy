//
//  TLPBaseLevelScene.h
//  ThisLittlePiggy
//
//  Created by Jabari on 10/31/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

typedef enum : u_int8_t {
    TLPWorldLayerSky = 0,
    TLPWorldLayerGround,
    TLPWorldLayerCharacter,
    TLPWorldLayerUmbrella,
    TLPWorldLayerDebug,
    kTLPWorldLayerCount
} TLPWorldLayer;

#define kPiggyMinimumDistanceToEdge 256
#define kMinTimeInterval (1.0f / 60.0f)
#define kNumPlayers 1
#define kWorldName @"world"
#define kUmbrellaDistanceFromEdge 100
#define kMaxUmbrellaDistanceFromPiggy 300
#define kIsDebugMode 1

#define kTLPBaseLevelLoadSharedAssetsException @"kTLPBaseLevelException"
#define kTLPBaseLevelLoadSharedAssetsExceptionReason @"You can't call loadSceneAssets from the base class."
#define kTLPBaseLevelReleaseSharedAssetsException @"kTLPBaseLevelReleaseSharedAssetsException"
#define kTLPBaseLevelReleaseSharedAssetsExceptionReason @"You can't call releaseSceneAssets from the base class."

#import <SpriteKit/SpriteKit.h>
#import <CoreMotion/CoreMotion.h>

@class TLPPlayer, TLPLevelHandler;

@interface TLPBaseLevelScene : SKScene

@property(nonatomic) SKNode *world;
@property(nonatomic) TLPPlayer *defaultPlayer;
@property(nonatomic, readonly) NSArray *players;
@property(nonatomic, readonly) NSArray *layers;
@property(nonatomic) NSTimeInterval lastUpdateTimeInterval;
@property(nonatomic) NSTimeInterval timeSinceLastCloudSpawn;
@property(nonatomic) CMMotionManager *motionManager;
@property(nonatomic) TLPLevelHandler *levelHandler;

+ (void)loadSceneAssets;
+ (void)releaseSceneAssets;
- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast;
- (void)addChild:(SKNode *)node atWorldLayer:(TLPWorldLayer)layer;

@end
