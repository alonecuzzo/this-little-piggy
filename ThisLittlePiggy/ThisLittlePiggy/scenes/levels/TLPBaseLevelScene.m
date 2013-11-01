//
//  TLPBaseLevelScene.m
//  ThisLittlePiggy
//
//  Created by Jabari on 10/31/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPBaseLevelScene.h"
#import "TLPPlayer.h"

@implementation TLPBaseLevelScene

#pragma mark - init
- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        
        _defaultPlayer = [[TLPPlayer alloc] init];
        
    }
    
    return self;
}

@end
