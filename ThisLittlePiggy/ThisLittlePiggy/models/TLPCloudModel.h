//
//  TLPCloudModel.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/5/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPAbstractModel.h"

#define kDefaultCloudSpeed 2
#define kDefaultCloudSecondsUntilRain 3

@interface TLPCloudModel : TLPAbstractModel

@property CGPoint position;
@property float speed;
@property int secondsUntilRain;

@end
