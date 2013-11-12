//
//  TLPLevelCreationViewController.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/12/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPLevelCreationViewController.h"
#import "TLPLevelEditorModel.h"

@implementation TLPLevelCreationViewController

- (void)updateLevelCoordinate:(CGPoint)point
{
    [[TLPLevelEditorModel sharedInstance] setLevelCoordinate:point];
}

@end
