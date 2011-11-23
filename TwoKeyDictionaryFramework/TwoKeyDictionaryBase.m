//
//  TwoKeyDictionaryBase.m
//  TwoKeyDictionaryFramework
//
//  Created by Seth Landsman <mailto:seth@homeforderangedscientists.net> on 10/2/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import "TwoKeyDictionaryBase.h"

@implementation TwoKeyDictionaryBase

#pragma mark - Initialization routines

-(id)init
{
    self = [super init];
    if (self) {
        int_dict = [[NSMutableDictionary alloc] init];
    }
    return self;    
}

-(id)initWithDictionary:(TwoKeyDictionaryBase *)d
{
    self = [super init];
    if (self) {
        int_dict = [[NSMutableDictionary alloc] initWithDictionary:[d getBackingData]];
    }
    return self;
}

#pragma mark - Data access routines

-(NSMutableDictionary *)getBackingData
{
    return int_dict;
}

#pragma mark - Retrieve routines

-(id)objectForKeyOne:(id)key1 andKeyTwo:(id)key2
{
    NSDictionary *rowDict = [[self getBackingData] objectForKey:key1];
    if (rowDict == nil)
    {
        return nil;
    }
    return [rowDict objectForKey:key2];
}

#pragma mark - Flattening routines

-(NSArray *)allValues
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSEnumerator *e = [int_dict objectEnumerator];
 
    NSDictionary *rowDict;
 
    while ((rowDict = [e nextObject])) {
        [array addObjectsFromArray:[rowDict allValues]];
    }
    return array;
}

-(NSUInteger)count 
{
    return [[self allValues] count];
}

#pragma mark - Debugging methods

-(void)debug
{
    NSLog(@"Number of objects is %lu", [self count]);
    NSLog(@"Number of rows is %lu", [[self getBackingData] count]);
    NSEnumerator *en = [[[self getBackingData] allKeys] objectEnumerator];
    id key;
    while (key = [en nextObject]) {
        NSLog(@"Got key %@", key);
    }
    NSLog(@"Object at 1,1 is %@", [self objectForKeyOne:[NSNumber numberWithInt:1] andKeyTwo:[NSNumber numberWithInt:1]]);
}

- (NSString *)description
{
    NSString *desc = [NSString stringWithFormat:@"%@:(", [self className]];
    NSEnumerator *first_key_en = [[self getBackingData] keyEnumerator];
    NSString *sep = @"";
    id first_key;
    while (first_key = [first_key_en nextObject])
    {
        NSDictionary *row_dict = [[self getBackingData] objectForKey:first_key];
        if (row_dict != nil)
        {
            NSEnumerator *second_key_en = [row_dict keyEnumerator];
            id second_key;
            while (second_key = [second_key_en nextObject])
            {
                desc = [desc stringByAppendingFormat:@"%@(%@, %@)=%@", sep, first_key,
                        second_key, [self objectForKeyOne:first_key andKeyTwo:second_key]];
                sep = @", ";
            }
        }
    }
    desc = [desc stringByAppendingString:@")"];
    return desc;
}

@end
