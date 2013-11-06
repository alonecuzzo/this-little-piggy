//
//  TLPLevelHandler.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/5/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TLPCloudModel;

@interface TLPLevelHandler : NSObject

@property NSMutableArray *clouds;

- (id)initWithFileName:(NSString*)filename;

@end
