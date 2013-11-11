//
//  TLPMenuScene.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPMainMenuScene.h"
#import "UIColor+ThisLittlePiggy.h"
#import "TLPMainMenuButton.h"
#import "UIButton+RACCommandSupport.h"
#import "RACCommand.h"
#import "RACSignal.h"
#import "TLPLevelCreationView.h"

@interface TLPMainMenuScene ()
@property(nonatomic, strong) UIView *parentView;
@end

@implementation TLPMainMenuScene
{
    TLPMainMenuButton *_createNewLevelButton;
    TLPLevelCreationSizeView *_levelSizeView;
    TLPLevelCreationView *_levelCreationView;
}

#pragma mark - init stuff
- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        self.backgroundColor = [UIColor thisLittlePiggySkyBlue];
    }
    return self;
}

#pragma mark - scene functions
- (void)didMoveToView:(SKView *)view
{
    _parentView = view;
    CGSize buttonSize = CGSizeMake(350.0f, 70.0f);
    CGRect newLevelButtonFrame = CGRectMake(CGRectGetMidX(self.frame) - (buttonSize.width / 2), CGRectGetMidY(self.frame) - 10 - (buttonSize.height / 2), buttonSize.width, buttonSize.height);
    _createNewLevelButton = [[TLPMainMenuButton alloc] initWithFrame:newLevelButtonFrame];
    [_createNewLevelButton setTitle:@"new level" forState:UIControlStateNormal];
    [_createNewLevelButton setTitleColor:[UIColor thisLittlePiggySkyBlue] forState:UIControlStateNormal
    ];

    id weakSelf = self;
    _createNewLevelButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        TLPMainMenuScene *strongSelf = (TLPMainMenuScene *)weakSelf;
        [UIView animateWithDuration:0.3f animations:^ {
            _createNewLevelButton.alpha = 0.0;
        } completion:^ (BOOL completed) {
            [_createNewLevelButton removeFromSuperview];
            _createNewLevelButton = nil;
            [strongSelf fadeLevelSizeViewIn];
        }];
        return [RACSignal empty];
    }];
    [_createNewLevelButton setBackgroundColor:[UIColor whiteColor]];
    [view addSubview:_createNewLevelButton];
}

- (void)fadeLevelSizeViewIn
{
    _levelSizeView = [[TLPLevelCreationSizeView alloc] initWithFrame:self.frame];
    _levelSizeView.levelCreationDelegate = self;
    _levelSizeView.alpha = 0.0f;
    [_parentView addSubview:_levelSizeView];

    [UIView animateWithDuration:0.3f animations:^ {
        _levelSizeView.alpha = 1.0f;
    } completion:^ (BOOL completed) {
        
    }];
}

- (void)donePressed
{
   [self fadeLevelCreationViewIn];
}

- (void)fadeLevelCreationViewIn
{
    _levelCreationView = [[TLPLevelCreationView alloc] initWithFrame:self.frame andLevelSize:[_levelSizeView levelSize]];
    _levelCreationView.alpha = 0.0f;
    [_parentView addSubview:_levelCreationView];

    [UIView animateWithDuration:0.3f animations:^{
       _levelSizeView.alpha = 0.0f;
        _levelCreationView.alpha = 1.0f;
    } completion:^ (BOOL completed) {
        [_levelSizeView removeFromSuperview];
        _levelSizeView = nil;
    }];
}

@end
