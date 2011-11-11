//
//  TwoKeyMutableDictionaryTests.m
//  TwoKeyDictionaryFramework
//
//  Created by Seth Landsman on 11/11/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import "TwoKeyMutableDictionaryTests.h"
#import "TwoKeyMutableDictionary.h"

@interface TwoKeyMutableDictionaryTests(private)

    -(TwoKeyMutableDictionary *)buildSampleOfSize:(int)s;

@end

@implementation TwoKeyMutableDictionaryTests

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
    TwoKeyMutableDictionary *d = [[TwoKeyMutableDictionary alloc] init];
    STAssertNotNil(d, @"Constructor resulted in a nil object");
    NSArray *v = [d allValues];
    STAssertTrue(([v count] == 0), @"Empty constructor should result in an empty dictionary");
}

-(void)testCopyInit
{
    int c = 10;
    TwoKeyMutableDictionary *i = [self buildSampleOfSize:c];
    TwoKeyMutableDictionary *d = [[TwoKeyMutableDictionary alloc] 
                                  initWithDictionary:(TwoKeyMutableDictionary *)i];

    STAssertNotNil(d, @"Constructor resulted in a nil object");
    NSArray *v = [d allValues];
    STAssertTrue(([v count] == c), @"Copy constructor should result appropriately sized dictionary");
}

-(void)testRetrieval
{
    int c = 10;
    TwoKeyMutableDictionary *i = [self buildSampleOfSize:c];
    NSString *value = [i objectForKeyOne:[NSNumber numberWithInt:5] andKeyTwo:[NSNumber numberWithInt:5]];
    STAssertTrue((value == DEFAULT_VALUE), @"Value retrieved is not as expected");

    value = [i objectForKeyOne:[NSNumber numberWithInt:8] andKeyTwo:[NSNumber numberWithInt:8]];
    STAssertTrue((value == DEFAULT_VALUE), @"Value retrieved is not as expected");
}

-(void)testDelete
{
    int c = 10;
    TwoKeyMutableDictionary *i = [self buildSampleOfSize:c];
    NSString *value = [i objectForKeyOne:[NSNumber numberWithInt:5] andKeyTwo:[NSNumber numberWithInt:5]];
    STAssertTrue((value == DEFAULT_VALUE), @"Value retrieved is not as expected");
    STAssertTrue(([[i allValues] count] == c), @"Count should be %i", c);
  
    [i removeObjectForKeyOne:[NSNumber numberWithInt:5] andKeyTwo:[NSNumber numberWithInt:5]];
    
    value = [i objectForKeyOne:[NSNumber numberWithInt:5] andKeyTwo:[NSNumber numberWithInt:5]];
    STAssertNil(value, @"Removed value should be nil");

    value = [i objectForKeyOne:[NSNumber numberWithInt:8] andKeyTwo:[NSNumber numberWithInt:8]];
    STAssertTrue((value == DEFAULT_VALUE), @"Value retrieved is not as expected");
    
    STAssertTrue(([[i allValues] count] == c-1), @"Count should be %i", c);
}

-(void)testPut
{
    int c = 10;
    TwoKeyMutableDictionary *i = [self buildSampleOfSize:c];

    NSString *v = @"New Value";
    NSString *k1 = @"Key 1";
    NSNumber *k2 = [NSNumber numberWithInt:50];
    [i setObject:v forKeyOne:k1 andKeyTwo:k2];
    
    STAssertTrue(([[i allValues] count] == c+1), @"Count should be %i", c);

    NSString *value = [i objectForKeyOne:[NSNumber numberWithInt:8] andKeyTwo:[NSNumber numberWithInt:8]];
    STAssertTrue((value == DEFAULT_VALUE), @"Value retrieved is not as expected");

    value = [i objectForKeyOne:k1 andKeyTwo:k2];
    STAssertTrue((value == v), @"Value retrieved is not as expected");
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
