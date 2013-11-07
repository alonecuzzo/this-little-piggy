//
//  TLPCreateLevelSizeScene.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPCreateLevelSizeScene.h"
#import "UIColor+ThisLittlePiggy.h"
#import "TLPSceneCreationPanelView.h"

@implementation TLPCreateLevelSizeScene

#pragma mark - init stuff
- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        self.backgroundColor = [UIColor thisLittlePiggySkyBlue];
    }
    return self;
}

#pragma mark - super functions
- (void)didMoveToView:(SKView *)view
{
    CGFloat panelWidth = 300;
    CGFloat panelHeight = 250;
    CGRect sceneCreationFrame = CGRectMake(CGRectGetMidX(self.frame) - (panelWidth / 2), CGRectGetMidY(self.frame) - (panelHeight / 2), panelWidth, panelHeight);
    
    TLPSceneCreationPanelView *sceneCreationPanel = [[TLPSceneCreationPanelView alloc] initWithFrame:sceneCreationFrame];
    [view addSubview:sceneCreationPanel];
}

@end
