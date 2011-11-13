//
//  TwoKeyMutableDictionary.h
//
//  Mutable varient of a two key indexed dictionary.
//
//  Created by Seth Landsman <mailto:seth@homeforderangedscientists.net> on 10/2/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import "TwoKeyMutableDictionary.h"

@implementation TwoKeyMutableDictionary

#pragma mark - Properties

@synthesize int_dict;

#pragma mark - Initialization routines

-(id)init
{
    self = [super init];
    if (self) {
        int_dict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(id)initWithDictionary:(TwoKeyMutableDictionary *)data
{
    self = [super init];
    if (self) {
        int_dict = [[NSMutableDictionary alloc] initWithDictionary:data.int_dict];
    }
    return self;
}

#pragma mark - Set routines

-(void)setObject:(id)obj forKeyOne:(id)key1 andKeyTwo:(id)key2 
{
    NSMutableDictionary *rowDict = [int_dict objectForKey:key1];
    if (rowDict == nil) {
        rowDict = [[NSMutableDictionary alloc] init];
        [int_dict setObject:rowDict forKey:key1];
    }
    [rowDict setObject:obj forKey:key2];
}

#pragma mark - Retrieve routines

-(id)objectForKeyOne:(id)key1 andKeyTwo:(id)key2
{
    NSDictionary *rowDict = [int_dict objectForKey:key1];
    if (rowDict == nil)
    {
        return nil;
    }
    return [rowDict objectForKey:key2];
}

#pragma mark - Remove routines

-(void)removeObjectForKeyOne:(id)key1 andKeyTwo:(id)key2
{
    NSMutableDictionary *rowDict = [int_dict objectForKey:key1];
    if (rowDict != nil) {
        [rowDict removeObjectForKey:key2];
    }
}

#pragma mark - Clear and reset routines

-(void)removeAllObjects
{
    [int_dict removeAllObjects];
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


@end
