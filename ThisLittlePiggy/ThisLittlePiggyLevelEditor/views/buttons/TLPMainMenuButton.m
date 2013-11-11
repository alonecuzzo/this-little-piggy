//
//  TLPMainMenuButton.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/11/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPMainMenuButton.h"
#import "TLPFontHelper.h"
#import "UIColor+ThisLittlePiggy.h"

@implementation TLPMainMenuButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildButton];
    }
    return self;
}

- (void)buildButton
{
   self.titleLabel.font = [TLPFontHelper getFont:TLPFontRalewayExtraLight withSize:TLPFontSizeCityNameLarge];
    self.titleLabel.textColor = [UIColor thisLittlePiggySkyBlue];
    self.titleLabel.text = self.title;
}

@end
