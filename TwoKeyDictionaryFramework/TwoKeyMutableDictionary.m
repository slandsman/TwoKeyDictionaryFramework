/**
 TwoKeyMutableDictionary.h
 
 Mutable variant of a two key indexed dictionary.
 
 @copyright Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
 @author Seth Landsman <mailto:seth@homeforderangedscientists.net>
 
 */

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

-(void)setObject:(id)obj forIntegerKeyOne:(int)key1 andKeyTwo:(int)key2 
{
    NSNumber *k1 = [[NSNumber alloc] initWithInt:key1];
    NSNumber *k2 = [[NSNumber alloc] initWithInt:key2];
    [self setObject:obj forKeyOne:k1 andKeyTwo:k2];
}

#pragma mark - Remove routines

-(void)removeObjectForKeyOne:(id)key1 andKeyTwo:(id)key2
{
    NSMutableDictionary *rowDict = [[self backingData] objectForKey:key1];
    if (rowDict != nil) {
        [rowDict removeObjectForKey:key2];
    }
}

-(void)removeObjectForIntegerKeyOne:(int)key1 andKeyTwo:(int)key2
{
    NSNumber *k1 = [[NSNumber alloc] initWithInt:key1];
    NSNumber *k2 = [[NSNumber alloc] initWithInt:key2];

    [self removeObjectForKeyOne:k1 andKeyTwo:k2];
}

#pragma mark - Clear and reset routines

-(void)removeAllObjects
{
    [[self backingData] removeAllObjects];
}

@end
