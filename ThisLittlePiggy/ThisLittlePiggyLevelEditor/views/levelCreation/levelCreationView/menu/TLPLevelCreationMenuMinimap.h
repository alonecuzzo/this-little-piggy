//
//  TLPLevelCreationMenuMinimap.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/11/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

@interface TLPLevelCreationMenuMinimap : UIView

@property(nonatomic) UIView *levelView;

- (id)initWithFrame:(CGRect)frame andLevelSize:(CGSize)levelSize;
- (void)scrollViewToPoint:(CGPoint)point;

@end
