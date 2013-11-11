//
//  TLPCreateLevelSizeView.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/10/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa/UIButton+RACCommandSupport.h>
#import <ReactiveCocoa/ReactiveCocoa/RACCommand.h>
#import "TLPLevelCreationSizeView.h"
#import "TLPMiniMap.h"
#import "TLPLevelCreationPanelView.h"
#import "RACSignal.h"

@interface TLPLevelCreationSizeView()

@property(nonatomic) TLPLevelCreationPanelView *levelCreationPanel;
@property(nonatomic) TLPMinimap *minimap;

@end

@implementation TLPLevelCreationSizeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildContents];
    }
    return self;
}

- (void)buildContents
{
    CGFloat panelWidth = 350;
    CGFloat panelHeight = 240;
    CGRect sceneCreationFrame = CGRectMake(CGRectGetMidX(self.frame) - (panelWidth / 2) - panelWidth + 40, CGRectGetMidY(self.frame) - (panelHeight / 2) - 150, panelWidth, panelHeight);
    
    self.levelCreationPanel = [[TLPLevelCreationPanelView alloc] initWithFrame:sceneCreationFrame];
    self.levelCreationPanel.tfDelegate = self;
    [self addSubview:self.levelCreationPanel];
    
    CGRect minimapFrame = CGRectMake(self.levelCreationPanel.frame.origin.x + self.levelCreationPanel.frame.size.width + 60, self.levelCreationPanel.frame.origin.y, self.levelCreationPanel.frame.size.width, self.levelCreationPanel.frame.size.height);
    self.minimap = [[TLPMinimap alloc] initWithFrame:minimapFrame];
    //    self.minimap.backgroundColor = [UIColor blackColor];
    [self addSubview:self.minimap];
    
    [self.levelCreationPanel setWidthTFAsFirstResponder];

    CGRect doneButtonFrame = CGRectMake(minimapFrame.size.width + minimapFrame.origin.x + 10, minimapFrame.origin.y, 100, 70);
    UIButton *doneButton = [[UIButton alloc] initWithFrame:doneButtonFrame];
    doneButton.backgroundColor = [UIColor whiteColor];
    id __weak weakSelf = self;
    doneButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        TLPLevelCreationSizeView *strongSelf = (TLPLevelCreationSizeView *)weakSelf;
        [strongSelf.levelCreationDelegate donePressed];
        return [RACSignal empty];
    }];

    [self addSubview:doneButton];
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
