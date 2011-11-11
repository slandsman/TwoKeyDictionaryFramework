//
//  TwoKeyDictionaryTests.m
//  TwoKeyDictionaryFramework
//
//  Created by Seth Landsman on 11/11/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import "TwoKeyDictionaryTests.h"
#import "TwoKeyDictionaryFramework.h"

@interface TwoKeyDictionaryTests(private)

-(TwoKeyMutableDictionary *)buildSampleOfSize:(int)s;

@end

@implementation TwoKeyDictionaryTests

static NSString *DEFAULT_VALUE = @"SampleData";

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

-(void)testInit
{
    TwoKeyDictionary *d = [[TwoKeyDictionary alloc] init];
    STAssertNotNil(d, @"Constructor resulted in a nil object");
    NSArray *v = [d allValues];
    STAssertTrue(([v count] == 0), @"Empty constructor should result in an empty dictionary");
}

-(void)testCopyInit
{
    int c = 10;
    TwoKeyMutableDictionary *i = [self buildSampleOfSize:c];
    TwoKeyDictionary *d = [[TwoKeyDictionary alloc] initWithDictionary:i];
    
    STAssertNotNil(d, @"Constructor resulted in a nil object");
    NSArray *v = [d allValues];
    STAssertTrue(([v count] == c), @"Copy constructor should result appropriately sized dictionary");
}

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

-(TwoKeyMutableDictionary *)buildSampleOfSize:(int)s
{
    TwoKeyMutableDictionary *d = [[TwoKeyMutableDictionary alloc] init];
    for (int i=0; i<s; i++) {
        [d setObject:DEFAULT_VALUE forKeyOne:[NSNumber numberWithInt:i] andKeyTwo:[NSNumber numberWithInt:i]];
    }
    return d;
}

@end
