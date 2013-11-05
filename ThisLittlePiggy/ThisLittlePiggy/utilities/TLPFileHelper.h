//
//  TLPFileHelper.h
//  ThisLittlePiggy
//
//  Created by Jabari on 11/5/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLPFileHelper : NSObject

+ (NSString*)fullFileNameInDocumentsDirectory:(NSString*)filename;
+ (BOOL)fileExistsInDocumentsDirectory:(NSString*)filename;
+ (NSString*)dataFilePathForFileWithName:(NSString*)filename withExtension:(NSString*)extension forSave:(BOOL)forSave;
+ (void)createFolder:(NSString*)folderName;

@end
