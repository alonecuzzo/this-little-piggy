//
//  TLPMockBaseLevelScene.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/1/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPMockBaseLevelScene.h"

@implementation TLPMockBaseLevelScene

- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        _layers = [NSMutableArray arrayWithCapacity:kTLPWorldLayerCount];
        for (int i = 0; i < kTLPWorldLayerCount; i++) {
            [_layers addObject:[NSNull null]];
        }
    }
    return self;
}

@end
