//
// Created by Jabari on 11/12/13.
// Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPLevelEditorModel.h"

@implementation TLPLevelEditorModel

+ (id)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[TLPLevelEditorModel alloc] init];
    });
    return sharedInstance;
}

@end