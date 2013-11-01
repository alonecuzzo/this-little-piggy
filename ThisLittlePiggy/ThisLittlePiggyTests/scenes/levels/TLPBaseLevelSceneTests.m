//
//  TLPTLPAbstractLevelSceneTests.m
//  ThisLittlePiggy
//
//  Created by Jabari on 10/31/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TLPBaseLevelScene.h"
#import <objc/runtime.h>

@interface TLPBaseLevelSceneTests : XCTestCase

@end

@implementation TLPBaseLevelSceneTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

#pragma mark - property tests

- (void)testThatCreatedBaseLevelSceneIsNotNil
{
    TLPBaseLevelScene *myScene = [[TLPBaseLevelScene alloc] init];
    
    XCTAssertNotNil(myScene, @"Base level scene should be instantiated.");
}

- (void)testThatBaseLevelSceneHasWorldProperty
{
    objc_property_t worldBaseLevelSceneProperty = class_getProperty([[[TLPBaseLevelScene alloc] init] class], "world");
    
    XCTAssertTrue(worldBaseLevelSceneProperty != NULL, @"Base level scene should have world property.");
}

- (void)testThatBaseLevelSceneHasDefaultPlayerProperty
{
    objc_property_t defaultPlayerProperty = class_getProperty([[[TLPBaseLevelScene alloc] init] class], "defaultPlayer");
    
    XCTAssertTrue(defaultPlayerProperty != NULL, @"Base level scene should have default player property.");
}

#pragma mark - init value tests

- (void)testThatPlayerPropertyIsNotNilAfterSceneInitialized
{
    TLPBaseLevelScene *myScene = [[TLPBaseLevelScene alloc] initWithSize:CGSizeZero];
    
    XCTAssertNotNil(myScene.defaultPlayer, @"Default player value should be not nil after base level scene initwithsize called.");
}

@end
