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


#pragma mark - Initialization routines

-(id)init
{
    return [super init];
}

-(id)initWithDictionary:(TwoKeyDictionaryBase *)data
{
    return [super initWithDictionary:data];
}

#pragma mark - Set routines

-(void)setObject:(id)obj forKeyOne:(id)key1 andKeyTwo:(id)key2 
{    
    NSMutableDictionary *rowDict = [[self backingData] objectForKey:key1];
    if (rowDict == nil) {
        rowDict = [[NSMutableDictionary alloc] init];
        [[self backingData] setObject:rowDict forKey:key1];
    }
    [rowDict setObject:obj forKey:key2];
}

#pragma mark - Remove routines

-(void)removeObjectForKeyOne:(id)key1 andKeyTwo:(id)key2
{
    NSMutableDictionary *rowDict = [[self backingData] objectForKey:key1];
    if (rowDict != nil) {
        [rowDict removeObjectForKey:key2];
    }
}

#pragma mark - Clear and reset routines

-(void)removeAllObjects
{
    [[self backingData] removeAllObjects];
}

@end
