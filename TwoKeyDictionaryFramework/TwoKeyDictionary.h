//
//  TwoKeyDictionary.h
//
//  Immutable version of a two key dictionary
//
//  Created by Seth Landsman <mailto:seth@homeforderangedscientists.net> on 10/2/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwoKeyMutableDictionary.h"

@interface TwoKeyDictionary : NSObject

// copy constructor for the dictionary
-(id)initWithDictionary:(TwoKeyMutableDictionary *)d;

// Retreive the object from the dictionary. Follows the same behavior as
//  NSMutableDictionary for failed retrievals
-(id)objectForKeyOne:(id)key1 andKeyTwo:(id)key2;

// Get a flat array of all values in the dictionary
-(NSArray *)allValues;

// Get a count of number of values in the dictionary. Short cut for
//  [[dict allValues] count];
-(NSUInteger)count;

@end
