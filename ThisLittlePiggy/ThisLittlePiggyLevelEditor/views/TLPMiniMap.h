//
//  TLPMinimap.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScale 30

@interface TLPMinimap : UIView

- (void)updateLevelWidth:(CGFloat)width;
- (void)updateLevelHeight:(CGFloat)height;

@end
