//
//  TLPBaseLevelScene.m
//  ThisLittlePiggy
//
//  Created by Jabari on 10/31/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPBaseLevelScene.h"
#import "TLPPlayer.h"
#import "UIColor+ThisLittlePiggy.h"

@interface TLPBaseLevelScene()

@property(nonatomic) NSMutableArray *players;
@property(nonatomic) NSMutableArray *layers;

@end

@implementation TLPBaseLevelScene

#pragma mark - init
- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        
        self.backgroundColor = [UIColor thisLittlePiggySkyBlue];
        
        _players = [[NSMutableArray alloc] initWithCapacity:kNumPlayers];
        _defaultPlayer = [[TLPPlayer alloc] init];
        [(NSMutableArray*)_players addObject:_defaultPlayer];
        for (int i = 1; i < kNumPlayers; i++) {
            [(NSMutableArray*)_players addObject:[NSNull null]];
        }
        
        _world = [[SKNode alloc] init];
        _world.name = kWorldName;
        
        _layers = [NSMutableArray arrayWithCapacity:kTLPWorldLayerCount];
        for (int i = 0; i < kTLPWorldLayerCount; i++) {
            //create the layers
            SKNode *layer = [[SKNode alloc] init];
            layer.zPosition = i - kTLPWorldLayerCount;
            [_world addChild:layer];
            [_layers addObject:layer];
        }
        
        [self addChild:_world];
    }
    
    return self;
}

#pragma mark - loop stuff
- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast
{
    //overridden by subclasses
}

- (void)update:(NSTimeInterval)currentTime
{
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1) {
        timeSinceLast = kMinTimeInterval;
        self.lastUpdateTimeInterval = currentTime;
    }
    
    [self updateWithTimeSinceLastUpdate:timeSinceLast];
}

#pragma mark - assets business
+ (void)loadSceneAssets
{
    [[NSException exceptionWithName:kTLPBaseLevelLoadSharedAssetsException reason:kTLPBaseLevelLoadSharedAssetsExceptionReason userInfo:nil] raise];
}

+ (void)releaseSceneAssets
{
    [[NSException exceptionWithName:kTLPBaseLevelReleaseSharedAssetsException reason:kTLPBaseLevelReleaseSharedAssetsExceptionReason userInfo:nil] raise];
}

@end
