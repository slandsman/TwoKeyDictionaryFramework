/**
 TwoKeyDictionary.h
 
 Immutable version of a two key dictionary
 
 @copyright Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
 @author Seth Landsman <mailto:seth@homeforderangedscientists.net>
 
 */

#import <Foundation/Foundation.h>
#import "TwoKeyDictionaryBase.h"
#import "TwoKeyMutableDictionary.h"

@interface TwoKeyDictionary : TwoKeyDictionaryBase

/** 
 copy constructor for the dictionary
 
 @param data Another two key dictionary
 */
-(id)initWithDictionary:(TwoKeyMutableDictionary *)data;

/**
 Clone the dictioanry into a mutable copy
 
 @returns a mutable instance of a two key dictionary with data shallowly copied from the original
 
 */
-(TwoKeyMutableDictionary *)mutableCopy;

@end
