//
//  TwoKeyMutableDictionary.h
//
//  Mutable varient of a two key indexed dictionary.
//
//  Created by Seth Landsman <mailto:seth@homeforderangedscientists.net> on 10/2/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwoKeyMutableDictionary : NSObject

// internal dictionary definition, which should only be used for
//  the copy constructor.
// TODO how can I better hide this property yet still allow a copy constructor to be used?
@property(strong) NSMutableDictionary *int_dict;

// copy constructor for the dictionary
-(id)initWithDictionary:(TwoKeyMutableDictionary *)data;

// Add an object to the dictionary. Overwrites the existing entry
//  if an entry already exists
-(void)setObject:(id)obj forKeyOne:(id)key1 andKeyTwo:(id)key2;

// Retreive the object from the dictionary. Follows the same behavior as
//  NSMutableDictionary for failed retrievals
-(id)objectForKeyOne:(id)key1 andKeyTwo:(id)key2;

// Remove the object from the dictionary. Follows the same behavior as
//  NSMutableDictionary for failed retrievals
-(void)removeObjectForKeyOne:(id)key1 andKeyTwo:(id)key2;

// Remove all objects from the dictionary
-(void)removeAllObjects;

// Get a flat array of all values in the dictionary
-(NSArray *)allValues;

// Get a count of number of values in the dictionary. Short cut for
//  [[dict allValues] count];
-(NSUInteger)count;

@end
