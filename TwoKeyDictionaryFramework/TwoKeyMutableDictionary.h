//
//  TwoKeyMutableDictionary.h
//
//  Mutable varient of a two key indexed dictionary.
//
//  Created by Seth Landsman <mailto:seth@homeforderangedscientists.net> on 10/2/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwoKeyDictionaryBase.h"

@interface TwoKeyMutableDictionary : TwoKeyDictionaryBase

// copy constructor for the dictionary
-(id)initWithDictionary:(TwoKeyDictionaryBase *)data;

// Add an object to the dictionary. Overwrites the existing entry
//  if an entry already exists
-(void)setObject:(id)obj forKeyOne:(id)key1 andKeyTwo:(id)key2;

// Remove the object from the dictionary. Follows the same behavior as
//  NSMutableDictionary for failed retrievals
-(void)removeObjectForKeyOne:(id)key1 andKeyTwo:(id)key2;

// Remove all objects from the dictionary
-(void)removeAllObjects;

@end
