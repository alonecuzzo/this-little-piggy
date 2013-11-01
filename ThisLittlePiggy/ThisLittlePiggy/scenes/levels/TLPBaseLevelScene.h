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

#import <SpriteKit/SpriteKit.h>

@class TLPPlayer;

@interface TLPBaseLevelScene : SKScene

@property(nonatomic) SKNode *world;
@property(nonatomic) TLPPlayer *defaultPlayer;


+ (void)loadSceneAssets;

+ (void)releaseSceneAssets;

@end
