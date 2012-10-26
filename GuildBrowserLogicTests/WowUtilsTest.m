//
//  WowUtilsTest.m
//  GuildBrowser
//
//  Created by Gabriel  on 26/10/12.
//  Copyright (c) 2012 Charlie Fulton. All rights reserved.
//

#import "WowUtilsTest.h"
#import "WoWUtils.h"

@implementation WowUtilsTest

// All test caess must start with the name test
-(void)testCharacterClassNameLookup {
    // The expectation is that the WowUtils class will give the correct class name, given an ID. The way you verify this expectation is with the STAssert macros.
    STAssertEqualObjects(@"Warrior", [WoWUtils classFromCharacterType:1], @"ClassType should be Warrior");
    
    // It's always good to include a failing test in your test case. This is a test where the result is expected to fail.
    STAssertFalse([@"Mage" isEqualToString:[WoWUtils classFromCharacterType: 2]], nil);
    
    // Another example test macro.
    STAssertTrue([@"Paladin" isEqualToString:[WoWUtils classFromCharacterType:2]], nil);
    
    // Add the rest as an exercise
}

-(void)testRaceTypeLookup {
    STAssertEqualObjects(@"Human", [WoWUtils raceFromRaceType:1], nil);
    STAssertEqualObjects(@"Orc", [WoWUtils raceFromRaceType:2], nil);
    STAssertFalse([@"Night Elf" isEqualToString:[WoWUtils raceFromRaceType:45]], nil);
    
    // Add the rest as an exercise
}

-(void)testQualityLookup {
    STAssertEquals(@"Grey", [WoWUtils qualityFromQualityType:1], nil);
    STAssertFalse([@"Purple" isEqualToString:[WoWUtils qualityFromQualityType:10]], nil);
    
    // Add the rest as an exercise
}

@end
