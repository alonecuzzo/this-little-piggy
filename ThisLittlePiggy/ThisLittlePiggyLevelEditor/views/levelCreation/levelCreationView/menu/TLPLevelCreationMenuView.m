//
//  TLPLevelCreationMenuView.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/11/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPLevelCreationMenuView.h"
#import "UIView+GCLibrary.h"
#import "UIColor+ThisLittlePiggy.h"
#import "TLPLevelCreationMenuMinimap.h"

@implementation TLPLevelCreationMenuView
{
    BOOL _isOpen;
    TLPLevelCreationMenuMinimap *_minimap;
    UIView *_sideMenu;
}

#pragma mark - init stuff

- (id)initWithFrame:(CGRect)frame levelSize:(CGSize)levelSize
{
    self = [super initWithFrame:frame];
    if (self) {
        //stub out the minimap and side menu
        CGSize minimapSize = CGSizeMake(200.0f, 100.0f);
        CGRect minimapFrame = CGRectMake(self.frame.size.width + 10.0f, self.frame.size.height - minimapSize.height - 10.0f, minimapSize.width, minimapSize.height);
        _minimap = [[TLPLevelCreationMenuMinimap alloc] initWithFrame:minimapFrame andLevelSize:levelSize];

        CGSize sideMenuSize = CGSizeMake(150.0f, self.frame.size.height);
        CGRect sideMenuRect = CGRectMake(-sideMenuSize.width - 5.0f, 0.0f, sideMenuSize.width, sideMenuSize.height);
        _sideMenu = [[UIView alloc] initWithFrame:sideMenuRect];
        _sideMenu.backgroundColor = [UIColor thisLittlePiggySkyDarkPurple];
        _sideMenu.alpha = 0.9;
    }
    return self;
}

- (void)setupViews
{
    [self.superview addSubview:_minimap];
    [self.superview addSubview:_sideMenu];
}

- (void)toggle
{
    if (_isOpen) {
        [self close];
        _isOpen = NO;
    } else {
        [self open];
        _isOpen = YES;
    }
}

- (void)open
{
    id __weak weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
       TLPLevelCreationMenuView *strongSelf = (TLPLevelCreationMenuView *)weakSelf;
       CGRect r = CGRectMake(strongSelf.frame.size.width - 10 - _minimap.frame.size.width, _minimap.frame.origin.y, _minimap.frame.size.width, _minimap.frame.size.height);
        [_minimap setFrame:r];

        r = CGRectMake(5.0f, 0.0f, _sideMenu.frame.size.width, strongSelf.height);
        [_sideMenu setFrame:r];
    } completion:^(BOOL completed) {
        
    }];
}

- (void)close
{
    id __weak weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
        TLPLevelCreationMenuView *strongSelf = (TLPLevelCreationMenuView *)weakSelf;
        CGRect r = CGRectMake(strongSelf.frame.size.width + 10, _minimap.frame.origin.y, _minimap.frame.size.width, _minimap.frame.size.height);
        [_minimap setFrame:r];

        r = CGRectMake(-_sideMenu.frame.size.width - 5.0f, 0.0f, _sideMenu.frame.size.width, strongSelf.height);
        [_sideMenu setFrame:r];
    } completion:^(BOOL completed) {

    }];
}


@end
