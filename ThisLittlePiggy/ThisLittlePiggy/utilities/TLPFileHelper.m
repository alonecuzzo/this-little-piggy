//
//  TLPFileHelper.m
//  ThisLittlePiggy
//
//  Created by Jabari on 11/5/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "TLPFileHelper.h"

@implementation TLPFileHelper

+ (NSString*)fullFileNameInDocumentsDirectory:(NSString *)filename
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentDirectoryPath stringByAppendingPathComponent:filename];
    return filePath;
}

+ (BOOL)fileExistsInDocumentsDirectory:(NSString *)filename
{
    NSString *filePath = [TLPFileHelper fullFileNameInDocumentsDirectory:filename];
    return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}

+ (NSString*)dataFilePathForFileWithName:(NSString *)filename withExtension:(NSString *)extension forSave:(BOOL)forSave
{
    NSString *filenameWithExtension = [filename stringByAppendingString:extension];
    NSLog(@"file name with extension: %@", filenameWithExtension);
    if (forSave || [TLPFileHelper fileExistsInDocumentsDirectory:filenameWithExtension]) {
        return [TLPFileHelper fullFileNameInDocumentsDirectory:filenameWithExtension];
    } else {
        return [[NSBundle mainBundle] pathForResource:filename ofType:extension];
    }
}

+ (void)createFolder:(NSString *)folderName
{
    NSString *dataPath = [TLPFileHelper fullFileNameInDocumentsDirectory:folderName];
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:nil];
    }
}

@end
