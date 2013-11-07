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
        int scale = 15;
       
        CGFloat levelWidth = 2048.0 / scale;
        CGFloat levelHeight = 1000 / scale;
        CGFloat levelX = (self.frame.size.width / 2) - (levelWidth / 2);
        CGFloat levelY = (self.frame.size.height / 2) - (levelHeight / 2);
        CGRect levelFrame = CGRectMake(levelX, levelY, levelWidth, levelHeight);
        _levelView = [[UIView alloc] initWithFrame:levelFrame];
        _levelView.backgroundColor = [UIColor thisLittlePiggyPaleBlue];
        [self addSubview:_levelView];
        
        CGFloat ipadWidth = 1024.0f / scale;
        CGFloat ipadHeight = 768.0f / scale;
        CGRect ipadFrame = CGRectMake(0, 0, ipadWidth, ipadHeight);
        _ipadView = [[UIView alloc] initWithFrame:ipadFrame];
        _ipadView.backgroundColor = [UIColor thisLittlePiggySkyDarkPurple];
        [_levelView addSubview:_ipadView];
        
    }
    return self;
}

- (void)resizeLevel:(CGSize)size
{
    
}

@end
