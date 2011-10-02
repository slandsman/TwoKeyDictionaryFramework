//
//  TwoKeyMutableDictionary.m
//  GameOfLife
//
//  Created by Seth Landsman on 9/10/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import "TwoKeyMutableDictionary.h"

@implementation TwoKeyMutableDictionary

@synthesize int_dict;

-(id)init
{
    self = [super init];
    if (self) {
        int_dict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)setObject:(id)obj forKeyOne:(id)key1 andKeyTwo:(id)key2 
{
    NSMutableDictionary *rowDict = [int_dict objectForKey:key1];
    if (rowDict == nil) {
        rowDict = [[NSMutableDictionary alloc] init];
        [int_dict setObject:rowDict forKey:key1];
    }
    [rowDict setObject:obj forKey:key2];
}

-(id)objectForKeyOne:(id)key1 andKeyTwo:(id)key2
{
    NSDictionary *rowDict = [int_dict objectForKey:key1];
    if (rowDict == nil)
    {
        return nil;
    }
    return [rowDict objectForKey:key2];
}

-(void)removeObjectForKeyOne:(id)key1 andKeyTwo:(id)key2
{
    NSMutableDictionary *rowDict = [int_dict objectForKey:key1];
    if (rowDict != nil) {
        [rowDict removeObjectForKey:key2];
    }
}


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

-(void)removeAllObjects
{
    [int_dict removeAllObjects];
}

@end
