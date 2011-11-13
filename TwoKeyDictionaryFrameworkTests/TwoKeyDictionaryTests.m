//
//  TwoKeyDictionaryTests.m
//
//  Created by Seth Landsman <mailto:seth@homeforderangedscientists.net> on 10/2/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import "TwoKeyDictionaryTests.h"
#import "TwoKeyDictionaryFramework.h"

@interface TwoKeyDictionaryTests(private)

-(TwoKeyMutableDictionary *)buildSampleOfSize:(int)s;

@end

@implementation TwoKeyDictionaryTests

#pragma mark - properties

static NSString *DEFAULT_VALUE = @"SampleData";

#pragma mark - Test case management routines

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

#pragma mark - Test initialization

// test copy initalizaer, ensure that copying a dictionary of known size returns a property
//  populated dictionary
-(void)testCopyInit
{
    int c = 10;
    TwoKeyMutableDictionary *i = [self buildSampleOfSize:c];
    TwoKeyDictionary *d = [[TwoKeyDictionary alloc] initWithDictionary:i];
    
    STAssertNotNil(d, @"Constructor resulted in a nil object");
    NSArray *v = [d allValues];
    STAssertTrue(([v count] == c), @"Copy constructor should result appropriately sized dictionary");
}

#pragma mark - Test retrieval

// test retrieval, ensure that we can get sample values out of a known dictionary
-(void)testRetrieval
{
    int c = 10;
    TwoKeyMutableDictionary *d = [self buildSampleOfSize:c];
    TwoKeyDictionary *i = [[TwoKeyDictionary alloc] initWithDictionary:d];

    NSString *value = [i objectForKeyOne:[NSNumber numberWithInt:5] andKeyTwo:[NSNumber numberWithInt:5]];
    STAssertTrue((value == DEFAULT_VALUE), @"Value retrieved is not as expected");
    
    value = [i objectForKeyOne:[NSNumber numberWithInt:8] andKeyTwo:[NSNumber numberWithInt:8]];
    STAssertTrue((value == DEFAULT_VALUE), @"Value retrieved is not as expected");
}

#pragma mark - Test support methods

// Create a sample mutable dictionary of a known size with DEFAULT_VALUE populated values
-(TwoKeyMutableDictionary *)buildSampleOfSize:(int)s
{
    TwoKeyMutableDictionary *d = [[TwoKeyMutableDictionary alloc] init];
    for (int i=0; i<s; i++) {
        [d setObject:DEFAULT_VALUE forKeyOne:[NSNumber numberWithInt:i] andKeyTwo:[NSNumber numberWithInt:i]];
    }
    return d;
}

@end
