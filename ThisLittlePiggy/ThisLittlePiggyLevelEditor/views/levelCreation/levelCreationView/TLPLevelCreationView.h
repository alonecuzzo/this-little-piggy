//
//  TLPLevelCreationView.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/11/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

@interface TLPLevelCreationView : UIView <UIScrollViewDelegate>

@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UIView *levelView;

- (id)initWithFrame:(CGRect)frame andLevelSize:(CGSize)levelSize;

@end
