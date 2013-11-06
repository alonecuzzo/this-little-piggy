//
//  TLPLevelHandler.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/5/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPLevelHandler.h"
#import "TLPCloudModel.h"
#import "TLPFileHelper.h"
#import "TLPAbstractModel.h"
#import <GDataXMLNode.h>

@implementation TLPLevelHandler {
    NSString *_filename;
}

- (id)initWithFileName:(NSString*)filename
{
    self = [super init];
    if (self) {
        _filename = filename;
        [self loadFile];
    }
    return self;
}

- (void)loadFile
{
    NSString *filePath = [TLPFileHelper dataFilePathForFileWithName:_filename withExtension:@".xml" forSave:NO];
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData encoding:NSStringEncodingConversionAllowLossy error:nil];
    
    self.clouds = [NSMutableArray arrayWithCapacity:5];
    
    if (doc == nil) {
        return;
    }
   
    GDataXMLElement *cloudsElement = [doc.rootElement elementsForName:@"clouds"][0];
    NSArray *cloudElements = [cloudsElement elementsForName:@"cloud"];
    
    for (GDataXMLElement *cloud in cloudElements) {
//        NSLog(@"cloud: %@", cloud);
        
        TLPCloudModel *model = [[TLPCloudModel alloc] init];
        
        model.id = [cloud attributeForName:@"id"].stringValue.intValue;
        model.position = CGPointMake([cloud attributeForName:@"start-point-x"].stringValue.floatValue, [cloud attributeForName:@"start-point-y"].stringValue.floatValue);
        model.secondsUntilRain = [cloud attributeForName:@"seconds-until-rain"].stringValue.intValue;
        
        [self.clouds addObject:model];
    }
}

+ (TLPAbstractModel*)getModelWithID:(int)id fromArray:(NSArray*)array
{
    for (TLPAbstractModel *model in array){
        if (model.id == id) {
            return model;
        }
    }
    return  nil;
}

- (TLPCloudModel*)getCloudWithID:(int)id
{
    return (TLPCloudModel*)[TLPLevelHandler getModelWithID:id fromArray:self.clouds];
}

@end
