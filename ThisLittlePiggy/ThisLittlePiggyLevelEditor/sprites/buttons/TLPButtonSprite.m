//
//  TLPButtonSprite.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPButtonSprite.h"
#import "TLPFontHelper.h"
#import "UIColor+ThisLittlePiggy.h"

@implementation TLPButtonSprite

#pragma mark - init stuff
- (instancetype)initWithTitle:(NSString *)title andBackgroundColor:(UIColor *)backgroundColor andSize:(CGSize)size andActionBlock:(void (^)())actionBlock
{
    self = [super initWithColor:backgroundColor size:size];
    if (self) {
        self.actionBlock = actionBlock;
        self.title = title;
        [self buildButton];
    }
    return self;
}

#pragma mark - setup stuff
- (void)buildButton
{
    SKLabelNode *titleLabel = [SKLabelNode labelNodeWithFontNamed:[TLPFontHelper fontNameForRalewayExtraLight]];
    titleLabel.fontColor = [UIColor thisLittlePiggySkyBlue];
    titleLabel.fontSize = TLPFontSizeCityNameLarge;
    titleLabel.text = self.title;
    titleLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
    titleLabel.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    titleLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    [self addChild:titleLabel];
}

@end
