//
//  TLPFontHelper.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    TLPFontRalewayThin,
    TLPFontRalewayExtraLight,
    TLPFontRalewayMedium,
    TLPFontRalewayHeavy
};
typedef NSInteger TLPFont;

enum {
    TLPFontSizeSmall                  = 28,
    TLPFontSizeCityNameLarge          = 40,
    TLPfontSizeLogoLarge              = 75,
    TLPFontSizeTemperatureReadingHuge = 220
};
typedef NSInteger TLPFontSize;

@interface TLPFontHelper : NSObject

+ (UIFont*)getFont:(TLPFont)font withSize:(TLPFontSize)size;
+ (NSString*)getFontString:(TLPFont)font;

+ (NSString*)fontNameForRalewayThin;
+ (NSString*)fontNameForRalewayExtraLight;
+ (NSString*)fontNameForRalewayMedium;
+ (NSString*)fontNameForRalewayHeavy;

@end
