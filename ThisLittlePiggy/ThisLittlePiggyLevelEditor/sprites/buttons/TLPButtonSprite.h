//
//  TLPButtonSprite.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface TLPButtonSprite : SKSpriteNode

@property(nonatomic) NSString *title;
@property(copy) void (^actionBlock)();

- (instancetype)initWithTitle:(NSString*)title andBackgroundColor:(UIColor*)backgroundColor andSize:(CGSize)size andActionBlock:(void(^)())actionBlock;

@end
