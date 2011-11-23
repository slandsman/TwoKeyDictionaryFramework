//
//  TwoKeyDictionaryFrameworkTests.m
//
//  Created by Seth Landsman <mailto:seth@homeforderangedscientists.net> on 10/2/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import "TwoKeyDictionaryFrameworkTests.h"
#import "TwoKeyDictionary.h"
#import "TwoKeyMutableDictionary.h"

@implementation TwoKeyDictionaryFrameworkTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void)testBasicDescriptions
{
    TwoKeyMutableDictionary *tkmd = [[TwoKeyMutableDictionary alloc] init];
    NSLog(@"** Desc is %@", [tkmd description]);

    TwoKeyDictionary *tkd = [[TwoKeyDictionary alloc] init];
    NSLog(@"** Desc is %@", [tkd description]);
}

@end
