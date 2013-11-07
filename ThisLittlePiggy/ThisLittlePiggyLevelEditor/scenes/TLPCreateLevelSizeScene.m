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
#import "TLPMinimap.h"

@interface TLPCreateLevelSizeScene()

@property(nonatomic) TLPSceneCreationPanelView *sceneCreationPanel;
@property(nonatomic) TLPMinimap *minimap;

@end

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
    CGFloat panelWidth = 350;
    CGFloat panelHeight = 240;
    CGRect sceneCreationFrame = CGRectMake(CGRectGetMidX(self.frame) - (panelWidth / 2) - panelWidth + 40, CGRectGetMidY(self.frame) - (panelHeight / 2) - 150, panelWidth, panelHeight);
    
    self.sceneCreationPanel = [[TLPSceneCreationPanelView alloc] initWithFrame:sceneCreationFrame];
    self.sceneCreationPanel.tfDelegate = self;
    [view addSubview:self.sceneCreationPanel];
    
    CGRect minimapFrame = CGRectMake(self.sceneCreationPanel.frame.origin.x + self.sceneCreationPanel.frame.size.width + 60, self.sceneCreationPanel.frame.origin.y, self.sceneCreationPanel.frame.size.width, self.sceneCreationPanel.frame.size.height);
    self.minimap = [[TLPMinimap alloc] initWithFrame:minimapFrame];
//    self.minimap.backgroundColor = [UIColor blackColor];
    [view addSubview:self.minimap];
    
    [self.sceneCreationPanel setWidthTFAsFirstResponder];
    
    CGRect doneButtonFrame = CGRectMake(minimapFrame.size.width + minimapFrame.origin.x + 10, minimapFrame.origin.y, 100, 70);
    UIButton *doneButton = [[UIButton alloc] initWithFrame:doneButtonFrame];
    doneButton.backgroundColor = [UIColor whiteColor];
    [doneButton addTarget:self action:@selector(doneButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:doneButton];
}

- (void)doneButtonPressed
{
    
}

#pragma mark - delegate business
- (void)textFieldDidFinishEditing:(UITextField *)textField
{
    if (textField.tag == kWidthTextFieldTag) {
        [self.minimap updateLevelWidth:[textField.text floatValue]];
    } else if (textField.tag == kHeightTextFieldTag) {
        [self.minimap updateLevelHeight:[textField.text floatValue]];
    }
}

@end
