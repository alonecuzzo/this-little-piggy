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

@property (nonatomic) TLPBaseLevelScene *myScene;

@end

@implementation TLPBaseLevelSceneTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    _myScene = [[TLPBaseLevelScene alloc] initWithSize:CGSizeZero];
}

- (void)tearDown
{
    _myScene = nil;
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

#pragma mark - property tests

- (void)testThatCreatedBaseLevelSceneIsNotNil
{
    XCTAssertNotNil(_myScene, @"Base level scene should be instantiated.");
}

- (void)testThatBaseLevelSceneHasWorldProperty
{
    objc_property_t worldBaseLevelSceneProperty = class_getProperty([_myScene class], "world");
    
    XCTAssertTrue(worldBaseLevelSceneProperty != NULL, @"Base level scene should have world property.");
}

- (void)testThatBaseLevelSceneHasDefaultPlayerProperty
{
    objc_property_t defaultPlayerProperty = class_getProperty([_myScene class], "defaultPlayer");
    
    XCTAssertTrue(defaultPlayerProperty != NULL, @"Base level scene should have default player property.");
}

- (void)testThatBaseLevelSceneHasPlayersProperty
{
    objc_property_t playersProperty = class_getProperty([_myScene class], "players");
    
    XCTAssertTrue(playersProperty != NULL, @"Base level scene should have players property.");
}

- (void)testThatBaseLevelSceneHasLayersProperty
{
    objc_property_t layersProperty = class_getProperty([_myScene class], "layers");
    
    XCTAssertTrue(layersProperty != NULL, @"Base level scene should have layers property.");
}

#pragma mark - init value tests

- (void)testThatDefaultPlayerPropertyIsNotNilAfterSceneInitialized
{
    XCTAssertNotNil(_myScene.defaultPlayer, @"Default player value should be not nil after base level scene initwithsize called.");
}

- (void)testThatPlayersLengthMatchesNumPlayers
{
    XCTAssertTrue(_myScene.players.count == kNumPlayers, @"Players count should equal num players constant in base level scene.");
}

- (void)testThatWorldIsNotNilAfterSceneIsInitialized
{
    XCTAssertNotNil(_myScene.world, @"World should be initialized after initwithsize called in base level scene.");
}

- (void)testThatWorldIsNamedProperlyAfterInitialization
{
    XCTAssertEqualObjects(_myScene.world.name, kWorldName, @"The world should be named world.");
}

@end
