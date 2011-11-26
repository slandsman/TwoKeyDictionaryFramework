//
//  TwoKeyDictionaryBase.h
//
//  Abstract base class for Two Key dictionaries
//
//  Created by Seth Landsman <mailto:seth@homeforderangedscientists.net> on 10/2/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwoKeyDictionaryBase : NSObject
{
    // instance variable containing the backing store
    NSMutableDictionary *int_dict;
}

// copy constructor for the dictionary
-(id)initWithDictionary:(TwoKeyDictionaryBase *)d;

// retrieve the backing data source
-(NSMutableDictionary *)backingData;

// Retreive the object from the dictionary. Follows the same behavior as
//  NSMutableDictionary for failed retrievals
-(id)objectForKeyOne:(id)key1 andKeyTwo:(id)key2;

// Get a flat array of all values in the dictionary
-(NSArray *)allValues;

// Get a count of number of values in the dictionary. Short cut for
//  [[dict allValues] count];
-(NSUInteger)count;

@end
