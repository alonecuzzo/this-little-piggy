//
//  TLPLevelCreationMenuMinimap.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/11/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

@class TLPMenuMinimapController;

@interface TLPLevelCreationMenuMinimap : UIView

@property(nonatomic) UIView *levelView;
@property(nonatomic) TLPMenuMinimapController *controller;

- (id)initWithFrame:(CGRect)frame andLevelSize:(CGSize)levelSize;
- (void)scrollViewToPoint:(CGPoint)point;

@end
