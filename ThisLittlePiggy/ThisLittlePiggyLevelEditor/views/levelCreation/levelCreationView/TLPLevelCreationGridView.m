//
//  TLPLevelCreationGridView.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/11/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPLevelCreationGridView.h"
#import "UIColor+ThisLittlePiggy.h"

@implementation TLPLevelCreationGridView

static const uint TLPGridPixelIncrement = 25;
static const float TLPGridLineWidth = 1.5f;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        UIView *gridLine = [[UIView alloc] init];
        gridLine.backgroundColor = [UIColor thisLittlePiggyDarkPaleBlue];

        for (int j = 0; j < frame.size.width; j=j+TLPGridPixelIncrement) {
            UIView *gl = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:gridLine]];
            [gl setFrame:CGRectMake(j, 0.0f, TLPGridLineWidth, frame.size.height)];
            [self addSubview:gl];
        }

        for (int k = 0; k < frame.size.height; k=k+TLPGridPixelIncrement) {
            UIView *gl = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:gridLine]];
            [gl setFrame:CGRectMake(0.0f, k, frame.size.width, TLPGridLineWidth)];
            [self addSubview:gl];
        }
    }
    return self;
}

@end
