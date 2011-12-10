/**
 TwoKeyDictionaryBase.m
 
 Abstract base class for Two Key dictionaries
 
 @copyright Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
 @author Seth Landsman <mailto:seth@homeforderangedscientists.net>
*/

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
        int_dict = [[NSMutableDictionary alloc] initWithDictionary:[d backingData]];
    }
    return self;
}

#pragma mark - Data access routines

-(NSMutableDictionary *)backingData
{
    return int_dict;
}

#pragma mark - Retrieve routines

-(id)objectForKeyOne:(id)key1 andKeyTwo:(id)key2
{
    NSDictionary *rowDict = [[self backingData] objectForKey:key1];
    if (rowDict == nil)
    {
        return nil;
    }
    return [rowDict objectForKey:key2];
}

-(id)objectForIndexOne:(int)key1 andIndexTwo:(int)key2
{
    NSNumber *k1 = [[NSNumber alloc] initWithInt:key1];
    NSNumber *k2 = [[NSNumber alloc] initWithInt:key2];
    
    return [self objectForKeyOne:k1 andKeyTwo:k2];
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
    NSLog(@"Number of rows is %lu", [[self backingData] count]);
    NSEnumerator *en = [[[self backingData] allKeys] objectEnumerator];
    id key;
    while (key = [en nextObject]) {
        NSLog(@"Got key %@", key);
    }
    NSLog(@"Object at 1,1 is %@", [self objectForKeyOne:[NSNumber numberWithInt:1] andKeyTwo:[NSNumber numberWithInt:1]]);
}

- (NSString *)description
{
    NSString *desc = [NSString stringWithFormat:@"%@:(", [self className]];
    NSEnumerator *first_key_en = [[self backingData] keyEnumerator];
    NSString *sep = @"";
    id first_key;
    while (first_key = [first_key_en nextObject])
    {
        NSDictionary *row_dict = [[self backingData] objectForKey:first_key];
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
