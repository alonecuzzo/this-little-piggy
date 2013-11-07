//
//  TLPMinimap.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPMinimap.h"
#import "UIColor+ThisLittlePiggy.h"

@interface TLPMinimap()

@property(nonatomic) UIView *levelView;
@property(nonatomic) UIView *ipadView;

@end

@implementation TLPMinimap

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat levelWidth = 2048.0 / kScale;
        CGFloat levelHeight = 1000 / kScale;
        CGFloat levelX = (self.frame.size.width / 2) - (levelWidth / 2);
        CGFloat levelY = (self.frame.size.height / 2) - (levelHeight / 2);
        CGRect levelFrame = CGRectMake(levelX, levelY, levelWidth, levelHeight);
        _levelView = [[UIView alloc] initWithFrame:levelFrame];
        _levelView.backgroundColor = [UIColor thisLittlePiggyPaleBlue];
        [self addSubview:_levelView];
        
        CGFloat ipadWidth = 1024.0f / kScale;
        CGFloat ipadHeight = 768.0f / kScale;
        CGRect ipadFrame = CGRectMake(0, 0, ipadWidth, ipadHeight);
        _ipadView = [[UIView alloc] initWithFrame:ipadFrame];
        _ipadView.backgroundColor = [UIColor thisLittlePiggySkyDarkPurple];
        _ipadView.alpha = 0.8f;
        [_levelView addSubview:_ipadView];
    }
    return self;
}

- (void)updateLevelWidth:(CGFloat)width
{
    [UIView animateWithDuration:0.5f animations:^{
        _levelView.frame = CGRectMake((self.frame.size.width / 2) - ((width / kScale) / 2), (self.frame.size.height / 2) - (_levelView.frame.size.height / 2), width / kScale, _levelView.frame.size.height);
    }];
}

- (void)updateLevelHeight:(CGFloat)height
{
    [UIView animateWithDuration:0.5f animations:^{
        _levelView.frame = CGRectMake((self.frame.size.width / 2) - (_levelView.frame.size.width / 2), (self.frame.size.height / 2) - ((height / kScale) / 2), _levelView.frame.size.width, height / kScale);
    }];
}

@end
