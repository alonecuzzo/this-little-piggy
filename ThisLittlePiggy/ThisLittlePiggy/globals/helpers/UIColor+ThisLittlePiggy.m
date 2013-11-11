//
//  UIColor+ThisLittlePiggy.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "UIColor+ThisLittlePiggy.h"

@implementation UIColor (ThisLittlePiggy)

+ (instancetype)thisLittlePiggySkyBlue
{
    return [[self class] colorWithRed:154/255.0f green:234/255.0f blue:245/255.0f alpha:1.0f]; //9AEAF5
}

+ (instancetype)thisLittlePiggyPaleBlue
{
    return [[self class] colorWithRed:146/255.0f green:187/255.0f blue:208/255.0f alpha:1.0f]; //92bbd0
}

+ (instancetype)thisLittlePiggyDarkPaleBlue
{
    return [[self class] colorWithRed:116/255.0f green:158/255.0f blue:180/255.0f alpha:1.0f]; //749eb4
}

+ (instancetype)thisLittlePiggySkyDarkPurple
{
    return [[self class] colorWithRed:98/255.0f green:63/255.0f blue:97/255.0f alpha:1.0f];
}

@end
