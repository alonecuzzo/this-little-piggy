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
#import "TLPLevelCreationMenuView.h"
#import "TLPLevelCreationSizeView.h"
#import "TLPLevelEditorModel.h"

@implementation TLPLevelCreationView
{
    UIScrollView *_scrollView;
    UIView *_levelView;
    TLPLevelCreationGridView *_gridView;
    TLPLevelCreationMenuView *_menu;
}

- (id)initWithFrame:(CGRect)frame andLevelSize:(CGSize)levelSize
{
    self = [super initWithFrame:frame];
    if (self) {
        //menu
        _menu = [[TLPLevelCreationMenuView alloc] initWithFrame:frame levelSize:levelSize];
        [self addSubview:_menu];

        _scrollView = [[UIScrollView alloc] initWithFrame:frame];
        _scrollView.scrollEnabled = YES;
        _scrollView.userInteractionEnabled = YES;
        _scrollView.backgroundColor = [UIColor thisLittlePiggySkyDarkPurple];
        _scrollView.showsHorizontalScrollIndicator = YES;
        _scrollView.showsVerticalScrollIndicator = YES;
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        
        _levelView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, levelSize.width, levelSize.height)];
        _levelView.backgroundColor = [UIColor thisLittlePiggyPaleBlue];
        _levelView.userInteractionEnabled = YES;
        [_scrollView setContentSize:levelSize];
        [_scrollView addSubview:_levelView];
        
        _gridView = [[TLPLevelCreationGridView alloc] initWithFrame:_levelView.frame];
        [_levelView addSubview:_gridView];

        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleMenu)];
        tapGestureRecognizer.numberOfTapsRequired = 2;
        [_levelView addGestureRecognizer:tapGestureRecognizer];

        [_menu setupViews];
    }
    return self;
}

- (void)toggleMenu
{
    [_menu toggle];
}

#pragma mark - delegate stuff
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [[TLPLevelEditorModel sharedInstance] setLevelCoordinate:_scrollView.contentOffset];
}

@end
