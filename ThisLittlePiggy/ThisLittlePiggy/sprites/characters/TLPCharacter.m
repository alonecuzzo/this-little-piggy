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
    
    CGFloat distance = sqrt((dx*dx) + (dy*dy));
    
    if (distance < self.movementSpeed) {
        [self setPosition:position];
    } else {
        CGFloat newX = curPosition.x + dx / self.animationSpeed;
        CGFloat newY = curPosition.y + dy / self.animationSpeed;
        
        [self setPosition:CGPointMake(newX, newY)];
    }
}

#pragma mark - update loop stuff
- (void)updateWithTimeSinceLastInterval:(CFTimeInterval)interval
{
    
}

@end
