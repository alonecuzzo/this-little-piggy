//
//  TLPLevelCreationMenuMinimap.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/11/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPLevelCreationMenuMinimap.h"
#import "UIColor+ThisLittlePiggy.h"

@interface TLPLevelCreationMenuMinimap()

@property(nonatomic) UIView *ipadView;
@property(nonatomic) UIView *levelView;

@end

@implementation TLPLevelCreationMenuMinimap

- (id)initWithFrame:(CGRect)frame andLevelSize:(CGSize)levelSize
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat ratio = frame.size.width / levelSize.width;

        _levelView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, ratio*levelSize.width, ratio*levelSize.height)];
        _levelView.backgroundColor = [UIColor thisLittlePiggySkyDarkPurple];
        [self addSubview:_levelView];

        _ipadView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, ratio*1024.0f, ratio*768.0f)];
        _ipadView.backgroundColor = [UIColor thisLittlePiggySkyBlue];
        [self addSubview:_ipadView];
    }
    return self;
}

@end
