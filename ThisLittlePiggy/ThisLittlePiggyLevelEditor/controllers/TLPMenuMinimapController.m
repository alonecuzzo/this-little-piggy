//
// Created by Jabari on 11/12/13.
// Copyright (c) 2013 23bit. All rights reserved.
//


#import <ReactiveCocoa/ReactiveCocoa/RACSignal.h>
#import "TLPMenuMinimapController.h"
#import "TLPLevelCreationMenuMinimap.h"
#import "RACSubscriptingAssignmentTrampoline.h"
#import "NSObject+RACPropertySubscribing.h"
#import "TLPLevelEditorModel.h"

@interface TLPMenuMinimapController()

@property(nonatomic) CGPoint levelCoordinate;

@end


@implementation TLPMenuMinimapController

- (id)initWithMenuMinimap:(TLPLevelCreationMenuMinimap *)minimap
{
    self = [super init];
    if (self) {

        TLPLevelEditorModel *model = [TLPLevelEditorModel sharedInstance];

        [RACObserve(model, levelCoordinate) subscribeNext:^(id point) {
            [minimap scrollViewToPoint:[point CGPointValue]];
        }];
    }
    return self;
}


@end