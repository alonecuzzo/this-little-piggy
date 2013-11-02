//
//  TLPCharacter.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/1/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPCharacter.h"

@implementation TLPCharacter

#pragma mark - init
- (id)initWithTexture:(SKTexture *)texture andPosition:(CGPoint)position
{
    self = [super initWithTexture:texture];
    if (self) {
        [self sharedInitAtPosition:position];
    }
    return self;
}

- (void)sharedInitAtPosition:(CGPoint)position
{
    self.position = position;
}

+ (void)loadSharedAssets
{
    //nada
}

#pragma mark - movement stuffs
- (void)moveTowards:(CGPoint)position withTimeInterval:(NSTimeInterval)timeInterval
{
    CGPoint curPosition = self.position;
    CGFloat dx = position.x - curPosition.x;
    CGFloat dy = position.y - curPosition.y;
    
    CGFloat distance = sqrtf((dx*dx) + (dy*dy));
    CGFloat rotation = atan2f(dx, dy) / M_PI * 180.0f;
    
    if (distance < self.movementSpeed) {
        [self setPosition:position];
    } else {
        CGFloat newX = curPosition.x + cosf(rotation / 180.0f * M_PI) * self.movementSpeed;
        CGFloat newY = curPosition.y - sinf(rotation / 180.0f * M_PI) * self.movementSpeed;
        
        [self setPosition:CGPointMake(newX, newY)];
    }
}

#pragma mark - update loop stuff
- (void)updateWithTimeSinceLastInterval:(CFTimeInterval)interval
{
    
}

@end
