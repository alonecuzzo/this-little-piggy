//
//  TLPLevelCreationView.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/11/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPLevelCreationView.h"
#import "UIColor+ThisLittlePiggy.h"
#import "TLPLevelCreationGridView.h"

@implementation TLPLevelCreationView
{
    UIScrollView *_scrollView;
    UIView *_levelView;
    TLPLevelCreationGridView *_gridView;
}

- (id)initWithFrame:(CGRect)frame andLevelSize:(CGSize)levelSize
{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[UIScrollView alloc] initWithFrame:frame];
        _scrollView.scrollEnabled = YES;
        _scrollView.userInteractionEnabled = YES;
        _scrollView.backgroundColor = [UIColor thisLittlePiggySkyDarkPurple];
        _scrollView.showsHorizontalScrollIndicator = YES;
        _scrollView.showsVerticalScrollIndicator = YES;
        [self addSubview:_scrollView];
        
        _levelView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, levelSize.width, levelSize.height)];
        _levelView.backgroundColor = [UIColor thisLittlePiggyPaleBlue];
        [_scrollView setContentSize:levelSize];
        [_scrollView addSubview:_levelView];
        
        _gridView = [[TLPLevelCreationGridView alloc] initWithFrame:_levelView.frame];
        [_levelView addSubview:_gridView];
    }
    return self;
}

@end
