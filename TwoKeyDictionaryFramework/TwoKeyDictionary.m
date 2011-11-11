//
//  TwoKeyDictionary.m
//  TwoKeyDictionaryFramework
//
//  Created by Seth Landsman on 10/29/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import "TwoKeyDictionary.h"

@implementation TwoKeyDictionary

TwoKeyMutableDictionary *dict;

-(id)init
{
    self = [super init];
    if (self) {
        dict = [[TwoKeyMutableDictionary alloc] init];
    }
    return self;
}

-(id)initWithDictionary:(TwoKeyMutableDictionary *)d
{
    self = [super init];
    if (self) {
        dict = d;
    }
    return self;
}

-(id)objectForKeyOne:(id)key1 andKeyTwo:(id)key2
{
    return [dict objectForKeyOne:key1 andKeyTwo:key2];
}

-(NSArray *)allValues
{
    return [dict allValues];
}

-(void)removeAllObjects
{
    return [dict removeAllObjects];
}

@end
