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
    self = [super initWithColor:[UIColor orangeColor] size:CGSizeMake(1024, 768)];
    if (self) {
        self.name = @"sky";
        self.intelligence = [[TLPSpawnAI alloc] initWithCharacter:self];
        self.position = position;
        
        _activeClouds = [[NSMutableArray alloc] init];
        _inActiveClouds = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < kNumClouds; i++) {
            TLPCloudCharacter *cloud = [[TLPCloudCharacter alloc] initAtPosition:self.position];
            cloud.sky = self;
            [(NSMutableArray*)_inActiveClouds addObject:cloud];
        }
    }
    return self;
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
    
    TLPCloudCharacter *cloud = [_inActiveClouds lastObject];
    int randx = arc4random() % (int)[self scene].size.width;
    int randy = arc4random() % (int)[self scene].size.height;
    cloud.position = CGPointMake(randx, randy);
    
    [[self scene] addChild:cloud];
    
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
