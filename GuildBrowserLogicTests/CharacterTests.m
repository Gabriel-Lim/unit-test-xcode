//
//  CharacterTests.m
//  GuildBrowser
//
//  Created by Gabriel  on 26/10/12.
//  Copyright (c) 2012 Charlie Fulton. All rights reserved.
//

#import "CharacterTests.h"
#import "Character.h"
#import "Item.h"

@implementation CharacterTests {
    // Test cases can have instance variables, just like any other Objective-C class. We created the instance variable _characterDetailJson to store our sample JSON data.
    NSDictionary *_characterDetailJson;
    
    Character *_testGuy;
}

// setUp is called before each test case. This is useful because you only have to code up the loading once, and can manipulate this data however you wish in each test case.
-(void)setUp {
    // To correctly load the data file, remember this is running as a test bundle. We need to send self.class to the NSBundle method for finding bundled resources
    NSURL *dataServiceURL = [[NSBundle bundleForClass:self.class] URLForResource:@"character" withExtension:@"json"];
    NSData *sampleData = [NSData dataWithContentsOfURL:dataServiceURL];
    NSError *error;
    
    id json = [NSJSONSerialization JSONObjectWithData:sampleData options:kNilOptions error:&error];
    
    STAssertNotNil(json, @"invalid test data");
    
    _characterDetailJson = json;
    _testGuy = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
}

-(void)tearDown {
    // tearDown is called after each test case.
    _characterDetailJson = nil;
    _testGuy = nil;
}

// Here we are creating test cases for the Character class designated initializer method, which takes an NSDictionary from the JSON data and set up the properties in the class. This might seem trivial, but remember when developing the app, it's best to add the rests while you are incrementally developing the class.
-(void)testCreateCharacterFromDetailJson {
    // Here you are just validating that initWithCharacterDetailData does indeed return something, using another STAssert macro to make sure it's not nil.
    STAssertNotNil(_testGuy, @"Could not create character from detail json");
    
    // This is a negative test, verifying we still got a Character back even though you passed in a nil NSDictionary of data.
    Character *testGuy2 = [[Character alloc] initWithCharacterDetailData:nil];
    STAssertNotNil(testGuy2, @"Could not create character from nil data");
}

-(void)testCreateCharacterFromDetailJsonProps {
    STAssertEqualObjects(_testGuy.thumbnail, @"borean-tundra/171/40508075-avatar.jpg", @"thumbnail url is wrong");
    STAssertEqualObjects(_testGuy.name, @"Hagrel", @"name is wrong");
    STAssertEqualObjects(_testGuy.battleGroup, @"Emberstorm", @"battlegroup is wrong");
    STAssertEqualObjects(_testGuy.realm, @"Borean Tundra", @"realm is wrong");
    STAssertEqualObjects(_testGuy.achievementPoints, @3130, @"achievement points is wrong");
    STAssertEqualObjects(_testGuy.level,@85, @"level is wrong");
    
    STAssertEqualObjects(_testGuy.classType, @"Warrior", @"class type is wrong");
    STAssertEqualObjects(_testGuy.race, @"Human", @"race is wrong");
    STAssertEqualObjects(_testGuy.gender, @"Male", @"gener is wrong");
    STAssertEqualObjects(_testGuy.averageItemLevel, @379, @"avg item level is wrong");
    STAssertEqualObjects(_testGuy.averageItemLevelEquipped, @355, @"avg item level is wrong");
}

// 2
-(void)testCreateCharacterFromDetailJsonValidateItems
{
    STAssertEqualObjects(_testGuy.neckItem.name,@"Stoneheart Choker", @"name is wrong");
    STAssertEqualObjects(_testGuy.wristItem.name,@"Vicious Pyrium Bracers", @"name is wrong");
    STAssertEqualObjects(_testGuy.waistItem.name,@"Girdle of the Queen's Champion", @"name is wrong");
    STAssertEqualObjects(_testGuy.handsItem.name,@"Time Strand Gauntlets", @"name is wrong");
    STAssertEqualObjects(_testGuy.shoulderItem.name,@"Temporal Pauldrons", @"name is wrong");
    STAssertEqualObjects(_testGuy.chestItem.name,@"Ruthless Gladiator's Plate Chestpiece", @"name is wrong");
    STAssertEqualObjects(_testGuy.fingerItem1.name,@"Thrall's Gratitude", @"name is wrong");
    STAssertEqualObjects(_testGuy.fingerItem2.name,@"Breathstealer Band", @"name is wrong");
    STAssertEqualObjects(_testGuy.shirtItem.name,@"Black Swashbuckler's Shirt", @"name is wrong");
    STAssertEqualObjects(_testGuy.tabardItem.name,@"Tabard of the Wildhammer Clan", @"nname is wrong");
    STAssertEqualObjects(_testGuy.headItem.name,@"Vicious Pyrium Helm", @"neck name is wrong");
    STAssertEqualObjects(_testGuy.backItem.name,@"Cloak of the Royal Protector", @"neck name is wrong");
    STAssertEqualObjects(_testGuy.legsItem.name,@"Bloodhoof Legguards", @"neck name is wrong");
    STAssertEqualObjects(_testGuy.feetItem.name,@"Treads of the Past", @"neck name is wrong");
    STAssertEqualObjects(_testGuy.mainHandItem.name,@"Axe of the Tauren Chieftains", @"neck name is wrong");
    STAssertEqualObjects(_testGuy.offHandItem.name,nil, @"offhand should be nil");
    STAssertEqualObjects(_testGuy.trinketItem1.name,@"Rosary of Light", @"neck name is wrong");
    STAssertEqualObjects(_testGuy.trinketItem2.name,@"Bone-Link Fetish", @"neck name is wrong");
    STAssertEqualObjects(_testGuy.rangedItem.name,@"Ironfeather Longbow", @"neck name is wrong");
}


























@end
