//
//  TLPCloudModel.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/5/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPCloudModel.h"

@implementation TLPCloudModel

- (id)init
{
    self = [super init];
    if (self) {
        _speed = kDefaultCloudSpeed;
        _secondsUntilRain = kDefaultCloudSecondsUntilRain;
    }
    return  self;
}

@end
