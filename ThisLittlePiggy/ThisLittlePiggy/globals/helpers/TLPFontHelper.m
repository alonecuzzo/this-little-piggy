//
//  TLPFontHelper.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPFontHelper.h"

@implementation TLPFontHelper

+ (UIFont*)getFont:(TLPFont)font withSize:(TLPFontSize)size
{
    return [UIFont fontWithName:[self getFontString:font] size:size];
}

+ (NSString*)getFontString:(TLPFont)font
{
    NSString *fontName;
    
    switch (font) {
        case TLPFontRalewayThin:
            fontName = [TLPFontHelper fontNameForRalewayThin];
            break;
            
        case TLPFontRalewayExtraLight:
            fontName = [TLPFontHelper fontNameForRalewayExtraLight];
            break;
            
        case TLPFontRalewayMedium:
            fontName = [TLPFontHelper fontNameForRalewayMedium];
            break;
            
        case TLPFontRalewayHeavy:
            fontName = [TLPFontHelper fontNameForRalewayHeavy];
            break;
    }
    
    return fontName;
}

+ (NSString*)fontNameForRalewayThin
{
    return @"Raleway-Thin";
}

+ (NSString*)fontNameForRalewayExtraLight
{
    return @"Raleway-ExtraLight";
}

+ (NSString*)fontNameForRalewayMedium
{
    return @"Raleway-Medium";
}

+ (NSString*)fontNameForRalewayHeavy
{
    return @"Raleway-Heavy";
}

@end
