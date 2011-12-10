//
//  TwoKeyMutableDictionaryTests.m
//
//  Created by Seth Landsman <mailto:seth@homeforderangedscientists.net> on 10/2/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import "TwoKeyMutableDictionaryTests.h"
#import "TwoKeyMutableDictionary.h"

@interface TwoKeyMutableDictionaryTests(private)

    -(TwoKeyMutableDictionary *)buildSampleOfSize:(int)s;

@end

@implementation TwoKeyMutableDictionaryTests

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

// test basic initializer, ensure that it creates a valid, but empty, dictionary
-(void)testInit
{
    TwoKeyMutableDictionary *d = [[TwoKeyMutableDictionary alloc] init];
    STAssertNotNil(d, @"Constructor resulted in a nil object");
    NSArray *v = [d allValues];
    STAssertTrue(([v count] == 0), @"Empty constructor should result in an empty dictionary");
}

// test copy initalizaer, ensure that copying a dictionary of known size returns a property
//  populated dictionary
-(void)testCopyInit
{
    int c = 10;
    TwoKeyMutableDictionary *i = [self buildSampleOfSize:c];
    TwoKeyMutableDictionary *d = [[TwoKeyMutableDictionary alloc] 
                                  initWithDictionary:(TwoKeyMutableDictionary *)i];

    STAssertNotNil(d, @"Constructor resulted in a nil object");
    NSArray *v = [d allValues];
    STAssertTrue(([v count] == c), @"Copy constructor should result appropriately sized dictionary");
    NSLog(@"Dictionary is %@", [d description]);
}

#pragma mark - Test retrieval

// test retrieval, ensure that we can get sample values out of a known dictionary
-(void)testRetrieval
{
    int c = 10;
    TwoKeyMutableDictionary *i = [self buildSampleOfSize:c];
    NSString *value = [i objectForKeyOne:[NSNumber numberWithInt:5] andKeyTwo:[NSNumber numberWithInt:5]];
    STAssertTrue((value == DEFAULT_VALUE), @"Value retrieved is not as expected");

    value = [i objectForKeyOne:[NSNumber numberWithInt:8] andKeyTwo:[NSNumber numberWithInt:8]];
    STAssertTrue((value == DEFAULT_VALUE), @"Value retrieved is not as expected");
}

// test retrieval where using the boxed int variant, ensure that we can get sample values out of a known dictionary
-(void)testBoxedRetrieval
{
    int c = 10;
    TwoKeyMutableDictionary *i = [self buildSampleOfSize:c];
    NSString *value = [i objectForIntegerKeyOne:5 andKeyTwo:5];
    STAssertTrue((value == DEFAULT_VALUE), @"Value retrieved is not as expected");
    
    value = [i objectForIntegerKeyOne:8 andKeyTwo:8];
    STAssertTrue((value == DEFAULT_VALUE), @"Value retrieved is not as expected");
}

#pragma mark - Test delete

// test delete, ensure that removing a known value from a dictionary results in a valid dictionary, of
//  expected size, with the deleted object removed.
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

// test delete, ensure that removing a known value from a dictionary results in a valid dictionary, of
//  expected size, with the deleted object removed.
-(void)testBoxedDelete
{
    int c = 10;
    TwoKeyMutableDictionary *i = [self buildSampleOfSize:c];
    NSString *value = [i objectForIntegerKeyOne:5 andKeyTwo:5];
    STAssertTrue((value == DEFAULT_VALUE), @"Value retrieved is not as expected");
    STAssertTrue(([[i allValues] count] == c), @"Count should be %i", c);
    
    [i removeObjectForIntegerKeyOne:5 andKeyTwo:5];
    
    value = [i objectForIntegerKeyOne:5 andKeyTwo:5];
    STAssertNil(value, @"Removed value should be nil");
    
    value = [i objectForIntegerKeyOne:8 andKeyTwo:8];
    STAssertTrue((value == DEFAULT_VALUE), @"Value retrieved is not as expected");
    
    STAssertTrue(([[i allValues] count] == c-1), @"Count should be %i", c);
}

#pragma mark - Test put

// test int boxed put, ensure that adding a new object to the dictionary results in a valid dictionary, of 
//  expected size, with the new object added
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

#pragma mark - Test regression cases

// Test the case where creating a second TKD in the same scope overwrote the internal backing data of the
//  original TKD. Basically, the internal data store was being treated as a static member
-(void)testBackingDataStoreShouldNotBeStatic
{
    int c = 10;
    TwoKeyMutableDictionary *i = [self buildSampleOfSize:c];
    STAssertTrue(([[i allValues] count] == c), @"Count should be %i", c);
    NSString *value = [i objectForKeyOne:[NSNumber numberWithInt:8] andKeyTwo:[NSNumber numberWithInt:8]];
    STAssertTrue((value == DEFAULT_VALUE), @"Value retrieved is not as expected");
    
    TwoKeyMutableDictionary *d = [[TwoKeyMutableDictionary alloc] init];
    [d removeAllObjects];
    STAssertTrue(([[d allValues] count] == 0), @"Count should be %i", c);
    
    STAssertTrue(([[i allValues] count] == c), @"Count should be %i", c);
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
