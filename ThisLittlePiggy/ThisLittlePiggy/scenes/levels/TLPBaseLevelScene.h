//
//  TLPBaseLevelScene.h
//  ThisLittlePiggy
//
//  Created by Jabari on 10/31/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

typedef enum : u_int8_t {
    TLPWorldLayerBackground = 0,
    TLPWorldLayerGround,
    TLPWorldLayerCharacter,
    kTLPWorldLayerCount
} TLPWorldLayer;

#define kPiggyMinimumDistanceToEdge 256
#define kNumPlayers 1
#define kWorldName @"world"

#define kTLPBaseLevelLoadSharedAssetsException @"kTLPBaseLevelException"
#define kTLPBaseLevelLoadSharedAssetsExceptionReason @"You can't call loadSceneAssets from the base class."
#define kTLPBaseLevelReleaseSharedAssetsException @"kTLPBaseLevelReleaseSharedAssetsException"
#define kTLPBaseLevelReleaseSharedAssetsExceptionReason @"You can't call releaseSceneAssets from the base class."

#import <SpriteKit/SpriteKit.h>

@class TLPPlayer;

@interface TLPBaseLevelScene : SKScene

@property(nonatomic) SKNode *world;
@property(nonatomic) TLPPlayer *defaultPlayer;
@property(nonatomic, readonly) NSArray *players;

+ (void)loadSceneAssets;

+ (void)releaseSceneAssets;

@end
