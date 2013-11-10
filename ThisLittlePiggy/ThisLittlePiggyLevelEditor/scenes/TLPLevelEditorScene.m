//
//  TLPLevelEditorScene.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/6/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPLevelEditorScene.h"
#import "UIColor+ThisLittlePiggy.h"

@implementation TLPLevelEditorScene

- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        self.backgroundColor = [UIColor thisLittlePiggySkyBlue];
    }
    return  self;
}

#pragma mark - delegate stuff
- (void)didMoveToView:(SKView *)view
{
}

@end
