//
//  TLPLevelCreationMenuView.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/11/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

@interface TLPLevelCreationMenuView : UIView

- (id)initWithFrame:(CGRect)frame levelSize:(CGSize)levelSize;
- (void)setupViews;
- (void)scrollIpadViewToPoint:(CGPoint)point;
- (void)toggle;

@end
