//
//  TwoKeyDictionary.m
//
//  Immutable version of a two key dictionary
//
//  Created by Seth Landsman <mailto:seth@homeforderangedscientists.net> on 10/2/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import "TwoKeyDictionary.h"

@implementation TwoKeyDictionary

TwoKeyMutableDictionary *dict;

#pragma mark - Initialization routines

-(id)initWithDictionary:(TwoKeyMutableDictionary *)d
{
    self = [super init];
    if (self) {
        dict = d;
    }
    return self;
}

#pragma mark - Retrieve routines

-(id)objectForKeyOne:(id)key1 andKeyTwo:(id)key2
{
    return [dict objectForKeyOne:key1 andKeyTwo:key2];
}

#pragma mark - Flattening routines

-(NSArray *)allValues
{
    return [dict allValues];
}

-(NSUInteger)count 
{
    return [[self allValues] count];
}

@end
